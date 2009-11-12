;; Exercise 2.40

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(accumulate append
            null
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 5)))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
;; Note: the flatmap procedure is NOT the same as map.
;; Because of the append operation, the input seqequence must be a list of lists.
;; Otherwise, when append the last item in a list, append will give a error saying the
;; itme is not list.


