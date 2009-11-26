;; Exercise 2.68

(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-code-tree left right)
  (list left right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol sym tree)
  (if (leaf? tree)
      (if (eq? sym (symbol-leaf tree))
          '()
          (error "bad symbol -- ENCODE-SYMBOL" sym))
      (if (memq sym (symbols (left-branch tree)))
          (cons '0 (encode-symbol sym (left-branch tree)))
          (cons '1 (encode-symbol sym (right-branch tree))))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(encode '(A D A B B C A) sample-tree) ;; (0 1 1 0 0 1 0 1 0 1 1 1 0)
