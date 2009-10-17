;; Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be provided as a
;; special form. ``Why can't I just define it as an ordinary procedure in terms
;; of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be 
;; done, and she defines a new version of if:

;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))

;; Eva demonstrates the program for Alyssa:
;
;(new-if (= 2 3) 0 5)
;5
;
;(new-if (= 1 1) 0 5)
;0
;
;; Delighted, Alyssa uses new-if to rewrite the square-root program:
;
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))
;
;;What happens when Alyssa attempts to use this to compute square roots? Explain. 

;; Answer
;; This procedure will never stop (theoratically).
;; By defining a new version of if using cond, the ``new-if'' is not a special
;; form. It is a compound procedure. The interpreter will use the 
;; applicative-order to evaluate the procedure, which means the interpreter 
;; will evaluate (improve guess x) first. After that, it will interpret
;; (good-enough? guess x) and (sqrt-iter y x) where `y' is the value of 
;; (improve guess x). When evaluating (sqrt-iter y x), the above procedure
;; will be done again, i.e. the interpreter evalutes (improve guess x), and
;; then evaluates (good-enough? guess x) and (sqrt-iter y x), so on so forth.