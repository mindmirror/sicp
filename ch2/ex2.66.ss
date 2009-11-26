;; Exercise 2.66

(define (lookup given-key tree-of-records)
  (cond ((null? tree-of-records) false)
        ((< given-key (key (entry tree-of-records)))
         (lookup given-key (left-branch tree-of-records)))
        ((> given-key (key(entry tree-of-records)))
         (lookup given-key (right-branch tree-of-records)))
        ((= given-key (key (entry tree-of-records)))
         (entry tree-of-records))))
