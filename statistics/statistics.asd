;; -*- mode: lisp; syntax: common-lisp -*-

(in-package :cl-user)

(defpackage :statistics-asd
  (:use :cl :asdf))

(in-package :statistics-asd)

(defsystem :statistics.rand
  :author "Yotsutsuji Tetsuaki"
  :licence "?"
  :description "Random Number Generator Library"
  
  :components 
  ((:module :statistics.rand
            :pathname #p "rand"
            :components 
            ((:file "rand/package" )
             (:file "rand/utilities" :depends-on ("rand/package"))
             (:file "rand/rand" :depends-on ("rand/utilities"))) 
            )
   
   (:static-file "README")
   ))

(defsystem :statistics
  :author "Peter Salvi / MSI (statistics), Ryo Fujii (statistics & distribution), Yotsutsuji Tetsuaki (rand)"
  :licence "?"
  :description "Statistics Library"
  :depends-on (:statistics.rand)
  :components 
  ((:module "statistics" 
            :pathname #p""
            
            :components
            ((:file "package")
             (:file "utilities" )
             (:file "math"  :depends-on ("utilities"))
             (:file "statistics" :depends-on ("math"))
             (:file "histogram" :depends-on ("distribution"))
             
             (:file "distribution" :depends-on ("utilities" "math"))
             (:file "distribution-test" :depends-on ("distribution")))
            )
   
   
   (:static-file "README.md")
   (:static-file "README.jp")
   (:static-file "TODO")
   (:static-file "BUGS")
   ))

