;; Exercise 2.69

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (leaf? object)
  (eq? (car object) 'leaf))

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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;; iterative
;; Key: make the code tree from the lowest weight to highest
(define (generate-huffman-tree-i pairs)
  (successive-merge-i (make-leaf-set pairs)))
(define (successive-merge-i leaf-set)
  (define (iter set result)
    (if (null? set)
        result
        (iter (cdr set) (make-code-tree (car set) result))))
  (iter (cdr leaf-set) (car leaf-set)))

;; recursive
;; Key: make code tree using first two leaf, then using adjoin-set to put it
;; back, which keeps the order of the leaf set.
(define (generate-huffman-tree-r pairs)
  (successive-merge-r (make-leaf-set pairs)))
(define (successive-merge-r leaf-set)
  (if (null? (cdr leaf-set))
      (car leaf-set)
      (successive-merge-r
       (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                   (cddr leaf-set)))))

(define test-pairs '((A 4) (B 2) (C 1) (D 1)))
(generate-huffman-tree-i test-pairs)
(generate-huffman-tree-r test-pairs)
