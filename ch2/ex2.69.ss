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
;; Update: cannot simply make-code-tree one leaf by one leaf from the leaf-set,
;; have to compare the weight between the newly made tree branch and leaf or old
;; tree branch. Hence we need to adjoin-set to concatenate the new branch and
;; the old set.
(define (generate-huffman-tree-i pairs)
  (successive-merge-i (make-leaf-set pairs)))
(define (successive-merge-i leaf-set)
  (define (iter set)
    (if (null? (cdr set))
        set
        (iter (adjoin-set (make-code-tree (car set) (cadr set))
                          (cddr set)))))
  (iter leaf-set))

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

(define test-pairs '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))
(generate-huffman-tree-i test-pairs)
(generate-huffman-tree-r test-pairs)
