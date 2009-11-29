;; Exercise 2.56

(define (deriv exp var)
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
        ((exponentiation? exp) ;; derive exponentiation
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp)
                                                       (make-sub
                                                        (exponent exp) 1)))
                       (deriv (base exp) var)))
        (else
         (error "unknow expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2)
       (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (make-sub s1 s2)
  (cond ((and (number? s1) (number? s2)) (- s1 s2))
        ((=number? s2 0) s1)
        (else (list '- s1 s2))))
;; Note: I saw a guy using make-sum instead of writing a new make-sub, it is
;; quite a smart way to do it. The only side effect is you may have something
;; like (+ a -1).

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
  (and pair? x) (eq? (car x) '*))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

;; exponentiation?
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

;; base & exponent
(define (base e) (cadr e))
(define (exponent e) (caddr e))

;; make-exponentiation
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))))

(deriv '(+ x 3) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(** x 3) 'x)
(deriv '(* 3 (** x a)) 'x)
