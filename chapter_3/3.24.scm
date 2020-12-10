(define (same-key? key1 key2)
  (cond [(or (number? key1) (number? key2))
          (< (abs (- key1 key2)) 0.0001)]
        [else (equal? key1 key2)]))

(define (make-table same-key?)
  (let ([local-table (list `*table*)])

  (define (assoc key records)
  (cond [(null? records) #f]
          [(same-key? key (caar records)) (car records)]
          [else (assoc key (cdr records))]))

  (define (lookup key1 key2)
    (let ([subtable (assoc key1 (cdr local-table))])
      (if subtable 
        (let ([record (assoc key2 (cdr subtable))])
          (if record
            (cdr record)
          #f))
        #f)))

  (define (insert! key1 key2 value)
    (let ([subtable (assoc key1 (cdr local-table))])
      (if subtable 
        (let ([record (assoc key2 (cdr subtable))])
          (if record
            (set-cdr! record value)
            (set-cdr! subtable
                      (cons (cons key2 value)
                            (cdr subtable)))))
        (set-cdr! local-table
                  (cons (list key1
                              (cons key2 value))
                        (cdr local-table)))))
    `ok)

    (define (dispatch m)
      (cond [(eq? m `lookup-proc) lookup]
            [(eq? m `insert-proc!) insert!]
            [else (print "Неизвестная операция -- TABLE"m)]))

dispatch))
  

(define my-tab (make-table same-key?))
(define get (my-tab `lookup-proc))
(define set (my-tab `insert-proc!))

(set 123.000005 `abc `smth)
(get 123 `abd)


