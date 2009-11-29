;; Exercise 2.73

;; a.
;; When derive a number or a variable, we don't need any extra information about
;; them, but we can get the result directly. We have nothing to dispatch on
;; them. However, when we derive other expressions, i.e. a plus of two
;; varaibles, a multiply of two variables, we need to know the `type' of
;; operation in order to apply rules on them.

;; b.
;;                             Types
;;                          
;;                   +     |     *    |    **
;; Operations   +----------+----------+-----------
;;              |          |          |
;;  derive      | derive-+ | derive-* | derive-**
;;              |          |          |

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; install-add-package
(define (install-add-package)
  (define (derive exp var)
    (make-sum (derive (addend exp) var)
              (derive (augend exp) var)))
  (put 'derive '(+) derive)
  'done)

;; install-mul-package
(define (install-mul-package)
  (define (derive exp var)
    (make-sum (make-product (multiplicant exp)
                            (derive (multiplier exp) var))
              (make-product (multiplier exp)
                            (derive (muliplicant exp) var))))
  (put 'derive '(*) derive)
  'done)

;; c.
;; install-exp-package
(define (install-exp-package)
  (define (derive exp var)
    (make-product (exponent exp)
                  (make-product
                   (make-exponentiation (base exp)
                                        (make-sum (exponent exp) -1))
                   (deriv (base exp) var))))
  (put 'derive '(**) derive)
  'done)

;; d.
;; Simply change the order of `op' and `type' in the `put' procedure will do.
