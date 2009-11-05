;; Exercise 2.14

;; Let interval A = (a, b) and 0 <= a <= b
;;  A     (a, b)                            a    b
;; --- = -------- = (a, b) * (1/b, 1/a) = (---, ---)
;;  A     (a, b)                            b    a
;; Surprisingly, A/A is not (a, b), the interval is expanded.

;; Let interval B = (c, d) and 0 <= c <= d
;;  A     (a, b)                            a    b
;; --- = -------- = (a, b) * (1/d, 1/c) = (---, ---)
;;  B     (c, d)                            d    c
;; This expansion is as expected.

;; Now show the difference between (par1 r1 r2) and (par2 r1 r2)
;; For interval r1, let a be the center, p be the percentage, then
;; r1 = (a(1 - p), a(1 + p))
;; For interval r2, let b be the center, q be the percentage, then
;; r2 = (b(1 - q), b(1 + q))
;; 
;; (par1 r1 r2)
;; 
;;     (a(1 - p), a(1 + p)) * (b(1 - p), b(1 + q)) 
;; => --------------------------------------------
;;     (a(1 - p), a(1 + p)) + (b(1 - q), b(1 + q))
;;     
;;        (ab(1 - p)(1 - q), ab(1 + p)(1 + q))
;; => ------------------------------------------------
;;     (a(1 - p) + b(1 - q), a(1 + p) + b(1 + q))
;;
;;       ab(1 - p)(1 - q)       ab(1 + p)(1 + q)
;; => (---------------------, ---------------------)   *
;;      a(1 + p) + b(1 + q)    a(1 - p) + b(1 - q)
;;
;;(par2 r1 r2)
;;
;;                          (1, 1)
;; => --------------------------------------------------
;;             (1, 1)                   (1, 1)
;;     ---------------------- + -----------------------
;;      (a(1 - p), a(1 + p))     (b(1 - q), b(1 + q))
;;
;;                            (1, 1)
;; => -----------------------------------------------------
;;           1           1              1           1
;;     (----------, ----------) + (----------, ----------)
;;       a(1 + p)    a(1 - p)       b(1 + q)    b(1 - q)
;;
;;                          (1, 1)
;; => -----------------------------------------------------
;;        a(1 + p) + b(1 + q)     a(1 - p) + b(1 - q)
;;     (----------------------, ----------------------)
;;         ab(1 + p)(1 + q)        ab(1 - p)(1 - q)
;;
;;       ab(1 - p)(1 - q)        ab(1 + p)(1 + q)
;; => (---------------------, ----------------------)   **
;;      a(1 - p) + b(1 - q)     a(1 + p) + b(1 + q)
;;
;; Now we can easily see the difference between (par1 r1 r2) and (par2 r1 r2).
;; The width of (par1 r1 r2) is larger than the width of (par2 r1 r2).

