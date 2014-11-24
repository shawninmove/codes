(defmacro standard-page ((&key title) &body body)
  `(cl-who:with-html-output-to-string
       (*standard-output* nil :prologue t :indent t)
     (:html :lang "en"
	    (:head
	     (:meta :charset "utf-8")
	     (:title ,title))
	    (:body
	     (:div :id "header")
	     ,@body))))

(hunchentoot:define-easy-handler (hello :uri "/hello") ()
  (standard-page
      (:title "hello")
    (:h1 "this is hello")
    (:p "hello"))
  (hunchentoot:redirect "/test.html"))

(hunchentoot:define-easy-handler (login :uri "/login") ()
  (standard-page (:title "login")
    (:h1 "login page")
    (:form :action "/logined" :method "post" :id "loginform"
	   (:p "name" (:br)
	       (:input :type "text" :name "name"))
	   (:p "password" (:br)
	       (:input :type "password" :name "password"))
	   (:p (:input :type "submit" :value "login")))))

(hunchentoot:define-easy-handler (logined :uri "/logined") (name)
  (setf (hunchentoot:content-type*) "text/plain")
  (hunchentoot:redirect "/test.html"))
