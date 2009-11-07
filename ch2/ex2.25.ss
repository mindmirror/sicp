;; Exercise 2.25

(define list1 (list 1 3 (list 5 7) 9))
list1
(define list2 (list (list 7)))
list2
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
list3

;; pick 7
(define (pick-list1 items) (car (cdr (car (cdr (cdr items))))))
(pick-list1 list1)

(define (pick-list2 items) (car (car items)))
(pick-list2 list2)

(define (pick-list3 items)
  (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items)))))))))))))
(pick-list3 list3)

;; Note:
;; cdr (1 2)
;; What you have `cdr-ed' is pair (2 . null), not 2. So to get 2 you need to car
;; it. (car (cdr (list 1 2))).

