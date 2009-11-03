;; Exercise 1.45

(define (fixed-point f first-guess)
  (define torlerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) torlerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (repeated f n)
  (define (repeated-iter result i)
    (if (= i n)
        result
        (repeated-iter (lambda (x) (f (result x))) (+ i 1))))
  (repeated-iter f 1))

;; average-damp    nth-root
;;      1              2
;;      1              3
;;      2              4   -> 2^2
;;      2              5
;;      2              6
;;      2              7
;;      3              8   -> 2^3
;;      3              9
;;      3              10
;;      3              11
;;      3              12
;;      3              13
;;      3              14
;;      3              15
;;      4              16  -> 2^4
;;     ...            ...
;; the relationship between the number of average-damp m and nth-root n is
;; 2^(m + 1) >= n + 1
;; more elegant
;; number of damp = log2(n)

;; number of damp
(define (nod n)
  (if (< n 2)
      0
      (+ 1 (nod (/ n 2)))))

;; fast exponential
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (sqr (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define ^ fast-expt)

;;             x
;; y |--> -----------
;;         y^(n - 1)
(define (g n x)
  (lambda (y) (/ x (^ y (- n 1)))))

(define (nth-root n x)
  (fixed-point ((repeated average-damp (nod n)) (g n x)) 1.0))
(nth-root 5 32)

;; test case
(nth-root 16 (^ 2 16))
(nth-root 7 (^ 3 7))
(nth-root 9 (^ 6 9))
