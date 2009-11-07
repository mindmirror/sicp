;; Exercise 2.22

;; In the iteration part of the first procedure
; (iter (cdr things)
;       (cons (square (car things))
;             answer))
;; the constructed pair will be the `answer' in the next iteration.
;; So when the `iter' `cdring things' down, the last item in `things' becomes
;; first item in the whole list. Hence it gives a reverse order list.

(define (square-list1 items)
  (if (null? items)
      null
      (cons (sqr (car items))
            (square-list1 (cdr items)))))
(square-list1 (list 1 2 3 4 5 6 7))

;; For the second procdure, Louis put the answer in the first place of a pair.
;; The `answer' itself is a list, so when it `cons up', the car of the cons is
;; always a list, while the cdr part is the item. So the result is not a list.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (sqr (car things))))))
  (iter items null))

(square-list (list 1 2 3 4 5 6 7))

;; We can use `append' to do it
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (sqr (car things)))))))
  (iter items null))

(square-list2 (list 1 2 3 4 5 6 7))
