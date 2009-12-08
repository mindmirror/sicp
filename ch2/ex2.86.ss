;; Exercise 2.86

;; In the operations such as `add', `sub', `mul' and `div' in complex package,
;; only the selector of `rectangular' or `polar' package is used. If we want to
;; make the complex package a more general one, we only need to change the
;; `rectangular' and `polar' package.
;;
;; What needs to be changed is the primitive operations such as `+', `*',
;; `square', `sqrt', `sine' and `cosine'. Make all these procedures general.
;; That is implement them for each number system. Then the selector of
;; `rectangular' and `polar' will use the these generic procedures without
;; worring the internals. This way we also ensure that when new types are added
;; into the system, they can be easily incorporated as the elements of complex
;; numbers by implementing the appropriate generic procedures.
