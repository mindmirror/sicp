;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (if (pair? length)
      (error " The length of the branch should be a integer ")
      (list length structure)))

;; a.
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (structure branch) (car (cdr branch)))

;; Test case
;         +
;       /  \
;      *    *
;    3 |  2 |
;      4    +
;          /  \
;         *    *
;       1 |  5 |
;         6    7

(define x (make-mobile (make-branch 3 4)
                       (make-branch 2
                                    (make-mobile (make-branch 1 6)
                                                 (make-branch 5 7)))))
x
(left-branch x)
(right-branch x)

;; b.
;; Note: if (car node) is not a pair then it must be the length of the branch.
;; Hence, the node is a branch.
(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((struct (structure branch)))
      (if (pair? struct)
          (total-weight struct)
          struct)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(total-weight x) ;; total weight should be 17

;; c.
(define (balanced? mobile)
  (define (branch-weight branch)
    (let ((struct (structure branch)))
      (cond ((and (pair? struct) (balanced? struct))
             (total-weight struct))
            ((not (pair? struct)) struct)
            (else false))))
  (and (branch-weight (left-branch mobile))
       (branch-weight (right-branch mobile))
       (= (* (branch-length (left-branch mobile))
             (branch-weight (left-branch mobile)))
          (* (branch-length (right-branch mobile))
             (branch-weight (right-branch mobile))))))

;; Test case
(balanced? x)

;; A balanced binary mobile
;                  +
;                /   \
;         (210) *     * (210)
;            7 |    6 |
;              +      +
;            /  \    / \
;           *   *   *  *
;          5|  1|  5| 2|
;           5  25  10  25

(define y (make-mobile (make-branch 7
                                    (make-mobile (make-branch 5 5)
                                                 (make-branch 1 25)))
                       (make-branch 6
                                    (make-mobile (make-branch 5 10)
                                                 (make-branch 2 25)))))
y
(balanced? y)

;; d.
