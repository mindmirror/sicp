;; Exercise 1.20.  The process that a procedure generates is of course dependent
;; on the rules used by the interpreter. As an example, consider the iterative
;; gcd procedure given above. Suppose we were to interpret this procedure using
;; normal-order evaluation, as discussed in section 1.1.5. (The
;; normal-order-evaluation rule for if is described in exercise 1.5.) Using the
;; substitution method (for normal order), illustrate the process generated in
;; evaluating (gcd 206 40) and indicate the remainder operations that are
;; actually performed. How many remainder operations are actually performed in
;; the normal-order evaluation of (gcd 206 40)? In the applicative-order
;; evaluation? 

;; Normal-order evaluation: 18 times
;; Applicative-order evalutation: 4 times

;; Normal-order evaluation:
; (gcd 206 40)
;   40 = 0 ? false
; (gcd 40 (r 206 40))
;   (r 206 40) = 0 ? false, 1 time / 1 time total
; (gcd (r 206 40) (r 40 (r 206 40)))
;   (r 40 (r 206 40)) = 0 ? false, 2 times / 3 times total
; (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
;   (r (r 206 40) (r 40 (r 206 40)) = 0 ? false, 4 times / 7 times total
; (gcd (r (r 206 40) (r 40 (r 206 40))
;      (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
;   (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) = 0 ? true
;                                               7 times / 14 times total
;; return `a'
; (r (r 206 40) (r 40 (r 206 40))) 4 times / 18 times total
; 18 times total

;; Applicative-order evaluation:
; (gcd 206 40)
; (gcd 40 (r 206 40))
; (gcd 40 6)  1 time
; (gcd 6 (r 40 6))
; (gcd 6 4)  2 times
; (gcd 4 (r 6 4))
; (gcd 4 2) 3 times
; (gcd 2 (r 4 2))
; (gcd 2 0) 4 times
; 4 times total
