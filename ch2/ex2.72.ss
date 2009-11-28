;; Exercise 2.72

;; The tree in 2.71 is like this:
;;
;;       31  (E D C B A)  * 
;;                       / \
;;        15  (E D C B) *   A 16
;;                     / \
;;         7  (E D C) *   B 8
;;                   / \
;;         3  (E D) *   C 4
;;                 / \
;;             1  E   D 2

;; For the most frequent case, (symbol A here), encode-symbol will search left
;; tree (E D C B), then right tree. Since symbol A is not in left branch, memq
;; will iterate the whole list from beginning to the end, which takes n-1 steps.
;; Then, it searches the right branch, which is a leaf. Hence it takes 1 step.
;; So to search most frequent symbol is theta(n).
;;
;; For the least case, (symbol E here), encode-symbol will search through the
;; deepest level of the tree, which takes n-1 steps (see 2.71). In each level,
;; encode-symbol will search through the list of symbols, if the list is
;; unordered, it takes n-1 steps. So the total step is n-1 + n-2 + ... 1, which
;; is theta(n^2). If the list of symbol is ordered, it takes only 1 step to find
;; the least frequent symbol since it is always the first of the list. In this
;; case, the total step is theta(n).
