;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


;; To make the subsitituion easier, let define zero as
;; (define zero (lambda (s) (lambda (z) z)))
;;
; (add-1 zero)
; (lambda (f) (lambda (x) (f (((lambda (s) (lambda (z) z)) f) x)))) ;; Fix here
; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (z) z)) x))))
; (lambda (f) (lambda (x) (f (lambda (x) (lambda (z) z)))))
; (lambda (f) (lambda (x) (f zero)))

;; So let's define one
(define one (lambda (s) (lambda (z) (s zero))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (lambda (z) (f zero)) x)))
; (lambda (f) (lambda (x) (f (f zero))))

;; define two
(define two (lambda (s) (lambda (z) (s (s zero)))))