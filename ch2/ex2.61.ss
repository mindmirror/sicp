;; Exercise 2.61

;; Key: If x is bigger than the current item in the list, append the front list and,
;; the result of (adjoin-set x rest-set).

;; iterative
(define (adjoin-set-i x set)
  (define (iter i result)
    (cond ((null? i) (append result (list x)))
          ((< x (car i)) (append (append result (list x)) i))
          ((= x (car i)) result)
          (else (iter (cdr i) (append result (list (car i)))))))
  (iter set '()))

;; recursive
(define (adjoin-set-r x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set-r x (cdr set))))))

(define x '(1 2 4 7 8))
(adjoin-set-i '6 x)
(adjoin-set-r '5 x)

(adjoin-set-i '9 x)
(adjoin-set-r '9 x)

(adjoin-set-i '0 x)
(adjoin-set-r '0 x)
