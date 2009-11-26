;; Exercise 2.64

;; a.
;; partial-tree will construct the left-branch tree first, using the first
;; (n-1)/2 elements. Then pick the first of the rest elements as the entry, and
;; constructs the right-branch tree using the rest elements. Then compute the
;; sub-tree so on and so forth until the number of element is 0.

;; The tree for list (1 3 5 7 9 11) is
;;   (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;;
;;               5
;;             /   \
;;            1      9
;;             \    / \
;;              3  7   11

;; b.
;; Note: this is NOT theta(log(n)) since partial-tree needs to traverse all the
;; n elements in the list. I made a mistake at the first time.
;; 
;; The order of growth is theta(n).
;; The number of steps in partial-tree is only depend on the `n', which is the
;; number of the elements, but not the actual element list.
;; For each iteration, the partial-tree will compute left-result, entry, and
;; right-result. The number of elements calculated on left-result is (n-1)/2.
;; The rest of the elements will be returned as remaining elements. The number
;; of elements calculated in right-result is (n - ((n-1)/2 + 1)) = (n-1)/2. So
;; in each sub-iteration, partial-tree only calculates less than half of the
;; original number of elements, but partial-tree is called twice, one is for
;; left, another for right. It is like p(n) -> 2p(n/2) -> 4p(n/4) -> ... until
;; n = 0. So the order of growth is theta(n).

;; Update:
;; We can apply the master theorem to it.
;; T(1) = Theta(1)
;; T(n) = 2T((n-1)/2) + Theta(1)
;;      < 2T(n/2) + Theta(1)
;;      = Theta(n^log2(2)) = Theta(n)

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (make-tree entry left right)
  (list entry left right))

(list->tree '(1 3 5 7 9 11))
