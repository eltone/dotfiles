;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(when IS-LINUX
  (font-put doom-font :weight 'semi-light))
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (require 'exec-path-from-shell)
  (setq-default exec-path-from-shell-shell-name "/usr/local/bin/zsh")
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-initialize))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(when IS-MAC
  (add-hook 'window-setup-hook #'toggle-frame-maximized))
(after! evil
  (setq evil-escape-key-sequence "fd"))
;; (add-hook! 'rspec-compilation-mode-hook 'inf-ruby-enable-auto-breakpoint)
(after! rspec-mode
  (setq rspec-use-rvm nil)
  'inf-ruby-enable-auto-breakpoint)
(setq doom-font (font-spec :family "Fira Code" :size 12))
(define-key key-translation-map (kbd "M-3") (kbd "#"))