;; Exercise 2.88

;; By defining a generic negation operation we can use the existing add
;; procedure to define the subtraction procedure

(define (install-integer-package)
  ;; ...
  (define (negate x)
    (- x))
  (put 'negate '(integer) negate))

(define (install-rational-package)
  ;; ...
  (define (negate r)
    (make-rational (- (numer r)) (denom r)))
  (put 'negate '(rational) negate))

(define (install-real-package)
  ;; ...
  (define (negate r)
    (- r))
  (put 'negate '(real) negate))

(define (install-complex-package)
  ;; ...
  (define (negate x)
    (make-complex (- (real-part x)) (- (imag-part x))))
  (put 'negate '(complex) negate))

(define (negate x) (apply-generic 'negate x))

;; define subtraction
;; in install-polynomial-pacage
(define (sub-poly p1 p2)
  (add-poly p1 (negate p2)))
(put 'sub '(polynomial polynomial)
     (lambda (p1 p2) (tag (sub-poly p1 p2))))

;; Note: the netation of polynomial is defined inside polynomial package,
;; when it negates the coefficent of the terms, it calls the generic negate
;; procedure. So in order to avoid the name clashing, give a different name
;; for nageting the polynomial.
(define (neg-poly poly)
  (make-poly (variable poly)
             (negate-terms (term-list poly))))
(put 'negate '(polynomial)
     (lambda (p) (tag (neg-poly p))))

(define (neg-terms terms)
  (if (empty-termlist? terms)
      (the-empty-termlist)
      (adjoin-term (make-term (order (first-term terms))
                              (negate (coeff (first-term terms))))
                   (neg-terms (rest-terms terms)))))
