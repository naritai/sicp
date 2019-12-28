(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define list1 (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))

(define (every-f items)
  (if (null? items)
  '()
  (cons (car (car items)) (every-f (cdr items)))))

(define (except-every-f items)
  (if (null? items)
  '()
  (cons (cdr (car items)) (except-every-f (cdr items)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
  '()
  (cons (accumulate op init (every-f seqs))
        (accumulate-n op init (except-every-f seqs)))))

(accumulate-n + 0 list1)