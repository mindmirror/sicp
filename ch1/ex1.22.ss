;; Exercise 1.22.  Most Lisp implementations include a primitive called runtime
;; that returns an integer that specifies the amount of time the system has been
;; running (measured, for example, in microseconds). The following
;; timed-prime-test procedure, when called with an integer n, prints n and
;; checks to see if n is prime. If n is prime, the procedure prints three
;; asterisks followed by the amount of time used in performing the test.

;(define (timed-prime-test n)
;  (newline)
;  (display n)
;  (start-prime-test n (runtime)))
;(define (start-prime-test n start-time)
;  (if (prime? n)
;      (report-prime (- (runtime) start-time))))
;(define (report-prime elapsed-time)
;  (display " *** ")
;  (display elapsed-time))

;; Using this procedure, write a procedure search-for-primes that checks the
;; primality of consecutive odd integers in a specified range. Use your
;; procedure to find the three smallest primes larger than 1000; larger than
;; 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
;; test each prime. Since the testing algorithm has order of growth of
;; Theta(sqrt(n)), you should expect that testing for primes around 10,000
;; should take about sqrt(10) times as long as testing for primes around 1000.
;; Do your timing data bear this out? How well do the data for 100,000 and
;; 1,000,000 support the sqrt(n) prediction? Is your result compatible with the
;; notion that programs on your machine run in time proportional to the number
;; of steps required for the computation?

;; Using (current-milliseconds) instead of (runtime)
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

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

;; The real task
(define (search-for-primes n r)
  (cond ((= r 0) (newline) (display "done"))
        ((even? n) (search-for-primes (+ n 1) r))
        ((and (> r 0) (prime? n)) 
         (timed-prime-test n)
         (search-for-primes (+ n 2) (- r 1)))
        (else (search-for-primes (+ n 2) r))))

;; 1 billion, 1000^3
(search-for-primes 1000000000 3)
;; 10 billion
(search-for-primes 10000000000 3)
;; 100 billion
(search-for-primes 100000000000 3)
;; 1 trillion, 1000^4
(search-for-primes 1000000000000 3)
;; 10 trillion
(search-for-primes 10000000000000 3)
;; 100 trillion
(search-for-primes 100000000000000 3)

;; The result on my machine (in millisecond)
;1000000007 *** 15
;1000000009 *** 15
;1000000021 *** 16
;done
;10000000019 *** 125
;10000000033 *** 140
;10000000061 *** 125
;done
;100000000003 *** 454
;100000000019 *** 469
;100000000057 *** 468
;done
;1000000000039 *** 1453
;1000000000061 *** 1469
;1000000000063 *** 1453
;done
;10000000000037 *** 4641
;10000000000051 *** 4656
;10000000000099 *** 5453
;done
;100000000000031 *** 14625
;100000000000067 *** 14656
;100000000000097 *** 14641
;done

;; The larger the closer to sqrt(10) 