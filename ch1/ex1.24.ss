;; Exercise 1.24. Modify the timed-prime-test procedure of exercise 1.22 to use
;; fast-prime? (the Fermat method), and test each of the 12 primes you found in
;; that exercise. Since the Fermat test has Theta(log n) growth, how would you
;; expect the time to test primes near 1,000,000 to compare with the time needed
;; to test primes near 1000? Do your data bear this out? Can you explain any
;; discrepancy you find? 

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds) 1000)) ; repeat fast-prime? 1000 times.
(define (start-prime-test n start-time repeat-count)
  (cond ((> repeat-count 0) (fast-prime? n 10) (start-prime-test n start-time (- repeat-count 1)))
        ((= repeat-count 0) (if (fast-prime? n 10)
                                (report-prime (- (current-milliseconds) start-time))))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)

;; My machine is too fast to see any time cost on prime test. So I will do the 
;; fast-prime? 1000 times before reporting it. Theoretically, test the primes
;; near 1,000,000 should be 2 times longer than the time needed to test primes
;; near 1,000. And test the primes near 1,000,000 should be 3 times longer than
;; primes near 1,000. The ratio on my machine is about 1 : 3.32 : 5.36. Although
;; it is not so close to the theoretical ratio, it is still in a Theta(log n) 
;; manner. I will figure this out later.

;; Reference from code17 02/28/05
;; 分析:
;;
;; 由数据可见，t(1000)=0.6*, t(1000000)=0.16*, t(1000000000)=0.24*
;; 并非很严格地满足1:2:3，但基本满足与n之间的指数关系，其中后两者的关系
;; 比较符合2:3， 前两者的关系比例约为1:2.3左右
;; 根据我们的模型t(n) = c * log(n)
;;             t(n^2) = c * log(n^2) = 2c * log(n)
;; 这表明，由于某些因素的作用，c在某些区间之间不保持一致，某些情况下
;; 产生了一定误差，但总体还是将指数增长的n降为一种近似线性关系的t。
;;
;; 考察我们分析时间复杂度的过程，我们可以发现，我们的时间复杂度计算基本根据
;; 递归的次数多少,我们认为即使在不同的n的情况下，每次递归的代价是一样的。
;; 而在每次递归中我们所进行的操作是random，squre和remainder，因此我们的
;; 分析基于一个基本假定：所有的这样操作，无论操作对象的大小位数，代价都是近
;; 似相同的。1 * 1的代价和10000 * 10000 是一样的。这个假设可以说是基本正
;; 确的，固定的机器代码操作是不论操作对象大小的。但，它也可能出问题，在那些
;; 操作对象的“字长”产生变化的时候。如果1和10000都是占用8位机器码，那么
;; 同样的操作作用在它们上的代价相同，但如果10000000000占用16位，那么操作
;; 的代价就是不同的了。
;;
;; 因此我们有这样的猜测，从1000到1000000的过程中，字长发生了变化(不一定是
;; 1000到1000000的字长不同，而是对它们的某些操作所使用的字长，比如square要
;; double操作数的位数)。 这很可能是为什么1000和1000000不严格符合比例，而
;; 1000000和1000000000基本符合比例的原因。
;;
;; 为了测试我们的想法，我们可以写一个测试函数
;; (define (test1 n c) 
;;    (* (remainder (* n (random n)) n)
;;       (remainder (* n (random n)) n))
;;    (if (> c 0) (test1 n  (- c 1))))
;; 这个函数也使用类似fast-prime中的操作random，square和remainder，甚至对应
;; 的函数所产生的数字位数都基本近似，不同在于对于n和n^2，它们会执行“相同”多
;; 的次数c，在“不同”级别的操作数n上。这样它就把操作数的因素孤立了出来(操作次
;; 数现在是一样的了)。然后我们使用另一个(test n c)函数来调用它并测量使用时间
;; (define (test num times)
;;   (display (current-inexact-milliseconds))
;;   (newline)
;;   (test1 num times)
;;   (display (current-inexact-milliseconds))
;;   (newline))
;; 结果和我们预测的一样
;; (test 1000 10000) 大约用了23毫秒时间
;; (test 1000000 10000) 大约用了69毫秒时间
;; (test 1000000000 10000) 同样用了大约69-71毫秒时间
;; 也就是说，执行同样的操作，1000000 1000000000 的代价是一样的，而1000则与它们
;; 不同(小于这两者)， 这很好地解释了我们在Fermat函数测试中的结果，这完全可能是
;; 字长变化产生的原因。 因此，我们知道，在正常情况下，我们可以认为同样的操作在
;; 不同的操作数上的代价基本相同，但某些涉及字长的特殊情况，则很可能是不同的。但
;; 无论如何，这样的误差同样是线性的，即常数因子的不同，不影响整体的复杂性量级。
;;
;; 另外，对于在题目1.22使用普通的prime?作测试函数时，为什么没发生这样的现象，我们
;; 可以发现一个很简单的解释。在1.22中，对于操作数n，具体计算函数操作数量级最高是
;; 是n，对于在此题中使用的最大的n=100000来说，[sqrt](100000)=10^5并不
;; 是很大；而在使用fermat-test的expmod时，具体计算函数的操作数的数量级是n^2，因此
;; 1000^2=10^6, 1000000^2=10^12。说明字长变化出现在10^6-10^12之间，这应该是
;; 为什么在使用普通prime?函数时没有明显误差的原因，它的字长没有达到变化的边界。

;; 注意，本实验的实际结果和字长分界点等情况与具体编译器和机器物理性质相关，请自行
;; 测试。另外，还有一个可能导致误差的原因，是n=1000比较小，一些基础的overhead(比
;; 如启动)比较明显，而在n为大数时则不明显，但这个原因的说服力不够。
