Mu=  F:(-* *) A-* -(-(F A) A) A
N= X:* R-* -R -(-X R) R
Fold= X:* k:-(N X) X t:(Mu N) (t X k)
zero= X:* x:X y:-(Mu N) X x
Nmap= X:* Y:* f:(-X Y) x:(N X) R:* r:R ym:(-Y R) (x R r (xv:X (ym (f xv))))
In= s:(N (Mu N)) X:* k:-(N X) X (k ((Nmap (Mu N) X) (Fold X k) s))
succ= n:(N (Mu N)) X:* x:X y:-(Mu N) X (y (In n))
Out= t:(Mu N) (Fold (N (Mu N)) (Nmap (N (Mu N)) (Mu N) In) t) 
case= n: (N (Mu N)) R:* a:R f:-(N (Mu N)) R (n R a (x:(Mu N) (f (Out x))))  

Out


The term above normalizes to:

    a:*
    :a
    a:(-(b-* (-(-(a-* (-a (-(-b a) a))) b) b)) a)
    (a 
      c:*
      b:(-(a-* (-a (-(-c a) a))) c)
      (b
        a:*
        _:a
        a:(-c a)
        (a (b
          a:* 
          _:a 
          a:(-c a)
          (a (b
            a:*
            _:a
            a:(-c a)
            (a (b
              a:*
              _:a
              a:(-c a)
              (a (b
                a:*
                _:a
                a:(-c a)
                (a (b 
                  b:* 
                  a:b 
                  _:(-c b)
                  a))))))))))))






(a-* (-a (-(-(b-* (-(-(a-* (-a (-(-b a) a))) b) b)) a) a)))
(a-* (-a (-(-(b-* (-(-(a-* (-a (-(-b a) a))) b) b)) a) a)))

\(t: ./Mu ./N ) -> ./Fold (./N (./Mu ./N )) (./Nmap (./N (./Mu ./N )) (./Mu ./N ) ./In ) t
\(n: ./N (./Mu ./N )) -> \(R: *) -> \(a: R) -> \(f: ./N (./Mu ./N ) -> R) -> n R a (\(x: ./Mu ./N ) -> f (./Out x))

n (\(X: *) -> \/(R: *) -> R -> (X -> R) -> R)
mu (\(F: * -> *) -> \/(A: *) -> (F A -> A) -> A)
zero \(X: *) -> \(x: X) -> \(y: ./Mu ./N -> X) -> x
fold \(X: *) -> \(k: ./N X -> X) -> \(t: ./Mu ./N ) -> t X k
Nmap \(X: *) -> \(Y: *) -> \(f: X -> Y) -> \(x: ./N X) -> \(R: *) -> \(r: R) -> \(ym: Y -> R) -> x R r (\(xv: X) -> ym (f xv))
in \(s: ./N (./Mu ./N )) -> \(X: *) -> \(k: ./N X -> X) -> k ((./Nmap (./Mu ./N ) X) (./Fold X k) s)
succ \(n: ./N (./Mu ./N )) -> \(X: *) -> \(x: X) -> \(y: ./Mu ./N -> X) -> y (./In n)
\(n: ./N (./Mu ./N )) -> \(X: *) -> \(x: X) -> \(y: ./Mu ./N -> X) -> y (./In n)
