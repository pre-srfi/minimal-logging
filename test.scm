(import (scheme base)
        (logging)
        (logging syslog))

(parameterize ((loggers (append (list (syslog-logger "test" 'daemon)
                                      stderr-logger)
                                (loggers))))
  (log-write "Hello world" 'level 'notice))
