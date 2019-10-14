(defsystem #:unoidl
  :pathname "src"
  :components ((:file "packages")
               (:file "unoidl"))
  :depends-on (#:nibbles))
