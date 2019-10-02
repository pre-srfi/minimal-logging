(define loggers (make-parameter '()))

(define (log-write message . plist)
  (for-each (lambda (logger) (apply logger message plist))
            (loggers)))

(define (stderr-logger message . plist)
  (display message (current-error-port))
  (newline (current-error-port)))
