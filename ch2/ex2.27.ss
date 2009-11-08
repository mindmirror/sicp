;; Exercise 2.27

(define (reverse-r items)
  (if (null? items)
      null
      (append (reverse-r (cdr items)) (list (car items)))))

;; Test case
(reverse-r (list 1 2 3 4 5 6 7))

(define (reverse-i items)
  (define (iter i result)
    (if (null? i)
        result
        (iter (cdr i) (cons (car i) result))))
  (iter items null))

;; Test case
(reverse-i (list 1 2 3 4 5 6 7))

;; deep-reverse
(define (deep-reverse-i items)
  (define (iter i result)
    (cond ((null? i) result)
          ((pair? (car i)) (iter (cdr i)
                                 (cons (iter (car i) null) result)))
          (else (iter (cdr i) (cons (car i) result)))))
  (iter items null))

;; Test case
(define x (list (list 1 2) (list 3 4)))
x
(reverse-i x)
(deep-reverse-i x)

;; deep-reverse iterative
(define (deep-reverse-r items)
  (cond ((null? items) null)
        ((pair? (car items)) (append (deep-reverse-r (cdr items))
                                     (list (deep-reverse-r (car items)))))
        (else (append (deep-reverse-r (cdr items)) (list (car items))))))

;; Test case
(deep-reverse-r x)

;; Test case from Pan Xingzhi
(define y '((1 2) (3 4 5) (6 (7 8))))
y
(deep-reverse-i y)
(deep-reverse-r y)

;; More elegant way from code17
(define (deep-reverse items)
  (if (pair? items)
      (append (deep-reverse (cdr items))
              (list (append (deep-reverse (car items)))))
      items))

;; Test case
(deep-reverse y)
