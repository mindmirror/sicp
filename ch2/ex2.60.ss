;; Exercise 2.60

;; element-of-set: this should be the same as before
;; Efficiency: same as before: Theta(n)
(define (element-of-set x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set x (cdr set)))))

;; adjoin-set: this should be simpler than before, no need to check whether x is
;; in the set, just add it in.
;; Efficiency: Theta(1)
(define (adjoin-set x set)
  (cons x set))

;; union-set: simpler than before, no need to check whether two sets share some
;; common items, just combine them.
;; Efficiency: Theta(1)
(define (union-set set1 set2)
  (append set1 set2))

;; intersection-set: this procedure should be same as before. But the result of
;; the intersection may have duplicated elements if both of the sets share the
;; common duplicated elements.
;; Efficiency: Theta(n^2)
(define (intersection set1 set2)
  (cond ((null? set1) '())
        ((null? set2) '())
        ((element-of-set (car set1) set2)
         (cons (car set1) (intersection (cdr set1) set2)))
        (else (intersection (cdr set1) set2))))

;; test case
(define x '(a a a b b c d d d e f f))
(define y '(a a a b d d g h h k))
(element-of-set 'd x)
(adjoin-set 'g x)
(union-set x y)
;; Note: for the intersection, the result depends on the order of the sets being
;; intersected.
(intersection x y) ; (a a a b b d d d)
(intersection y x) ; (a a a b d d)

;; The applications which prefers duplicated representations: I don't have a
;; concrete idea yet, but I guess the applications whose operations are  mainly
;; adjoin or union sets.