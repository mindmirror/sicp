;; Exercise 1.31.  
;; a. The sum procedure is only the simplest of a vast number of similar
;; abstractions that can be captured as higher-order procedures. Write an
;; analogous procedure called product that returns the product of the values of
;; a function at points over a given range. Show how to define factorial in
;; terms of product. Also use product to compute approximations to using the
;; formula

; Pi   2 * 4 * 4 * 6 * 6 * 8 ...
; -- = -------------------------
;  4   3 * 3 * 5 * 5 * 7 * 7 ...

;; b. If your product procedure generates a recursive process, write one that
;; generates an iterative process. If it generates an iterative process, write
;; one that generates a recursive process. 

;; product procedure (recursive)
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; factorial using product
(define (factorial n)
  (define (inc x) (+ 1 x))
  (product identity 1 inc n))

;; calculate Pi
(define (pi-product n)
  (define (pi-term x)
    (sqr (/ (+ x 1) x)))
  (define (pi-next x)
    (+ x 2))
  (/ (* 4 (* 2 (product pi-term 3 pi-next n))) (+ n 1)))

;; product procedure (iterative)
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

    