;; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.
;
;         1
;       1   1
;     1   2   1
;   1   3   3   1
; 1   4   6   4   1

;; The numbers at the edge of the triangle are all 1, and each number inside the
;; triangle is the sum of the two numbers above it. Write a procedure that
;; computes elements of Pascal's triangle by means of a recursive process. 

(define (pt row col)
  (cond ((or (= row 1) (= col 1) (= col row)) 1)
        (else (+ (pt (- row 1) (- col 1)) (pt (- row 1) col)))))

(define (get-row x)
  (get-row-iter 1 x))

(define (get-row-iter r x)
  (if (and (<= (+ (/ (* r (- r 1)) 2) 1) x) 
           (<= x (/ (* r (+ r 1)) 2)))
      r
      (get-row-iter (+ r 1) x)))
        
(define (get-col x)
  (- x (total-elements (- (get-row x) 1))))

(define (total-elements row)
  (/ (* row (+ row 1)) 2))

(define (pascal-triangle n)
  (pt (get-row n) (get-col n)))
