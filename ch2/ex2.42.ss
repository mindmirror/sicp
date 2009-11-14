;; Exercise 2.42: Eight-Queen

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

;; empty-board
(define empty-board null)

;; adjoin-position
(define (adjoin-position new-row k rest-of-queens)
  (if (null? rest-of-queens)
      (list (list new-row k))
      (append rest-of-queens (list (list new-row k)))))

;; safe?
(define (safe? k positions)
  (let ((p (list-ref positions (- k 1))))
    (cond ((and (= (caar positions) (car p))
                (= (cadar positions) (cadr p)))
           true)
          ((and (not (= (caar positions) (car p)))
                (not (= (abs (/ (- (caar positions) (car p))
                                (- (cadar positions) (cadr p))))
                        1)))
           (safe? (- k 1) (cdr positions)))
          (else false))))

;; test case for `safe?'
(safe? 3 '((1 1) (2 2) (3 3)))
(safe? 4 '((2 1) (4 2) (1 3) (3 4)))

;; queens
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 8)
(length (queens 8)) ;; 92