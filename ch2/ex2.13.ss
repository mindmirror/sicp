;; Exercise 2.13

;; (c1, p1) and (c2, p2) are two intervals in center-percent format
;; The new inverval of multiplication of (c1, p1) and (c2, p2) is
;; (c1c2(1 - p1)(1 - p2), c1c2(1 + p1)(1 + p2))
;; The center is
;;   (c1c2(1 - p1)(1 - p2) + c1c2(1 + p1)(1 + p2)) / 2
;; = c1c2 + c1c2p1p2
;; The percent is
;;   (c1c2(1 + p1)(1 + p2) - c1c2(1 - p1)(1 - p2)) / 2 * center
;; = (p1 + p2) / (1 + p1p2)
;; When the percentage tolerances are very small
;; the percent can be approximate to
;; p1 + p2

