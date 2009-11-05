;; Exercise 2.11

;; For each interval there are 3 cases
;;   lower-bound <= upper-bound <= 0   (1)
;;   lower-bound <= 0 <= upper-bound   (2)
;;   0 <= lower-bound <= upper-bound   (3)
;; So there 3 * 3 = 9 cases all together
;; When both x and y are case (2) we need to calculate to determine the lower and
;; upper bound. 

(define (mul-interval x y)
  (cond ((and (>= (car x) 0) (>= (cdr x) 0)
              (>= (car y) 0) (>= (cdr y) 0))
         (make-interval (* (car x) (car y)) (* (cdr x) (cdr y))))
        ((and (< (car x) 0) (< (cdr x) 0)
              (< (car y) 0) (< (cdr y) 0))
         (make-interval (* (cdr x) (cdr y)) (* (car x) (car y))))
        ((and (< (car x) 0) (>= (cdr x) 0)
              (>= (car y) 0) (>= (cdr y) 0))
         (make-interval (* (car x) (cdr y)) (* (cdr x) (cdr y))))
        ((and (>= (car x) 0) (>= (cdr x) 0)
              (< (car y) 0) (>= (cdr y) 0))
         (make-interval (* (cdr x) (car y)) (* (cdr x) (cdr y))))
        ((and (< (car x) 0) (< (cdr x) 0)
              (>= (car y) 0) (>= (cdr y) 0))
         (make-interval (* (cdr x) (cdr y)) (* (car x) (car y))))
        ((and (>= (car x) 0) (>= (cdr x) 0)
              (< (car y) 0) (< (cdr y) 0))
         (make-interval (* (cdr x) (cdr y)) (* (car x) (car y))))
        ((and (< (car x) 0) (< (cdr x) 0)
              (< (car y) 0) (>= (cdr y) 0))
         (make-interval (* (cdr x) (cdr y)) (* (cdr x) (car y))))
        ((and (< (car x) 0) (>= (cdr x) 0)
              (< (car y) 0) (< (cdr y) 0))
         (make-interval (* (cdr x) (cdr y)) (* (car x) (cdr y))))
        ((and (< (car x) 0) (>= (cdr x) 0)
              (< (car y) 0) (>= (cdr y) 0))
         (let ((u1 (* (car x) (car y)))
               (u2 (* (cdr x) (cdr y)))
               (l1 (* (car x) (cdr y)))
               (l2 (* (cdr x) (car y))))
           (define ub (if (> u1 u2) u1 u2))
           (define lb (if (< l1 l2) l1 l2))
           (make-interval lb ub)))))

(define make-interval cons)

(mul-interval (cons 1 2) (cons 3 4)) ;; (3, 8)
(mul-interval (cons -2 -1) (cons -4 -3)) ;; (3, 8)
(mul-interval (cons -1 2) (cons 3 4)) ;; (-4, 8)
(mul-interval (cons 1 2) (cons -3 4)) ;; (-6, 8)
(mul-interval (cons -1 -2) (cons 3 4)) ;; (-8, -3)
(mul-interval (cons 1 2) (cons -3 -4)) ;; (-8, -3)
(mul-interval (cons -1 -2) (cons -3 4)) ;; (-8, 6)
(mul-interval (cons -1 2) (cons -4 -3)) ;; (-8, 4)

(mul-interval (cons -1 2) (cons -3 4)) ;; (-6, 8)
(mul-interval (cons -2 1) (cons -3 4)) ;; (-8, 6)


         