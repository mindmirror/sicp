;; Exercise 1.27. Demonstrate that the Carmichael numbers listed in footnote 47
;; really do fool the Fermat test. That is, write a procedure that takes an
;; integer n and tests whether a^n is congruent to a modulo n for every a<n, and
;; try your procedure on the given Carmichael numbers. 

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (square x) (* x x))

(define (congruent-test n)
  (congruent-test-iter 2 n))

(define (congruent-test-iter a n)
  (cond ((< a n) 
         (if (= a (expmod a n n))
             (congruent-test-iter (+ a 1) n)
             (display "Failed\n")))
        ((= a n) (display "Passed\n"))))

;; Fermat test using congruent-test
(define (fermat-test n)
  (congruent-test n))

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 6601)
