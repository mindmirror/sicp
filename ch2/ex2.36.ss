;; Exercise 2.36

;; The key is using map and expand the recursive procedure to see the insight.

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? seqs)
      null
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (if (pair? (cdr (car seqs)))
                                      (map (lambda (x) (cdr x)) seqs)
                                      null)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
s
(accumulate-n + 0 s)

;; Update:
;; I made a mistake when copying the original setup in accumulate-n
;; The return condition is (null? (car seqs)) where I made it wrong to (null? seqs)
;; The extra findings are that there is no way you map a procedure to a list of nulls
;; and return a null. And,
;;   (map (lambda (x) (proc x)) list) is equal to
;;   (map proc list)

;; The updated version
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
(accumulate-n + 0 s)

