;; Exercise 2.43

;; It takes Louis's program approximately 8^8T to solve the eight-queens puzzle.

;; For the original procedure, the outer loop is (queen-cols n), which is the number of
;; safe positions in column n. And the inner loop is the enumeration from 1 to
;; board-size n. 
;; For Louis's program, the outer loop is the enumeration from 1 to the board-size.
;; which makes the inner loop, the queen-col being called board-size times in one
;; iteration.

;; For (queen-cols n) in Louis's program, the total number of steps need to be computed
;; is
;;   (1) board-size times (queen-cols (- n 1)) plus,
;;   (2) the length of (queen-cols (- n 1)) * board-size times adjoin-position.
;; where the number of steps in (queen-cols (- n 1)) is
;; board-size times (queen-cols (- n 2)) plus the length of (queen-cols (- n 2)) *
;; board-size times adjoin-position. Comparing to the number of steps in
;; (queen-cols (- n 1)), step (2) can be neglected. The iteration will terminate until
;; the n is 0. It is obvious that the Louis's program grows exponentially.

;; So this makes (queen-cols n) board-size^n number of steps, plus the length of
;; (queen-cols (- n 1) * board-size times adjoin-position. However, in the original
;; procedure, it is only 1 time (queen-cols (- n 1)) plus, the length of
;; (queen-cols (- n 1)) * board-size times adjoin-position.
