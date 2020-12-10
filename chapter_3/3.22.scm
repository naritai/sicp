(define (make-queue)
  (let ([front-ptr `()]
        [rear-ptr `()])

  (define (empty-queue?) (null? front-ptr))

  (define (insert-queue! item)
    (let ([new-pair (cons item `())])
      (cond [(empty-queue?) 
              (set! front-ptr new-pair)
              (set! rear-ptr new-pair)]
            [else
              (set-cdr! rear-ptr new-pair)
              (set! rear-ptr new-pair)])))

  (define (delete-queue!)
    (cond [(empty-queue?)
            (print "Нельзя удалить элемент из пустой очереди")]
          [else (set! front-ptr (cdr front-ptr))]))
  
  (define (dispatch m)
    (cond [(eq? m `empty-queue?) empty-queue?]
          [(eq? m `front-queue) (print front-ptr)]
          [(eq? m `rear-queue) (print rear-ptr)]
          [(eq? m `insert-queue!) insert-queue!]
          [(eq? m `delete-queue!) delete-queue!]
          [else (print "Unknown message -- " m)]))
dispatch))

(define q1 (make-queue))
((q1 `insert-queue!) `a)
((q1 `insert-queue!) `b)
((q1 `insert-queue!) `c)

((q1 `delete-queue!))
((q1 `delete-queue!))
((q1 `delete-queue!))
((q1 `front-queue))
