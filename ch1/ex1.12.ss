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

(define (pascal-triangle n)
  (pt-recur (get-row n) (get-col n)))

(define (get-row n)
  (get-row-iter 1 n))

(define (get-row-iter r n)
  (if (and (<= (+ (/ (* r (- r 1)) 2) 1) n) 
           (<= n (/ (* r (+ r 1)) 2)))
      r
      (get-row-iter (+ r 1) n)))
        
(define (get-col n)
  (- n (total-elements (- (get-row n) 1))))

(define (total-elements row)
  (/ (* row (+ row 1)) 2))

(define (pt-recur row col)
  (cond ((or (= row 1) (= col 1) (= col row)) 1)
        (else (+ (pt-recur (- row 1) (- col 1)) (pt-recur (- row 1) col)))))

;; Test case
;; So far I don't know how to do standard output so I just use a simple way to 
;; test it
(pascal-triangle 1)
(pascal-triangle 2)
(pascal-triangle 3)
(pascal-triangle 4)
(pascal-triangle 5)
(pascal-triangle 6)
(pascal-triangle 7)
(pascal-triangle 8)
(pascal-triangle 9)
(pascal-triangle 10)
(pascal-triangle 11)
(pascal-triangle 12)
(pascal-triangle 13)
(pascal-triangle 14)
(pascal-triangle 15)

;; Pascal trangle in block structure
;; In block structure
(define (pascal-triangle-in-block n)
  (define (get-row)
    (define (get-row-iter r)
      (if (and (<= (+ (/ (* r (- r 1)) 2) 1) n) 
           (<= n (/ (* r (+ r 1)) 2)))
      r
      (get-row-iter (+ r 1))))
    (get-row-iter 1))
  (define (total-elements row)
    (/ (* row (+ row 1)) 2))
  (define (get-col)
    (- n (total-elements (- (get-row) 1))))
  (define (pt-recur row col)
    (cond ((or (= row 1) (= col 1) (= col row)) 1)
        (else (+ (pt-recur (- row 1) (- col 1)) (pt-recur (- row 1) col)))))
  (pt-recur (get-row) (get-col)))

;; Test case
(pascal-triangle-in-block 1)
(pascal-triangle-in-block 2)
(pascal-triangle-in-block 3)
(pascal-triangle-in-block 4)
(pascal-triangle-in-block 5)
(pascal-triangle-in-block 6)
(pascal-triangle-in-block 7)
(pascal-triangle-in-block 8)
(pascal-triangle-in-block 9)
(pascal-triangle-in-block 10)
(pascal-triangle-in-block 11)
(pascal-triangle-in-block 12)
(pascal-triangle-in-block 13)
(pascal-triangle-in-block 14)
(pascal-triangle-in-block 15)
