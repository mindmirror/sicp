;; Exercise 2.9

;; width
; width = (upper-bound - lower-bound) / 2

;; width of (interval1 + interveral2)
; width-of-sum
; = (upper-bound(interval1 + interval2) - lower-bound(inteval1 + interval2)) / 2
; = ((upper-bound1 + upper-bound2) - (lower-bound1 + lower-bound2)) / 2
; = ((upper-bound1 - lower-bound1) / 2 + (upper-bound2 - lower-bound2) / 2)
; = (width1 + width2)

;; for width of (interval1 - interval2)
; width-of-sub = (width(interval1) + width(interval2))
;; Attention: same as width-of-sum, it is a sum of two intervals

;; For multiplication
;; (2, 7) (3, 5)
;; The width of the above intervals are 2.5 and 1
;; The multiplication of the two intervals are (6, 35)
;; The new width is 24.5
;; Hence, the it is not true for multiplication
