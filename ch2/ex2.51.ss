;; Exercise 2.51

(require (planet soegaard/sicp:2:1/sicp))

;; 1.
(define (my-below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           ((transform-painter (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               (make-vect 0.0 0.5))
            painter1))
          (paint-top
           ((transform-painter (make-vect 0.0 0.5)
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))
            painter2)))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

(paint (my-below einstein einstein))

;; 2.
(define (my-below2 painter1 painter2)
  (rotate270
   (beside (rotate90 painter1)
           (rotate90 painter2))))

(paint (my-below2 einstein einstein))
