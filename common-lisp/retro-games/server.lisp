;;#!/usr/local/bin/sbcl --script

(load "/home/inmove/quicklisp/setup.lisp")
(ql:quickload :parenscript)
(ql:quickload :hunchentoot)
(ql:quickload :cl-who)
(load "/home/inmove/code/codes/common-lisp/retro-games/standard-page.lisp")
(defvar port 8080)
(defvar server (make-instance 'hunchentoot:easy-acceptor :port port))
(defun test ()
  (standard-page (:title "Test Page")
		 (:h1 "This is a test")
		 (:p "Hey how are you")))
(push (hunchentoot:create-prefix-dispatcher "/test.html"
				'test)
      hunchentoot:*dispatch-table*)

(hunchentoot:start server)
