;; Exercsise 1.37

;; Version 1
;; In this version
;;              N_n
;; f = -------------------------
;;       D_n +     N_n-1
;;             -----------------
;;              D_n-1 +  N_n-2
;;                      --------
;;                  ...   
;;                   .      N_1
;;                    .  + -----
;;                          D_1
;; The result is the same as the orginal f if n is independent of N and D
(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

;; Version 2
;; Normal f
;;              N_1
;; f = -------------------------
;;       D_1 +     N_2
;;             -----------------
;;              D_2 +     N_3
;;                      --------
;;                  ...  
;;                   .      N_n
;;                    .  + -----
;;                          D_n
;;
;; I need a counter to do the job
(define (cont-frac2 n d k)
  (define (cont-frac-recur i n d k)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n (- k i)) (+ (d (- k i))
                          (cont-frac-recur (+ i 1) n d k)))))
  (cont-frac-recur 1 n d k))


;; cont-frac in iterative procedure
(define (cont-frac-iter n d k)
  (iter (/ (n k) (d k)) n d k))
(define (iter result n d k)
  (if (= k 0)
      result
      (iter (/ (n (- k 1)) (+ (d (- k 1)) result)) n d (- k 1))))

;; calculat k
(define torlerance 0.00001)
(define (get-k f n d k)
  (if (< (abs (- (f n d k) 0.61803)) torlerance)
      k
      (get-k f n d (+ k 1))))
(get-k cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1)

;; When k is 12, the approximation is accurate to 4 decimal places.