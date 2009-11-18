;; Exercise 2.50

(require (planet soegaard/sicp:2:1/sicp))

;; The transform-painter method in soegaard package is a little bit different from
;; the one in the book

(define (my-flip-horiz painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0))
   painter))

(display "Normal Einstein")
(newline)
(paint einstein)

(display "Flip-horiz Einstein")
(newline)
(paint (my-flip-horiz einstein))

(define (my-rotate-180 painter)
  ((transform-painter (make-vect 1.0 1.0)
                      (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0))
   painter))

(display "Rotate 180 Einstein")
(newline)
(paint (my-rotate-180 einstein))

(define (my-rotate-270 painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0))
   painter))

(display "Rotate 270 Einstein")
(newline)
(paint (my-rotate-270 einstein))
