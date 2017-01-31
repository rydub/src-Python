(define (find s predicate)
  (if (null? s) #f 
  	(if (predicate (car s)) (car s) (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
  (define (cycler s orig)
  	(if (null? s) #f
  		(if (eq? (cdr-stream s) orig) #t
  			(cycler (cdr-stream s) orig))))
  (cycler s s)
)

(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
