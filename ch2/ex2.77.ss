;; Exercise 2.77

; (magnitude z) =>
; generic number selector

; (apply-generic 'magnitude z) =>
; (apply-generic 'magnitude (complex rectangular 3 . 4)) =>
; ((get 'magnitude 'complex) (complex rectangular 3 . 4)) =>
; (magnitude (rectangular 3 . 4)) =>
; generic complex number selector

; (apply-generic 'magnitude (rectangular 3 . 4)) =>
; ((get 'magnitude 'rectangular) (3 . 4)) =>
; (magnitude (3 . 4)) =>
; magnitude procedure
; 5

; So apply-generic procedure is called two times.
