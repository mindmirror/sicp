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

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
;; Note: the flatmap procedure is NOT the same as map.
;; Because of the append operation, the input seqequence must be a list of
;; lists. Otherwise, when append the last item in a list, append will give an
;; error saying the itme is not list.

;; Answer to exercise
;; =============================================================================
(define (unique-pairs n)
  (if (= n 0)
      null
      (map (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n))))

;; Test case
;; =============================================================================
(unique-pairs 5)
(flatmap identity (unique-pairs 5))

(define (prime? n)
  (define (iter i)
    (cond ((> (sqr i) n) true)
          ((= (remainder n i) 0) false)
          (else (iter (+ i 1)))))
  (iter 2))

(define (prime-sum? p)
  (prime? (+ (car p) (cadr p))))

(define (my-filter predicate seq)
  (cond ((null? seq) null)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (make-pair-sum p)
  (list (car p) (cadr p) (+ (car p) (cadr p))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (my-filter prime-sum?
                  (flatmap identity (unique-pairs n)))))

(prime-sum-pairs 6)

