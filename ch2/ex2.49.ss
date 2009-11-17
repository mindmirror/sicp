;; Exercise 2.49

(require (planet soegaard/sicp:2:1/sicp))

(define origin (make-vect -2 1))
(define edge1 (make-vect -1 2))
(define edge2 (make-vect 1 1))

(define frame1 (make-frame origin edge1 edge2))

(define origin-point (make-vect 0 0))
(define edge1-point (make-vect 0 1))
(define edge2-point (make-vect 1 0))
(define rest-point (make-vect 1 1))

;; I think there are some problems with soegaard's package
;; segments->painter should take a list of segments and return a procedure.
;; It seems it returns a painter, or at least I can paint it. 

;; a.
(paint (segments->painter
        (list (make-segment origin-point edge1-point)
              (make-segment origin-point edge2-point)
              (make-segment edge1-point rest-point)
              (make-segment edge2-point rest-point))))
(newline)

;; b.
(paint (segments->painter
        (list (make-segment origin-point rest-point)
              (make-segment edge1-point edge2-point))))
(newline)

(define point-a (vector-scale 1/2 (vector-add origin-point edge1-point)))
(define point-b (vector-scale 1/2 (vector-add origin-point edge2-point)))
(define point-c (vector-scale 1/2 (vector-add edge1-point rest-point)))
(define point-d (vector-scale 1/2 (vector-add edge2-point rest-point)))

;; c.
(paint (segments->painter
        (list (make-segment point-a point-b)
              (make-segment point-a point-c)
              (make-segment point-b point-d)
              (make-segment point-c point-d))))
(newline)

;; d.
;; This part is from code17

(define wave
  (let ((p01 (make-vect 0.40 1.00)) (p02 (make-vect 0.60 1.00))
                                    (p03 (make-vect 0.00 0.80)) (p04 (make-vect 0.35 0.80))
                                    (p05 (make-vect 0.65 0.80)) (p06 (make-vect 0.00 0.60))
                                    (p07 (make-vect 0.30 0.60)) (p08 (make-vect 0.40 0.60))
                                    (p09 (make-vect 0.60 0.60)) (p10 (make-vect 0.70 0.60))
                                    (p11 (make-vect 0.20 0.55)) (p12 (make-vect 0.30 0.55))
                                    (p13 (make-vect 0.35 0.50)) (p14 (make-vect 0.65 0.50))
                                    (p15 (make-vect 0.20 0.45)) (p16 (make-vect 1.00 0.40))
                                    (p17 (make-vect 0.50 0.20)) (p18 (make-vect 1.00 0.20))
                                    (p19 (make-vect 0.25 0.00)) (p20 (make-vect 0.40 0.00))
                                    (p21 (make-vect 0.60 0.00)) (p22 (make-vect 0.75 0.00)))
    (let ((wave-outline
           (list (make-segment p01 p04) (make-segment p04 p08)
                 (make-segment p07 p11) (make-segment p08 p07)
                 (make-segment p11 p03) (make-segment p06 p15)
                 (make-segment p15 p12) (make-segment p12 p13)
                 (make-segment p13 p19) (make-segment p20 p17)
                 (make-segment p17 p21) (make-segment p22 p14)
                 (make-segment p14 p18) (make-segment p16 p10)
                 (make-segment p10 p09) (make-segment p09 p05)
                 (make-segment p05 p02))))
      (segments->painter wave-outline))))

(paint wave)
