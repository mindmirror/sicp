;; Exercise 2.74

;; a.
;; The divisions' file should be structured in two parts. One holds for
;; division's name, another holds for the records in this division. We will use
;; `division' to get the division's name from the division file. use `record' to
;; get the records in this division.

;; The divisions' files are formed as pair
(define (make-division-file division-name personnel-file)
  (cons division-name personnel-file))
(define (division division-file) (car division-file))
(define (record division-file) (cdr division-file))

;; The `find' method is implemented by each division
(define (install-division-A-package)
  (define (get-record employee-name records)
    (find employee-name records))
  (put 'get-record 'division-A get-record)
  'done)

(define (install-division-B-package)
  (define (get-record employee-name records)
    (find employee-name records))
  (put 'get-record 'division-B get-record)
  'done)

(define (get-record employee-name personnel-file)
  (let ((div-name (division personnel-file)))
    (let (get-record-impl (get 'get-record 'div-name))
      (if get-record-impl
          (get-record-impl employee-name (record personnel-file))
          (error
           "No method for this division -- GET-RECORD"
           (division personnel-file))))))

;; b.
;; The record should be structured in two parts. One holds the infomation of the
;; division's name, another holds the employee's record information.
(define (make-record division-name info)
  (cons division-name info))
(define (division record) (car record))
(define (content record) (cdr content))

;; The get-salary procedure can be put inside the install-package.
(define (install-division-A-package)
  (define (get-salary record-info)
    (get-salary-div-A record-info)) ;; division A's get-salary implementation
  (put 'get-salary 'division-A get-salary)
  'done)
;; install-division-B-package is similar

(define (get-salary record)
  (let ((div-name (division record)))
    (let (get-salary-impl (get 'get-salary div-name))
      (if get-salary-impl
          (get-salary-impl (content record))
          (error
           "No method for this division -- GET-SALARY"
           (division record))))))

;; c.
(define (find-employee-record name . args)
  (map (lambda (x) (get-record name x)) args))


;; d.
;; Just install the new division's package for get-record and get-salary.