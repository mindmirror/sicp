;; Exercise 1.23. The smallest-divisor procedure shown at the start of this
;; section does lots of needless testing: After it checks to see if the number
;; is divisible by 2 there is no point in checking to see if it is divisible by
;; any larger even numbers. This suggests that the values used for test-divisor
;; should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement
;; this change, define a procedure next that returns 3 if its input is equal to
;; 2 and otherwise returns its input plus 2. Modify the smallest-divisor
;; procedure to use (next test-divisor) instead of (+ test-divisor 1). With
;; timed-prime-test incorporating this modified version of smallest-divisor, run
;; the test for each of the 12 primes found in exercise 1.22. Since this
;; modification halves the number of test steps, you should expect it to run
;; about twice as fast. Is this expectation confirmed? If not, what is the
;; observed ratio of the speeds of the two algorithms, and how do you explain
;; the fact that it is different from 2? 

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))
(define (square x)
  (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)
(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099)

;; The 12 prime numbers and the time used to find them
; prime number | original time  | improved time  |   ratio
;10000000019    *** 125               78              1.60
;10000000033    *** 140               78              1.79
;10000000061    *** 125               79              1.58
;100000000003   *** 454               250             1.82
;100000000019   *** 469               281             1.67
;100000000057   *** 468               297             1.58
;1000000000039  *** 1453              843             1.72
;1000000000061  *** 1469              860             1.71
;1000000000063  *** 1453              844             1.72
;10000000000037 *** 4641              2656            1.75
;10000000000051 *** 4625              2656            1.74
;10000000000099 *** 4625              2656            1.74

;; In this expriment, the improved procedure is not running as twice fast.
;; The improved procedure is about 1.7 times faster. Because in the 
;; (next test-divisor) procedure, the `if' condition form may cost some 
;; more time than before. 