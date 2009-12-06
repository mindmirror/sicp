;; Exercise 2.84

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((arg1 (car args))
                    (arg2 (cadr args)))
                ;; Note: the idea is to raise arg1 to arg2, if it can't reach
                ;; then raise arg2 to arg1
                (define (raise-iter arg target-arg)
                  (cond ((eq? (type-tag arg) (type-tag target-arg))
                         arg)
                        ((get 'raise (type-tag arg))
                         (raise-ter (raise arg) target-arg))
                        (else false)))
                (let ((coerced-arg1 (raise-iter arg1 arg2))
                      (coerced-arg2 (raise-iter arg2 arg1)))
                  (cond ((coerced-arg1)
                         (apply-generic op (coerced-arg1 arg2)))
                        ((coerced-arg2)
                         (apply-generic op (arg1 coerced-arg2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))
