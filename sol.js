// Core language.

module.exports = (function(){

  // Constructors
  var VAR = 0, Var = function(idx){ return {ctor:VAR, idx:idx}; };
  var APP = 1, App = function(fun,arg){ return {ctor:APP, fun:fun, arg:arg}; };
  var LAM = 2, Lam = function(typ,bod){ return {ctor:LAM, typ:typ, bod:bod}; };
  var FOR = 3, For = function(typ,bod){ return {ctor:FOR, typ:typ, bod:bod}; };
  var FIX = 4, Fix = function(ter){ return {ctor:FIX, ter:ter}; };
  var SET = 5, Set = {ctor:SET};
  var NUM = 6, Num = function(val){ return {ctor:NUM, val:val}; };
  var NOP = 7, Nop = function Nop(o, a, b){ return {ctor:NOP, o:o, a:a, b:b}; };
  var NAP = 8, Nap = function Nap(n, f, x){ return {ctor:NAP, n:n, f:f, x:x}; };
  var NTY = 9, Nty = {ctor:NTY};
  var VALUE = 0, TYPE = 1;

  // Typechecker and evaluator
  function hoas(term, mode, bipass){
    function extend(val, typ, ctx){
      return {
        vals: {head:val, tail:ctx.vals},
        typs: {head:typ, tail:ctx.typs},
        depth: ctx.depth + 1};
    };
    function check(a,b){
      return (function check(a, b, d){
        if (a.ctor === FIX && b.ctor !== FIX) return check(a.ter(a),b,d);
        if (a.ctor !== FIX && b.ctor === FIX) return check(a,b.ter(b),d);
        switch (a.ctor + b.ctor * NTY){
          case VAR + VAR*NTY: return d-a.idx-1 === d-b.idx-1;
          case FIX + FIX*NTY: return check(a.ter(Var(d)),b.ter(Var(d)),d);
          case APP + APP*NTY: return check(a.fun,b.fun,d) && check(a.arg,b.arg,d);
          case LAM + LAM*NTY: return check(a.typ,b.typ,d) && check(a.bod(Var(d)),b.bod(Var(d)),d+1);
          case FOR + FOR*NTY: return check(a.typ,b.typ,d) && check(a.bod(Var(d)),b.bod(Var(d)),d+1);
          case SET + SET*NTY: return true;
          case NUM + NUM*NTY: return a.val === b.val;
          case NOP + NOP*NTY: return check(a.o,b.o,d) && check(a.a,b.a,d) && check(a.b,b.b,d);
          case NAP + NAP*NTY: return check(a.n,b.n,d) && check(a.f,b.f,d) && check(a.x,b.x,d);
          case NTY + NTY*NTY: return true;
        };
        return false;
      })(a,b,0);
    };
    function eval(term, mode, ctx){
      switch (term.ctor){
        case VAR: // Variables
          var vars = mode === TYPE ? ctx.typs : ctx.vals;
          for (var i=0, l=term.idx; i<l; ++i)
            vars = vars.tail;
          return vars.head;
        case APP: // Appliation
          var f = eval(term.fun, mode, ctx);
          var x = eval(term.arg, VALUE, ctx);
          if (f.ctor === FIX)
            f = f.ter(f);
          if (mode === TYPE){
            var xt = eval(term.arg, TYPE, ctx);
            if (!bipass && f.ctor !== FOR)
              errors.push({type: "NotAFunction"});
            if (!bipass && f.ctor === FOR && !check(f.typ, xt))
              errors.push({type: "TypeMismatch", term: quote(0,x), expected: quote(0,f.typ||Set), actual: quote(0,xt)});
            return f.ctor === FOR ? f.bod(x) : App(f, x);
          } else {
            return f.ctor === LAM ? f.bod(x) : App(f, x);
          };
        case LAM: // Abstraction
          var typ = eval(term.typ, VALUE, ctx);
          var val = function(v){ return eval(term.bod, mode, extend(v, typ, ctx)); };
          return mode ? For(typ, val) : Lam(typ, val);
        case FOR: // Forall (aka Pi)
          if (mode === TYPE){
            var typt = eval(term.typ, TYPE, ctx);
            var typv = eval(term.typ, VALUE, ctx);
            var bodt = eval(term.bod, TYPE, extend(Set, typv, ctx));
            if (!check(typt, Set) || !check(bodt, Set))
              errors.push({type: "InvalidInputType"});
            return Set;
          } else {
            var typ = eval(term.typ, VALUE, ctx);
            var val = function(v){ return eval(term.bod, 0, extend(v, typ, ctx)); };
            return For(typ, val);
          };
        case FIX: // Fixed points
          if (mode === TYPE){
            return Set;
          } else {
            return Fix(function(v){ return eval(term.ter, mode, extend(v, Set, ctx))});
          };
        case SET: // The type of types
          return Set;
        case NTY: // The type of numbers
          return mode === TYPE ? Set : Nty;
        case NUM: // Number literal
          return mode === TYPE ? Nty : Num(term.val);
        case NOP: // Binary numeric operation
          var o = eval(term.o, mode, ctx);
          var a = eval(term.a, mode, ctx);
          var b = eval(term.b, mode, ctx);
          if (mode === TYPE){
            if (!bipass && (o.ctor !== NTY || a.ctor !== NTY || b.ctor !== NTY))
              errors.push({type: "TypeError"});
            return Nty;
          } else {
            if (o.ctor === NUM && a.ctor === NUM && b.ctor === NUM){
              switch (o.val){
                case  0: return Num(a.val + b.val);
                case  1: return Num(a.val - b.val);
                case  2: return Num(a.val * b.val);
                case  3: return Num(a.val / b.val);
                case  4: return Num(((a.val % b.val) + b.val) % b.val);
                case  5: return Num(Math.pow(a.val, b.val));
                case  6: return Num(Math.log(a.val) / Math.log(b.val));
                case  7: return Num(a.val * Math.sin(b.val));
                case  8: return Num(a.val * Math.asin(b.val));
                case  9: return Num(a.val * Math.cos(b.val));
                case 10: return Num(a.val * Math.acos(b.val));
                case 11: return Num(a.val * Math.tan(b.val));
                case 12: return Num(a.val * Math.atan(b.val));
                case 13: return Num(Math.atan2(a.val,b.val));
                case 14: return Num(Math.min(a.val,b.val));
                case 15: return Num(Math.max(a.val,b.val));
                case 16: return Num(a.val  <  b.val ? 1 : 0);
                case 17: return Num(a.val  <= b.val ? 1 : 0);
                case 18: return Num(a.val  >  b.val ? 1 : 0);
                case 19: return Num(a.val  >= b.val ? 1 : 0);
                case 20: return Num(a.val === b.val ? 1 : 0);
                case 21: return Num(Math.floor(a.val) + Math.ceil(b.val));
                default: return Num(a.val + b.val);
              };
            };
            return Nop(o, a, b);
          };
        case NAP: // Constant-space loop (applies a function `n` times to a value)
          var n = eval(term.n, mode, ctx);
          var f = eval(term.f, mode, ctx);
          var x = eval(term.x, VALUE, ctx);
          if (mode === TYPE){
            if (!bipass && (!check(n,Nty) || f.ctor !== FOR || !check(f.typ, eval(term.x,1,ctx))))
              errors.push({type: "TypeError"});
            return f.bod(x);
          } else {
            if (n.ctor === NUM && f.ctor === LAM){
              for (var i=0, l=n.val; i<l; ++i)
                x = f.bod(x);
              return x;
            } else return Nap(n, f, x);
          };
      };
    };
    function quote(d, term, fix){
      switch (term.ctor){
        case VAR: return Var(d - term.idx - 1);
        case APP: return App(quote(d, term.fun, fix), quote(d, term.arg, fix));
        case LAM: return Lam(quote(d, term.typ, fix), quote(d+1, term.bod(Var(d)), fix));
        case FOR: return For(quote(d, term.typ, fix), quote(d+1, term.bod(Var(d)), fix));
        case FIX: return Fix(quote(d+1, term.ter(Var(d)), fix));
        case SET: return Set;
        case NUM: return Num(term.val);
        case NOP: return Nop(quote(d, term.o, fix), quote(d, term.a, fix), quote(d, term.b, fix));
        case NAP: return Nap(quote(d, term.n, fix), quote(d, term.f, fix), quote(d, term.x, fix));
        case NTY: return Nty;
      };
    };
    var errors = [];
    var result = quote(0, eval(term, mode, {typs:null, vals:null, depth: 0}), false);
    return {term: errors.length === 0 ? result : null, errors: errors};
  };

  // Reduces to normal form
  function norm(term){
    return hoas(term, 0, 1).term;
  };

  // Infers type
  function type(term, bipass){
    return hoas(term, 1, bipass).term;
  };

  return {
    Var: Var, VAR: VAR,
    App: App, APP: APP,
    Lam: Lam, LAM: LAM,
    For: For, FOR: FOR,
    Fix: Fix, FIX: FIX,
    Set: Set, SET: SET,
    Num: Num, NUM: NUM,
    Nop: Nop, NOP: NOP,
    Nap: Nap, NAP: NAP,
    Nty: Nty, NTY: NTY,
    hoas: hoas,
    norm: norm,
    type: type
  };
})();
