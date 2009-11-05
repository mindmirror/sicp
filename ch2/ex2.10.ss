;; Exercise 2.10

;; spans 0 menas lower bound of divider is smaller than 0 while
;; upper bound of divider is larger than 0
(define (div-interval x y)
  (if (< (* (upper-bound y) (lower-bound y)) 0)
      error "The divider interval spans 0"
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
