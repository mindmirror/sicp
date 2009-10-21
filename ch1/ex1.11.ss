;; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and
;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>=3. Write a procedure that
;; computes f by means of a recursive process. Write a procedure that computes f
;; by means of an iterative process. 

;; 1) using recursive process
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

;; 2) using iterative process
(define (f2 n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

        


