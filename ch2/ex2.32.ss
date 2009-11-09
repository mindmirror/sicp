;; Exercise 2.32

;; The subsets are formed with:
;;   1. The subsets set of the original set without the first element, and
;;   2. The union of the first element of the original set and each subset in 1.

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (append (list (car s)) x))
                          rest)))))

(subsets (list 1 2 3))
