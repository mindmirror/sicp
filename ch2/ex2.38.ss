;; Exercise 2.38

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))
(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))       ;; 3/2
(fold-left / 1 (list 1 2 3))        ;; 1/6
(fold-right list null (list 1 2 3)) ;; (1 (2 (3 ())))
(fold-left list null (list 1 2 3))  ;; (((() 1) 2) 3)

;; When op does not depend on the order of the sequence, the fold-right and
;; fold-left will produce the same values for any sequence.
;; That is
;;   (op a b) = (op b a)

