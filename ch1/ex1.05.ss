;; Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the 
;; interpreter he is faced with is using applicative-order evaluation or 
;; normal-order evaluation. He defines the following two procedures:

;    (define (p) (p))

;    (define (test x y)
;      (if (= x 0)
;          0
;          y))

;; Then he evaluates the expression

;    (test 0 (p))

;; What behavior will Ben observe with an interpreter that uses 
;; applicative-order evaluation? What behavior will he observe with an 
;; interpreter that uses normal-order evaluation? Explain your answer. (Assume
;; that the evaluation rule for the special form `if' is the same whether the 
;; interpreter is using normal or applicative order: The predicate expression is
;; evaluated first, and the result determines whether to evaluate the consequent
;; or the alternative expression.) 

;; Answer
;; If an interpreter uses applicative-order evaluation then the value of the 
;; expression will interpreted as 0. If an interpreter uses normal-order
;; evaluation then the interpreter will never return a value. 
;; If the an interpreter uses normal-order evaluation then the interpreter
;; will keep expanding the compound procedure (p). However, when the interpreter
;; evaluate (p), the value is still (p). Hence the interpreter will keep expanding
;; it and never reduce.

;; Update:
;; The above answer is wrong.
;; In (test 0 (p)), if the interpreter uses applicative-order, it will evaluate (p)
;; first. Hence, the interpreter will keep evaluating (if you run (test 0 (p)) in 
;; the interpreter it will never stop.
;; In the case of normal-order evaluation, (test 0 (p)) will be expended to 
;; (if (= 0 0) 0 (p)). According to "Assume that the evaluation rule for the special
;; form `if' is the same whether the interpreter is using normal or applicative
;; order: The predicate expression is evaluated first, and the result determines
;; whether to evauate the consequent or the alternative expression", the
;; interpreter will evaluate '0' first. Hence, it returns 0.