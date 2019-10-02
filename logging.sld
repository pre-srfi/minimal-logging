(define-library (logging)
  (export loggers log-write stderr-logger)
  (import (scheme base) (scheme write))
  (include "logging/logging.scm"))
