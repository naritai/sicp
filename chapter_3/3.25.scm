(define (same-key? key1 key2)
  (cond [(or (number? key1) (number? key2))
          (< (abs (- key1 key2)) 0.0001)]
        [else (equal? key1 key2)]))

(define (make-table same-key?)
  (let ([local-table (list `*table*)])

  (define (assoc-insert key records)
    (cond [(null? records) #f]
            [(same-key? key (car records)) (car records)]
            [else (assoc-insert key (cdr records))]))

  (define (assoc-lookup key records)
    (cond [(null? records) #f]
            [(same-key? key (car records)) (car records)]
            [else (assoc-lookup key (cdr records))]))

  (define (lookup keys)
    (define (iter keys table)
      (cond [(null? keys) (cdr table)]
            [else 
              (let ([subtable (assoc-lookup (car keys) table)]) 
                (if subtable
                  (iter (cdr keys) subtable)
                  #f))]))
      (iter keys (cdr local-table)))

    (define (insert! keys value)
      (define (iter keys value table)
        (cond [(null? keys) #f]       ; if no keys -> return false
              [(= (length keys) 1)    ; if 1 key -> set value
                (set-cdr! table 
                          (cons (cons (car keys) value)
                                (cdr table)))]
              [else 
                (let ([subtable (assoc-insert (car keys) table)]) ; error: try caar of table
                  (if subtable
                    (iter (cdr keys) value subtable)
                    (begin
                      (set-cdr! table
                                (cons (list (car keys) `())
                                      (cdr table)))
                      (iter (cdr keys) value (cdr table)))))]
        )`ok)
        (iter keys value local-table)
    )
    
    (define (dispatch m)
      (cond [(eq? m `lookup-proc) lookup]
            [(eq? m `insert-proc!) insert!]
            [else (print "Неизвестная операция -- TABLE"m)]))

dispatch))
  

(define my-tab (make-table same-key?))
(define get (my-tab `lookup-proc))
(define set (my-tab `insert-proc!))

(set (list `a `b `c) 100)
(get (list `a `b `c))

