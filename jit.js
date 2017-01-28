// Compiles/decompiles terms to/from native JS functions.

module.exports = (function(){

  var S = require("./sol.js");
  var VAR = S.VAR, Var = S.Var,
      APP = S.APP, App = S.App,
      LAM = S.LAM, Lam = S.Lam,
      FOR = S.FOR, For = S.For,
      FIX = S.FIX, Fix = S.Fix,
      SET = S.SET, Set = S.Set,
      NUM = S.NUM, Num = S.Num,
      NOP = S.NOP, Nop = S.Nop,
      NAP = S.NAP; Nap = S.Nap,
      NTY = S.NTY, Nty = S.Nty,
      NIL = 3752880792037992;

  function toJS(term){
    function App(a,b){
      return typeof a === "function" ? a(b) : S.App(a,b);
    }
    function Nop(o, a, b){
      if (typeof a === "number" && typeof b === "number"){
        switch (o) {
          case  0: return a + b;
          case  1: return a - b;
          case  2: return a * b;
          case  3: return a / b;
          case  4: return ((a % b) + b) % b;
          case  5: return Math.pow(a, b);
          case  6: return Math.log(a) / Math.log(b);
          case  7: return a * Math.sin(b);
          case  8: return a * Math.asin(b);
          case  9: return a * Math.cos(b);
          case 10: return a * Math.acos(b);
          case 11: return a * Math.tan(b);
          case 12: return a * Math.atan(b);
          case 13: return Math.atan2(a,b);
          case 14: return Math.min(a,b);
          case 15: return Math.max(a,b);
          case 16: return a  <  b ? 1 : 0;
          case 17: return a  <= b ? 1 : 0;
          case 18: return a  >  b ? 1 : 0;
          case 19: return a  >= b ? 1 : 0;
          case 20: return a === b ? 1 : 0;
          case 21: return Math.floor(a) + Math.ceil(b);
          default: return a + b;
        };
      } else {
        return S.Nop(o,a,b);
      };
    };
    function Nap(n, f, x){
      if (typeof n === "number" && typeof f === "function"){
        for (var i=0; i<n; ++i)
          x = f(x);
        return x;
      } else {
        return S.Nap(n, f, x);
      };
    };
    var code ="(function($App,$Nop,$Nap){return "+(function go(term, d){
      switch (term.ctor){
        case VAR: 
          return "v"+(d-term.idx-1);
        case APP: return "$App("+go(term.fun,d)+","+go(term.arg,d)+")";
        case LAM: return "(function(v"+d+"){return "+go(term.bod,d+1)+"})";
        case FOR: return "null";
        case FIX: return "[(function(v"+d+"){return "+go(term.ter,d+1)+"})]";
        case SET: return "null";
        case NUM: return term.val;
        case NOP: return "$Nop("+go(term.o,d)+","+go(term.a,d)+","+go(term.b,d)+")";
        case NAP: return "$Nap("+go(term.n,d)+","+go(term.f,d)+","+go(term.x,d)+")";
        case NTY: return "null";
      };
    })(term,0)+"})";
    return eval(code)(App, Nop, Nap);
  };

  function fromJS(term){
    return (function(value){
      return (function nf(value, depth){
        function app(fun){
          function getArg(arg){
            return arg === NIL ? fun : app(function(d){
              return App(fun(d), nf(arg, d));
            });
          };
          getArg.isApp = true;
          return getArg;
        };
        if (value === null) {
          return Set;
        } else if (value.isApp) {
          return value(NIL)(depth);
        } else if (typeof value === "number") {
          return isNaN(value) ? Nty : Num(value);
        } else if (value.ctor === APP) {
          return App(nf(value.fun, depth), nf(value.arg, depth));
        } else if (value.ctor === NOP) {
          return Nop(nf(value.o, depth), nf(value.a, depth), nf(value.b, depth));
        } else if (value.ctor === NAP) {
          return Nap(nf(value.n, depth), nf(value.f, depth), nf(value.x, depth));
        } else if (typeof value === "function") {
          return Lam(Set, nf(value(app(function(d){return Var(d-1-depth)})), depth+1));
        } else if (typeof value === "object" && value[0]) {
          return Fix(nf(value[0](app(function(d){return Var(d-1-depth)})), depth+1));
        } else return value;
      })(value, 0);
    })(term);
  };

  function norm(term){
    return fromJS(toJS(term));
  };

  return {
    toJS: toJS,
    fromJS: fromJS,
    norm: norm
  }
})();
