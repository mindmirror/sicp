;; Exercise 2.20

(define (same-parity x . n)
  (define (get-same-parity items)
    (if (or (and (even? x) (even? (car items)))
            (and (odd? x) (odd? (car items))))
        (car items)
        '()))
  (define (iter n items)
    (cond ((null? n) items)
          ((not (null? (get-same-parity n)))
           (iter (cdr n) (append items (list (get-same-parity n)))))
          (else (iter (cdr n) items))))
  (iter n (list x)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

;; version 2 -- from code17
(define (same-parity2 x . n)
  (define parity (if (odd? x) odd? even?))
  (define (iter l)
    (cond ((null? l) l)
          ((parity (car l)) (cons (car l) (iter (cdr l))))
          (else (iter (cdr l)))))
  (cons x (iter n)))

(same-parity2 1 2 3 4 5 6 7)
(same-parity2 2 3 4 5 6 7)

    