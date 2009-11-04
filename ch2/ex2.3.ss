;; Exercise 2.3

;; line segment
(define (make-segment x y)
  (cons x y))
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))

;; point
(define (make-point x y)
  (cons x y))
(define (x-point x)
  (car x))
(define (y-point x)
  (cdr x))

;; find middle point
(define (midpoint-segment line)
  (make-point (/ (+ (x-point (start-segment line))
                    (x-point (end-segment line)))
                 2)
              (/ (+ (y-point (start-segment line))
                    (y-point (end-segment line)))
                 2)))

;; print point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

;; rectangle using 4 points to represent
(define (rectangle a b c d)
  (cons (cons a b)
        (cons c d)))

(define (line-one rect) ;; line ab
  (make-segment (car (car rect))
                (cdr (car rect))))

(define (line-two rect) ;; line bc
  (make-segment (cdr (car rect))
                (car (cdr rect))))

(define (line-three rect) ;; line cd
  (make-segment (car (cdr rect))
                (cdr (cdr rect))))

(define (line-four rect) ;; line da
  (make-segment (cdr (cdr rect))
                (car (car rect))))

(define (segment-length line)
  (sqrt (+ (sqr (- (x-point (start-segment line)) (x-point (end-segment line))))
           (sqr (- (y-point (start-segment line)) (y-point (end-segment line)))))))

(define (perimeter rect line-one line-two)
  (* (+ (segment-length (line-one rect))
        (segment-length (line-two rect)))
     2))

(define (area rect line-one line-two)
  (* (segment-length (line-one rect))
     (segment-length (line-two rect))))

;; rectangle (0, 0) (0, 2) (4, 2) (4, 0)
(define test-rectangle (rectangle (make-point 0 0)
                                  (make-point 0 2)
                                  (make-point 4 2)
                                  (make-point 4 0)))

(perimeter test-rectangle line-one line-two) ;; 12
(area test-rectangle line-one line-two) ;; 8

;; rectangle using 4 line segments to represent
(define (rect-line-seg a b c d)
  (cons (cons a b)
        (cons c d)))

(define (line-seg-one rect)
  (car (car rect)))
(define (line-seg-two rect)
  (cdr (car rect)))
(define (line-seg-three rect)
  (car (cdr rect)))
(define (line-seg-four rect)
  (cdr (cdr rect)))

;; rectangle (2, 3) (2, 7) (5, 7) (5, 3)
(define test-rect2 (rect-line-seg (make-segment (make-point 2 3)
                                                (make-point 2 7))
                                  (make-segment (make-point 2 7)
                                                (make-point 5 7))
                                  (make-segment (make-point 5 7)
                                                (make-point 5 3))
                                  (make-segment (make-point 5 3)
                                                (make-point 2 3))))
(perimeter test-rect2 line-seg-one line-seg-two) ;; 14
(area test-rect2 line-seg-one line-seg-two) ;; 12

;; I have some doubts about this exercise, no matter how I desgin the rectangle, I need
;; to pass the line-one and line-two procedure to perimeter and area to get the correct
;; lines with different representation of rectangles. That's why perimeter and area
;; take two more arguments which calculate the length of the two sides of the rectangle.
;; Is it possible that the perimeter or area choose the corresponding `line-one' or
;; `line-two' procedure automatically?
