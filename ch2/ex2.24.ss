;; Exercise 2.24

;; Attention: (list 1 (list 2 (list 3 4))) is not the same as
;;            (cons 1 (cons 2 (cons 3 4)))

;; Expand (list 1 (list 2 (list 3 4))) to pair
;; 
;; => (list 1 (list 2 (cons 3
;;                          (cons 4 null))))
;; => (list 1 (cons 2 (cons (cons 3
;;                                (cons 4 null))
;;                          null)))
;; => (cons 1 (cons (cons 2 (cons (cons 3
;;                                      (cons 4 null))
;;                          null)
;;                  null))
;;
;; Notes: 
;;    (list 2 (list 3 4))
;; => (cons 2
;;          (cons (list 3 4)
;;                null))
;; `cons' will put the `car' item into the `cdr' items, so when
;; (cons 2 (list 3 4)), it returns (2 3 4).
;; If you want (2 (3 4)), you need to (cons 2 (list (list 3 4))), that is
;; (cons 2 (cons (list 3 4) null)).
;; It looks like `cons' will `neutralize' a `list' in the `cdr' place.
;; But `list' will not `neutralize' a `cons'.

;; To get (2 (3 4))
(list 2 (list 3 4))
(list 2 (cons 3 (cons 4 null)))
(cons 2 (list (list 3 4)))
(cons 2 (list (cons 3 (cons 4 null))))
(cons 2 (cons (cons 3 (cons 4 null)) null))


;; Verification
(list 1 (list 2 (list 3 4)))
(cons 1 (cons (cons 2
                    (cons (cons 3
                                  (cons 4 null))
                            null))
              null))

;; Box-and-pointer
;      ________     ________
; --->| * | *-|--->| * | / |
;     --+-----     --+-----
;       |            |
;       |            |
;       V            V
;      ____         ________     ________
;     | 1 |        | * | *-|--->| * | / |
;     ----         --+-----     --+-----
;                    |            |
;                    |            |
;                    V            V
;                   ____         ________     ________
;                  | 2 |        | * | *-|--->| * | / |
;                  ----         --+-----     --+-----
;                                 |            |
;                                 |            |
;                                 V            V
;                                ____         ____
;                               | 3 |        | 4 |
;                               ----         ----

;; Tree structure
;     +
;    / \
;   1   +
;      / \
;     2   +
;        / \
;       3   4
