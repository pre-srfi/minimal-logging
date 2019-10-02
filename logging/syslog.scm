(define (syslog-logger ident facility)
  (%openlog ident (symbol->string facility))
  (lambda (message . plist)
    (let ((level 'info))
      (let ((prop (member 'level plist)))
        (when (and prop (pair? (cdr prop)) (symbol? (cadr prop)))
          (set! level (cadr prop))))
      (%syslog (symbol->string level) message))))