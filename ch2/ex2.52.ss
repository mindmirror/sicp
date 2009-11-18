;; Exercise 2.52

(require (planet soegaard/sicp:2:1/sicp))

;; a.
;; wave
(define wave
  (let ((p01 (make-vect 0.40 1.00))
        (p02 (make-vect 0.60 1.00))
        (p03 (make-vect 0.00 0.80))
        (p04 (make-vect 0.35 0.80))
        (p05 (make-vect 0.65 0.80))
        (p06 (make-vect 0.00 0.60))
        (p07 (make-vect 0.30 0.60))
        (p08 (make-vect 0.40 0.60))
        (p09 (make-vect 0.60 0.60))
        (p10 (make-vect 0.70 0.60))
        (p11 (make-vect 0.20 0.55))
        (p12 (make-vect 0.30 0.55))
        (p13 (make-vect 0.35 0.50))
        (p14 (make-vect 0.65 0.50))
        (p15 (make-vect 0.20 0.45))
        (p16 (make-vect 1.00 0.40))
        (p17 (make-vect 0.50 0.20))
        (p18 (make-vect 1.00 0.20))
        (p19 (make-vect 0.25 0.00))
        (p20 (make-vect 0.40 0.00))
        (p21 (make-vect 0.60 0.00))
        (p22 (make-vect 0.75 0.00))
        (p23 (make-vect 0.45 0.70))  ;; smile point
        (p24 (make-vect 0.55 0.70))  ;; smile point
        (p25 (make-vect 0.50 0.68))) ;; smile point
    (let ((wave-outline
           (list (make-segment p01 p04)
                 (make-segment p04 p08)
                 (make-segment p07 p11)
                 (make-segment p08 p07)
                 (make-segment p11 p03)
                 (make-segment p06 p15)
                 (make-segment p15 p12)
                 (make-segment p12 p13)
                 (make-segment p13 p19)
                 (make-segment p20 p17)
                 (make-segment p17 p21)
                 (make-segment p22 p14)
                 (make-segment p14 p18)
                 (make-segment p16 p10)
                 (make-segment p10 p09)
                 (make-segment p09 p05)
                 (make-segment p05 p02)
                 (make-segment p23 p25)     ;; simle here
                 (make-segment p25 p24))))  ;; smile here
      (segments->painter wave-outline))))

(paint wave)

;; b.
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter
               (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(paint (corner-split einstein 4))

(display "New corner-split")
(newline)
(define (new-corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((corner (corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner))))))
(paint (new-corner-split einstein 4))

;; c.
(display "New square-limit")
(newline)
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (below (beside (bl painter) (br painter))
           (beside (tl painter) (tr painter)))))

(define (new-square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))

(paint (new-square-limit einstein 4))
