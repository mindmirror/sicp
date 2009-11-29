;; Exercise 2.73

;; a.
;; When derive a number or a variable, we don't need any extra information about
;; them, but we can get the result directly. However, when we derive other
;; expressions, i.e. a plus of two varaibles, a multiply of two variables, we
;; need to know the `type' of operation in order to apply rules on them.

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
    (make-product (exponential exp)
                  (** (base exp) (make-sub (exponential exp) 1))))
  (put 'derive '(**) derive)
  'done)

;; d.
;; In this case, the type is `derive', the operations are add, mul and exp.
;;
;;                 Types
;;
;;                 derive
;; Operations   +-----------
;;              |
;;     +        | +-derive
;;     *        | *-derive
;;     **       | **-derive
;;              |

(define (install-deriv-package)
  (define (+-deriv exp var)
    (make-sum (derive (andend exp) var)
              (derive (augend exp) var)))
  (define (*-deriv exp var)
    (make-sum (make-product (multiplier exp)
                            (derive (multiplicand exp) var))
              (make-product (multiplicand exp)
                            (derive (multiplier exp) var))))
  (define (**-deriv exp var)
    (make-product (exponential exp)
                  (** (base exp) (make-sub (exponential exp) 1))))
  (put '+ derive +-deriv)
  (put '* derive *-deriv)
  (put '** derive **-deriv)
  'done)
