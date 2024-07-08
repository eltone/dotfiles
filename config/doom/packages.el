;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! exec-path-from-shell)
(package! flatbuffers-mode
  :recipe (:host github :repo "Asalle/flatbuffers-mode"))
(load! "local-packages.el" doom-private-dir t)
