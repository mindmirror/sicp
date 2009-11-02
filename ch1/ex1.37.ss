;; Exercsise 1.37

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i)
                    (recur (+ i 1))))))
  (recur 1))


;; cont-frac in iterative procedure
(define (cont-frac-iter n d k)
  (define (iter result k)
    (if (= k 0)
        result
        (iter (/ (n k) (+ (d k) result)) (- k 1))))
  (iter 0 k))

;; calculat k
(define torlerance 0.00001)
(define (get-k f n d k)
  (if (< (abs (- (f n d k) 0.618034)) torlerance)
      k
      (get-k f n d (+ k 1))))
(get-k cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1)

;; When k is 12, the approximation is accurate to 4 decimal places.