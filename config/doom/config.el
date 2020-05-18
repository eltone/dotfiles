;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (require 'exec-path-from-shell)
  (setq-default exec-path-from-shell-shell-name "/usr/local/bin/zsh")
  ;; (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-envs '("PATH" "RBENV_ROOT"))
  (exec-path-from-shell-initialize)
  (setq doom-variable-pitch-font (font-spec :family "Helvetica Neue")))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(when IS-MAC
  (add-hook 'window-setup-hook #'toggle-frame-maximized))
(after! evil
  (setq evil-escape-key-sequence "fd"))

(cond
 ((find-font (font-spec :name "Fira Code"))
  (setq doom-font (font-spec :name "Fira Code" :size 12)))
 ((find-font (font-spec :name "FiraMono Nerd Font"))
  (setq doom-font (font-spec :name "FiraMono Nerd Font" :size 12))))

(when IS-LINUX
  (font-put doom-font :weight 'semi-light))

(define-key key-translation-map (kbd "M-3") (kbd "#"))
;; auto reload files when changed on disk
(global-auto-revert-mode t)
(after! org
  (setq org-startup-folded nil))
(after! forge
  (load! "local.el" doom-private-dir t))
