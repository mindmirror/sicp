;; Exercise 2.79

;; equ? for scheme-number
(define (install-scheme-number-package)
  ;; ... skip existing procedures
  (define (equ? n1 n2)
    (= n1 n2))
  (put 'equ? '(scheme-number scheme-number) equ?))
  ;; a more elegant version equ? of scheme-number is
  (put 'equ? '(scheme-number scheme-number) =)

;; equ? for rational-number
(define (install-rational-package)
  ;; ... skip existing procedures
  (define (equ? r1 r2)
    (and (= (numer r1) (number r2))
         (= (denom r1) (denom r2))))
  (put 'equ? '(rational rational) equ?))

;; equ? for complex-number
(define (install-complex-package)
  ;; ... skip existing procedures
  (define (equ? z1 z2)
    (and (= (real-part z1) (real-part z2))
         (= (imag-part z1) (real-part z2))))
  (put 'equ? '(complex complex) equ?))

 (define (equ? n1 n2) (apply-generic 'equ? n1 n2))
