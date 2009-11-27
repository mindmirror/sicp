;; Exercise 2.70

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
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

(define (generate-huffman-tree pairs)
  (successive-merge-r (make-leaf-set pairs)))
(define (successive-merge-r leaf-set)
  (if (null? (cdr leaf-set))
      (car leaf-set)
      (successive-merge-r
       (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                   (cddr leaf-set)))))

;; The leaf input order doesn't matter since make-leaf-set will order it
(define pairs '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))
(define tree (generate-huffman-tree pairs))
tree

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

(define lyrics1 '(get a job))
(define lyrics2 '(sha na na na na na na na na))
(define lyrics3 '(get a job))
(define lyrics4 '(sha na na na na na na na na))
(define lyrics5 '(wah yip yip yip yip yip yip yip yip yip))
(define lyrics6 '(sha boom))

(encode lyrics1 tree)
(encode lyrics2 tree)
(encode lyrics3 tree)
(encode lyrics4 tree)
(encode lyrics5 tree)
(encode lyrics6 tree)

;; 84 bits are required.
;; For fiexed-length code: 108 bits are needed.
