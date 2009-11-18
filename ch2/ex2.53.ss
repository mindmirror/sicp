;; Exercise 2.53

; (a b c)

; ((george))
; (y1 y2)

; y1
; false
; false

; (red shes blue socks)

(list 'a 'b 'c)

(list (list 'george))
(cdr '((x1 x2) (y1 y2)))

(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))

(memq 'red '(red shoes blue socks)) ;; Note: memq returns the sublist when found 'red
