(in-package #:unoidl)

(defun parse-entry (stream)
  )
(defun parse-root-map (stream offset count)
  (file-position stream offset)
  (loop :repeat count
        :collect (parse-entry stream)))

(defun parse (stream)
  (let ((magic (make-array 7 :element-type '(unsigned-byte 8))))
    (read-sequence magic stream :start 0 :end 7)
    (list :magic magic
          :version (read-byte stream)
          :root-map (parse-root-map stream
                                    (nibbles:read-ub32/le stream)
                                    (nibbles:read-ub32/le stream)))))


(with-open-file (stream "c:/Program Files/LibreOffice/Program/types.rdb" :direction :input :element-type '(unsigned-byte 8))
  (parse stream))
