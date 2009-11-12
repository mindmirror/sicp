;; Exercise 2.41

;; Note: This is a nested loop with three levels, and we need to flatmap twice.
;; 1 <= i < j < k <= n

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op init seq)
  (if (null? seq)
      null
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (triple-sum n s)
  (filter (lambda (t) (= (+ (car t) (cadr t) (caddr t)) s))
          (flatmap (lambda (i)
                     (flatmap (lambda (j)
                                (map (lambda (k)
                                       (list i j k))
                                     (enumerate-interval 1 (- j 1))))
                              (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(triple-sum 8 12)

;; A nested loop with map
(map (lambda (i)
       (map (lambda (j)
              (map (lambda (k)
                     (list i j k))
                   (enumerate-interval 1 (- j 1))))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 4))
