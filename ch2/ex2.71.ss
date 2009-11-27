;; Exercise 2.71

;; n = 5
;;
;;                          * (A B C D E) 31
;;                         / \
;;                    16  A   * (B C D E) 15
;;                           / \
;;                       8  B   * (C D E) 7
;;                             / \
;;                         4  C   * (D E) 3
;;                               / \
;;                           2  D   E 1
;;   A: 0
;;   B: 10
;;   C: 110
;;   D: 1110
;;   E: 1111

;; n = 10
;;                          * (A B C D E F G H I J) 1023
;;                         / \
;;                   512  A   * (B C D E F G H I J) 511
;;                           / \
;;                     256  B   * (C D E F G H I J) 255
;;                             / \
;;                       128  C   * (D E F G H I J) 127
;;                               / \
;;                          64  D   * (E F G H I J) 63
;;                                 / \
;;                            32  E   * (F G H I J) 31
;;                                   / \
;;                              16  F   * (G H I J) 15
;;                                     / \
;;                                 8  G   * (H I J) 7
;;                                       / \
;;                                   4  H   * (I J) 3
;;                                         / \
;;                                     2  I   J 1
;;   A: 0
;;   B: 10
;;   C: 110
;;   D: 1110
;;   E: 11110
;;   F: 111110
;;   G: 1111110
;;   H: 11111110
;;   I: 111111110
;;   J: 111111111

;; Most frequent symbol: 1 bit
;; Least frequent symbol: n-1 bits. (log2(2^(n-1))) = n-1
