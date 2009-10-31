;; Exercise 1.33. You can obtain an even more general version of accumulate
;; (exercise 1.32) by introducing the notion of a filter on the terms to be
;; combined. That is, combine only those terms derived from values in the range
;; that satisfy a specified condition. The resulting filtered-accumulate
;; abstraction takes the same arguments as accumulate, together with an
;; additional predicate of one argument that specifies the filter. Write
;; filtered-accumulate as a procedure. Show how to express the following using
;; filtered-accumulate:

;; a. the sum of the squares of the prime numbers in the interval a to b
;; (assuming that you have a prime? predicate already written)

;; b. the product of all the positive integers less than n that are relatively
;; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1). 

(define (filtered-accumulate combiner null-value filter term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate combiner
                                        null-value
                                        filter
                                        term (next a) next b)))
         (else (filtered-accumulate combiner
                                    null-value
                                    filter
                                    term (next a) next b))))

;; prime? procedure
(define (prime? n)
  (= (smallest-divisor n) n))
(define (smallest-divisor n)
  (find-divisor 2 n))
(define (find-divisor test-divisor n)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor (+ test-divisor 1) n))))
(define (divides? d n)
  (= (remainder n d) 0))

;; sum of the squares of the prime numbers
(define (prime-sum a b)
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 prime? sqr a inc b))
