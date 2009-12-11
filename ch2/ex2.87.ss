;; Exercise 2.87

(define (install-polynomial-package)
  ;; ...
  ;; Note: Inside polynomial package we are using `=zero-poly?' as the name of
  ;; the procedure to check whether the polynomial is zero. The reason is when
  ;; checking whether the coefficent of a term is zero, we can use the generic
  ;; `=zero?' procedure. So it will work with all type of numbers.
  
  ;; version 1.
  (define (=zero-poly? p)
    (let ((terms (term-list p)))
      (cond ((null? terms) true)
            ((=zero? (coeff (first-term terms)))
             ;; make-poly here doesn't look smart
             (=zero-poly? (make-poly (varaible p) (rest-terms terms)))) 
            false)))

  ;; version 2: using iterater
  (define (=zero? p)
    (define (iter terms)
      (cond ((null? terms) true)
            ((=zero? (coeff (first-term terms)))
             (iter (rest-terms terms)))
            false))
    (iter (term-list p))

  (put '=zeor? 'polynomial =zero-poly?)))
