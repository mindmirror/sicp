;; Exercise 2.55

; (car ''abracadabra) =>
; (car (quote (quote abracadabra))) =>
; (car (list 'quote '(quote abracadabra)))

;; As you can see, ''abracadabra is actually a list formed by 'quote and
;; (quote abracadabra). When `caring' this list, it returns 'quote, and the interpreter
;; will print a `quote'. When `cdring' it, you will get (quote abracadabra), which is
;; evaluated from '(quote abracadabra) and the interpreter will print `(abracadabra)'.
