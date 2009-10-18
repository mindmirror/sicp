;; Exercise 1.7.  The good-enough? test used in computing square roots will not
;; be very effective for finding the square roots of very small numbers. Also,
;; in real computers, arithmetic operations are almost always performed with
;; limited precision. This makes our test inadequate for very large numbers.
;; Explain these statements, with examples showing how the test fails for small
;; and large numbers. An alternative strategy for implementing good-enough? is
;; to watch how guess changes from one iteration to the next and to stop when
;; the change is a very small fraction of the guess. Design a square-root
;; procedure that uses this kind of end test. Does this work better for small
;; and large numbers? 

;; The following code is to calculate square root by using good-enough? 
;; procedure. 

(define (sqrt-iter guess x)
  (if (good-enough? guess x) 
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sq-rt x)
  (sqrt-iter 1.0 x))

;; Answer
;; When the number is very small, the square root procedure using good-enough?
;; becomes very inaccurate.
;; For example, calculate the square root of 0.0001
;; (sq-rt 0.0001)
;; the value it returns is 0.03230844833048122 which should be 0.01
;; 
;; When the number is very large, the ``good-enough?'' will never be true.
;; Hence the sq-rt procedure will never stop.
;; Becuase when comparing the guess and x, the precision of guess after being
;; squared worse than before, i.e. the precision might be worse than
;; 0.001 (which is the condition in good-enough? procedure).
;; For example, let's calculate (sq-rt 1e+13)
;; After several iteration, the guess is 3162277.6601683795, which is 
;; actually very close to the square root of 1e+13 (using the built-in sqrt
;; procedure, you will get the same result . However, when squaring it, the
;; value is 10000000000000.002 which is just not good enough for good-enough?
;; procedure. 
;; Some one said the ``the program can endlessly alternate between two guesses
;; that are more than 0.001 away from the true square root.''. This is not the
;; case since the guess will be convergent to the real square root.

(define (sqrt-iter-alt guess x)
  (if (good-enough-alt guess x)
      (improve guess x)
      (sqrt-iter-alt (improve guess x) 
                     x)))

(define (good-enough-alt guess x)
  (< (/ (abs (- (improve guess x) 
                guess)) 
        (improve guess x)) 
     0.001))

(define (sqrt-alt x)
  (sqrt-iter-alt 1.0 x))

;; It does work better

