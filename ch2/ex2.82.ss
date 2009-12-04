;; Exercise 2.82

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          ;; A two level loop which transform
          ;; (type1 type2 ... typen)
          ;; to
          ;; ((type1 type1 ... type1)
          ;;  (type2 type2 ... type2)
          ;;  ...
          ;;  (typen typen ... typen))
          (let ((args-list
                 (map (lambda (i)
                        (map (lambda (j)
                               (if (eq? (type-tag i) (type-tag j))
                                   i
                                   ;; if the coercion not exists, it will be
                                   ;; a () in the list and there should be no
                                   ;; proc defined on it.
                                   (get-coercion (type-tag j) (type-tag i))))
                             args))
                      args)))
            ;; iterate through the list, try to get the proc of
            ;; (typex typex ... typex)
            (define (iter i)
              (let ((proc (get op (map type-tag (car i)))))
              (cond ((null? i)
                     (error "No method for these types"
                            (list op type-tags)))
                    (proc (apply proc (map contents (car i))))
                    (else iter (cdr i)))))
            (iter args-list))))))

;; A counter example:
;; Assume there is one operation on (type2 type1). However, the input given is
;; (type1 type2). According to our stratety, it will try to get the proc on
;; (type1 type1) and (type2 type2), so the proc on (type2 type1) will never be
;; retrieved. The problem is the strategy does not handle mixed-type operations.
