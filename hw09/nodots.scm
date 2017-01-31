(define (hasdot s)
    (and (pair? s) (not (or (pair? (cdr s))(null? (cdr s)))))
    )
            
(define (nodots s)
  (cond ((null? s) s)
        ((hasdot s) (list (nodots (car s)) (cdr s)))
        ((pair? s) (cons (nodots (car s)) (nodots (cdr s))))
        (else s))
)