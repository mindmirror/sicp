;; Exercise 2.85

(define (install-rational-package)
  ;; ...
  (define (project x)
    (make-scheme-number (round (/ (numer x) (denom x)))))
  (put 'project '(rational) project))

(define (install-real-package)
  ;; ...
  (define (project x)
    (make-ratinoal (round x) 1))
  (put 'project '(real) project))

(define (install-complex-package)
  ;; ...
  (define (project x)
    (make-real (imag-part x)))
  (put 'project '(complex) project))

(define (project x)
  (apply-generic 'project x))

;; equ? is defined in exercise 2.79
(define (drop x)
  ;; project procedure is not defined for the lowest type
  ;; so if a number does not have project procedure return the number itself
  (let ((proj-proc (get 'project (type-tag x))))
    (if proj-proc
        (let ((projected-num (project x)))
          (if (equ? (raise projected-num) x)
              (drop projected-num)
              x))
        x)))

;; re-write apply-generic using drop
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((arg1 (car args))
                    (arg2 (cadr args)))
                ;; raise-iter
                (define (raise-iter arg target-arg)
                  (cond ((eq? (type-tag arg) (type-tag target-arg))
                         arg)
                        ((get 'raise (type-tag arg))
                         (raise-ter (raise arg) target-arg))
                        (else false)))
                (if (not (eq? (type-tag arg1) (type-tag arg2)))
                    (let ((coerced-arg1 (raise-iter arg1 arg2))
                          (coerced-arg2 (raise-iter arg2 arg1)))
                      ;; drop the result to simplify the anser
                      (cond ((coerced-arg1)
                             (drop (apply-generic op (coerced-arg1 arg2))))
                            ((coerced-arg2)
                             (drop (apply-generic op (arg1 coerced-arg2))))
                            (else
                             (error "No method for these types"
                                    (list op type-tags)))))
                    (error "No method for these types"
                           (list op typetags))))
              (error "No method for these types"
                     (list op type-tags)))))))
