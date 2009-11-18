;; Exercise 2.55

; (car ''abracadabra) =>
; (car (quote (quote abracadabra))) =>
; (car '(quote abracadabra))

;; As you can see ''abracadabra is actually a list, where quote and abracadabra
;; are items in the list. When `caring' it, it returns quote; when `cdring' it,
;; it returns (abracadabra).
