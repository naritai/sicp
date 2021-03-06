(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons `() `()))

(define (front-queue queue)
  (if (empty-queue? queue)
    (print "FRONT вызвана с пустой очередью")
  (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item `())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
           (else 
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (print "DELETE! вызвана с пустой очередью" queue))
        (else
          (set-front-ptr! queue (cdr (front-ptr queue)))
          queue)))

(define (map proc items)
  (if (null? items)
    `()
  (cons (proc (car items)) 
        (map proc (cdr items)))))

(define (print-queue queue)
  (newline)
  (display "(")
  (map (lambda (x) (display x)) (front-ptr queue))
  (display ")"))

(define q1 (make-queue))
(insert-queue! q1 `a)
(insert-queue! q1 `b)
(newline)
(print-queue q1)

(delete-queue! q1)
(delete-queue! q1)
(newline)
(print-queue q1)

(delete-queue! q1)