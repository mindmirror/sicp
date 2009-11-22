;; Exercise 2.58

;; deriv
(define (deriv exp var)
  ;; variable?
  (define (variable? x) (symbol? x))
  ;; same-variable?
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2)
         (eq? v1 v2)))
  ;; =number?
  (define (=number? exp num)
    (and (number? exp) (= exp num)))
  ;; make-sum
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 '+ a2))))
  ;; make-product
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))
  ;; sum?
  (define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))
  ;; addend
  (define (addend s) (car s))
  ;; augend
  (define (augend s) (caddr s))
  ;; product?
  (define (product? x)
    (and pair? x) (eq? (cadr x) '*))
  ;; multiplier
  (define (multiplier p) (car p))
  ;; multiplicand
  (define (multiplicand p) (caddr p))
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (multiplicand exp)
                        (deriv (multiplier exp) var))))
        (else
         (error "unknow expression type -- DERIV" exp))))

;; a.
(deriv '(x + (3 * (x + (y + 2)))) 'x) ;; (1 + (3 * 0)) = 4

;; b.
;; The key is truncating the expression into serveral product sub-expressions.
;; e.g.:
;;   (a + b * (c + d) + e * f) => a, (b * (c + d)), (e * f)
;; The memq procedure is very convenient for truncatine the expression.
;; deriv-b (the final result is not simplifed)
(define (deriv-b exp var)
  ;; variable?
  (define (variable? x) (symbol? x))
  ;; same-variable?
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2)
         (eq? v1 v2)))
  ;; =number?
  (define (=number? exp num)
    (and (number? exp) (= exp num)))
  ;; make-sum
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 '+ a2))))
  ;; make-product
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))
  ;; sum?
  (define (sum? x)
    (memq '+ x))
  ;; addend
  (define (addend s)
    (define (iter i result)
      (if (eq? '+ (car i))
          (if (null? (cdr result))
              (car result)
              result)
          (iter (cdr i) (append result (list (car i))))))
    (iter s null))
  ;; augend
  (define (augend s)
    (let ((r (memq '+ s)))
      (if (null? (cddr r))
          (car r)
          (cdr r))))
  ;; product?
  (define (product? x)
    (and pair? x) (eq? (cadr x) '*))
  ;; multiplier
  (define (multiplier p) (car p))
  ;; multiplicand
  (define (multiplicand p)
    (if (null? (cdddr p))
        (caddr p)
        (cddr p)))
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv-b (addend exp) var)
                   (deriv-b (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv-b (multiplicand exp) var))
          (make-product (multiplicand exp)
                        (deriv-b (multiplier exp) var))))
        (else
         (error "unknow expression type -- DERIV" exp))))

(deriv-b '(x + 3 * (x + y + 2)) 'x) ;; 4
(deriv-b '(x + 3 * (x + y + 2) + a * x) 'x) ;; (1 + (3 + a))
(deriv-b '(x + 3 * (x + y * x + 2) * a + b * x) 'x)
;; (1 + ((3 * (a * (1 + y))) + b)