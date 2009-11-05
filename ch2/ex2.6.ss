;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x)) f)  x)))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))

;; define one
(define one (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

;; define two
(define two (lambda (f) (lambda (x) (f (f x)))))

;; define n
; (add-1 n-1)
; (lambda (f) (lambda (x) (f ((n-1 f) x))))

;; (one f)
; ((lambda (f) (lambda (x) (f x))) f)
; (lambda (x (f x)))

;; (two f)
; ((lambda (f) (lambda (x) (f (f x)))) f)
; (lambda (x) (f (f x)))

;; (a f)
; (lambda (x) (f^a x))
;; (b f)
; (lambda (x) (f^b x))

;; define `+' procedure
(define (add a b) ;; both a and b are church numerals
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; church number to number
(define (church-number-to-number church-number)
  ((church-number (lambda (i) (+ i 1))) 0))

(church-number-to-number two)

;; number to church number
(define (number-to-church-number number) ;; the return value should be a procedure
  (if (= number 0)
      (lambda (f) (lambda (x) x))
      (lambda (f) (lambda (x) (f (((number-to-church-number (- number 1)) f) x))))))

;; a simpler version of number to church number
(define (number-to-chumber number)
  (if (= number 0)
      zero
      (add-1 (number-to-chumber (- number 1)))))

;; test case
(define nine (number-to-chumber 9))
(church-number-to-number nine)
