;; Exercise 2.17

;; The emptyness of list is not checked.
(define (last-pair-r list)
  (if (null? (cdr list))
      (car list)
      (last-pair-r (cdr list))))
