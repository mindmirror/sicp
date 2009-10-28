;; Exercise 1.25. Alyssa P. Hacker complains that we went to a lot of extra work
;; in writing expmod. After all, she says, since we already know how to compute
;; exponentials, we could have simply written

;(define (expmod base exp m)
;  (remainder (fast-expt base exp) m))

;; Is she correct? Would this procedure serve as well for our fast prime tester?
;; Explain. 

;; Ideally, this is a way to do it, but it is not practical. The reason using
;; expmod to calculate the modulo is that it can handle very large numbers, i.e.
;; a base with a large exponential, without calulating it. Since the exponential
;; result may take forever to calculate, we have to find a to get the modulo
;; without knowing the exact number. Hence there is the expmod procedure. 

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (square x)
  (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (current-milliseconds) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Test the prime number 1000037
;; It takes 85988 milliseconds to calculate.
;; sample: 
;; 10037 *** 58
;; 1000037 *** 85988