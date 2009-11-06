;; Exercise 2.20

(define (same-parity x . n)
  (if (null? n)
      '()
      (cond ((and (even? x) (even? (car n))) (cons (car n) (same-parity x (cdr n))))
            ((and (odd? x) (odd? (car n))) (cons (car n) (same-parity x (cdr n))))
            (else (same-parity x (cdr n))))))

(same-parity 1 2 3 4 5 6 7)
