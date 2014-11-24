#!/usr/local/bin/sbcl --noinform
	
(load "/home/inmove/quicklisp/setup.lisp")
(ql:quickload :parenscript)
(ql:quickload :hunchentoot)
(ql:quickload :cl-who)
(defpackage :retro-games
  (:use :cl :cl-who :hunchentoot :parenscript))
(in-package :retro-games)
(defparameter server-one (make-instance 'easy-acceptor :port 8080))
(start server-one)


