#-quicklisp
(let ((ql-init (merge-pathnames
                "setup.lisp"
                (concatenate 'string
                             (sb-ext:posix-getenv "NIX_QUICKLISP_DIR")
                             "/"))))
  (when (probe-file ql-init)
    (load ql-init)))

(setf sb-impl::*default-external-format* :utf-8)
