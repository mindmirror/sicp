;; Exercise 2.81

;; a.
;; The apply-generic will coerce the argument from the complex to complex and
;; try to get the exp procedure and apply to the arguments again. So this
;; procedrue will never stop.

;; b.
;; The apply-generic procedure work correctly as is. If the procedure coerces
;; two arguments of the same type, it means the operation does not exist for
;; this type. If no coercion is defined for the same type, the procedure will
;; report error, and the procedure is terminated. However, if the coercion is
;; defined, the procedure will never stop but keep try to find the operation
;; and apply to the arguments.

;; c.
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    ;; if the types of the two argumetns are the same
                    ;; the operation is not defined.
                    (error "No method for these types"
                           (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                             (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic op a1 (t2->t1 a2)))
                            (else
                             (error "No method for these types"
                                    (list op type-tags))))))
                (error "No method for these types"
                       (list op type-tags))))))))
