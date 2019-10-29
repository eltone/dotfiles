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
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(when IS-MAC
  (add-hook 'window-setup-hook #'toggle-frame-maximized))
(after! evil
  (setq evil-escape-key-sequence "fd"))
(after! inf-ruby
  ;; switch to inf-ruby from compile if we detect a breakpoint has been hit
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))
(setq doom-font (font-spec :family "Fira Code" :size 12))
(define-key key-translation-map (kbd "M-3") (kbd "#"))
;; auto reload files when changed on disk
(global-auto-revert-mode t)
(after! org
  (setq org-startup-folded nil))
(after! forge
  (load! "local.el" doom-private-dir t))
