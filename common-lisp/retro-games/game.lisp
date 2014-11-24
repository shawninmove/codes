;;#!/usr/local/bin/sbcl --script

(load "/home/inmove/quicklisp/setup.lisp")
(ql:quickload :parenscript)
(ql:quickload :hunchentoot)
(ql:quickload :cl-who)

(Defpackage :retro-games
  (:use :cl :cl-who :hunchentoot :parenscript))

(in-package :retro-games)

(defclass game ()
  ((name :initarg :name
	 :reader name)
   (votes :initform 0
	  :accessor votes)))
(defvar *games* '())

(defun game-from-name (name) ;;find a game from database
  (find name *games* :test #'string-equal :key #'name))

(defun game-stored? (game-name) ;;ensure the game is stored
  (game-from-name game-name))

(defmethod vote-for (user-selected-game)
  (incf (votes user-selected-game)))

(defun games ()
  (sort (copy-list *games*) #'> :key #'votes))

(defun add-game (name)
  (unless (game-stored? name)
    (push (make-instance 'game :name name) *games*)))

(defmethod print-object ((object game) stream)
  (print-unreadable-object (object stream :type t)
    (with-slots (name votes) object
      (format stream "name: ~s with ~d votes" name votes))))

(defmacro standard-page ((&key title) &body body)
  `(with-html-output-to-string
       (*standard-output* nil :prologue t :indent t)
     (:html :lang "en"
	    (:head
	     (:meta :charset "utf-8")
	     (:title ,title))
	    (:body
	     (:div :id "header")
	     ,@body))))

(defparameter server-one (make-instance 'easy-acceptor :port 8080))
(start server-one)
;;(format t (standard-page (:title "Retro games") (:h1 "Top Retro Game") (:p "We'll write thecode later...")))
;;(add-game "game-one")
;;(vote-for (game-from-name "game-one"))

;;(format t "~A" (game-from-name "game-one"))

