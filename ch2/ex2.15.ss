;; Exercise 2.15

;; Eva is right. If a variable appears only once in a formula, then there is no
;; chance that error bounds will be produced against the variable itself. As we
;; can see in exercise 2.14, (par2 r1 r2) has tighter error bounds. In
;; (par1 r1 r2), both r1 and r2 are repeated twice. When div-interval is
;; evaluated, the error bounds produced by r1 against r1 and r2 against r2 are
;; invovled. Hence it enlarges the span of the interval. 