;; Exercise 2.83

(define (install-scheme-number-package)
  ;; ... skip existing procedures
  (define (raise x)
    (make-rational x 1))
  (put 'raise 'scheme-number raise))

(define (install-rational-package)
  ;; ... skip existing procedrues
  (define (raise x)
    (/ (numer x) (denom x)))
  (put 'raise 'rational raise))

(define (install-real-package)
  ;; ...
  (define (raise x)
    (make-complex-from-real-imag x 0))
  (put 'raise 'real raise))

(define (raise x) (apply-generic 'raise x))


  