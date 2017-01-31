(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond
  	((> x 0) 1)
  	((< x 0) -1)
  	((= x 0) 0)
  	)
)

(define (square x) (* x x))

(define (pow b n)
  (cond
  	((= n 1) b)
  	((even? n) (square (pow b (/ n 2))))
  	((odd? n) (* b (square (pow b (/ (- n 1) 2)))))
  )
  	
)

(define (ordered? s)
  (cond
  	((null? (cdr s)) True)
  	(( <= (car s) (car(cdr s))) (ordered? (cdr s)))
  	(( > (car s) (car(cdr s))) False)
  )
)

(define (nodots s)
  (cond
  ((null? s) s)
  ((and (pair? s) (not (or (pair? (cdr s))
  		(null? (cdr s))))) (list (nodots (car s)) (cdr s)))
  ((pair? s) (cons (nodots (car s)) (nodots (cdr s))))
  (else s)
  )
)
; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
<<<<<<< HEAD
    (cond
      ((empty? s) false)
      ((> (car s) v) false)
      ((= (car s) v) true)
      ((< (car s) v) (contains (cdr s) v))
=======
    (cond ((empty? s) false)
    	((> (car s) v) false)
    	((= (car s) v) true)
    	((< (car s) v) (contains? (cdr s) v))  
>>>>>>> 06ca388ec10856ba4727a3c4029194df39675b50
    )
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ((contains? s v) s)
          ((> (car s) v) (cons v s))
          ((< (car s) v) (cons (car s) (add (cdr s) v)))
    )
)

(define (intersect s t)
    (cond ((empty? s) `())
          ((contains? t (car s)) (cons (car s) (intersect (cdr s) t)))
          (else nil)
    )
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (if (empty? s) t
        (if (empty? t) s
          (if (contains? s (car t))
            (union s (cdr t))
          	(union (add s (car t)) (cdr t))
    	  )
   		)
	)
)
; Q9 - Survey
(define (survey)
    ; Midsemester Survey: https://goo.gl/forms/a3NTVfZWFjWReu0x1
    `procedure
)