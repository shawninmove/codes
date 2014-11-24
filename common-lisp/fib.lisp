#!/usr/bin/sbcl --script

(let ((a 0) (b 1))
  (defun fib-next ()
	(setf b (+ a b) a (- b a))
	b)
  (defun fib-reset ()
	(setf a 0 b 1)
	0))
