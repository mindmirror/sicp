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
;; =============================================================================

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
;; =============================================================================

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
;           *    *  *   *
;          5|   1| 5|  2|
;           5   25  10  25

(define y (make-mobile (make-branch 7
                                    (make-mobile (make-branch 5 5)
                                                 (make-branch 1 25)))
                       (make-branch 6
                                    (make-mobile (make-branch 5 10)
                                                 (make-branch 2 25)))))
y
(balanced? y)

;; Test case from Pan Xingzhi
(define ban-mob (make-mobile (make-branch 3 6)
                             (make-branch 2 (make-mobile
                                             (make-branch 5 4)
                                             (make-branch 4 5)))))
(define unban-mob (make-mobile (make-branch 3 6)
                               (make-branch 2 (make-mobile
                                               (make-branch 5 4)
                                               (make-branch 4 6)))))

(newline)
(display "Test case from Pan Xingzhi")
(newline)
(total-weight ban-mob)
(balanced? ban-mob)
(total-weight unban-mob)
(balanced? unban-mob)
(newline)
;; =============================================================================

;; d.
;; All I need to change is the procedure right-branch and structure.
;; right-branch: get the cdr of the mobile without car
;; structure: get the cdr of the branch without car

(define (make-mobile2 left right)
  (cons left right))
(define (make-branch2 length structure)
  (cons length structure))

(define (left-branch2 mobile) (car mobile))
(define (right-branch2 mobile) (cdr mobile))
(define (branch-length2 branch) (car branch))
(define (structure2 branch) (cdr branch))

;; total-weight2
(define (total-weight2 mobile)
  (define (branch-weight branch)
    (let ((struct (structure2 branch)))
      (if (pair? struct)
          (total-weight2 struct)
          struct)))
  (+ (branch-weight (left-branch2 mobile))
     (branch-weight (right-branch2 mobile))))

;; Test case
(define w (make-mobile2 (make-branch2 3 4)
                        (make-branch2 2
                                      (make-mobile2 (make-branch2 1 6)
                                                    (make-branch2 5 7)))))

w
(total-weight2 w)

;; balanced?2
(define (balanced?2 mobile)
  (define (branch-weight2 branch)
    (let ((struct (structure2 branch)))
      (cond ((and (pair? struct) (balanced?2 struct))
             (total-weight2 struct))
            ((not (pair? struct)) struct)
            (else false))))
  (and (branch-weight2 (left-branch2 mobile))
       (branch-weight2 (right-branch2 mobile))
       (= (* (branch-length2 (left-branch2 mobile))
             (branch-weight2 (left-branch2 mobile)))
          (* (branch-length2 (right-branch2 mobile))
             (branch-weight2 (right-branch2 mobile))))))

(define z (make-mobile2 (make-branch2 7
                                      (make-mobile2 (make-branch2 5 5)
                                                    (make-branch2 1 25)))
                        (make-branch2 6
                                      (make-mobile2 (make-branch2 5 10)
                                                    (make-branch2 2 25)))))

;; Test case
(balanced?2 w)
z
(balanced?2 z)
