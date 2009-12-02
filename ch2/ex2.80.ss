;; Exercise 2.80

;; =zero? for scheme-number
(define (install-scheme-number)
  ;; ... other procedures
  (define (=zero? x)
    (= x 0))
  (put '=zero? '(scheme-number) =zero?)
  'done)

;; =zero? for rational-number
;; Only check whether numerator is zero or not
(define (install-ratioanl-number)
  ;; ... other procedures
  (define (=zero? x)
    (= (numer x) 0))
  (put '=zero? '(rational) =zero?)
  'done)

;; =zero? for complex-number
(define (install-complex-number)
  ;; ... other procedures
  (define (=zero? x)
    (and (= (real-part x) 0)
         (= (imag-part x) 0)))
  ;; can also check whether magnitude is zero or not
  (put '=zeor? '(complex) =zero?)
  'done)

(define (=zero? x) (apply-generic '=zero? x))
