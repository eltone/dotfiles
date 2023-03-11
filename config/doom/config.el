;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-theme 'doom-one)

(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (require 'exec-path-from-shell)
  (setq-default exec-path-from-shell-shell-name "zsh")
  (exec-path-from-shell-copy-envs '("PATH" "RBENV_ROOT"))
  (exec-path-from-shell-initialize)
  (setq doom-variable-pitch-font (font-spec :family "Helvetica Neue"))
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;(add-to-list 'default-frame-alist '(ns-appearance . dark))
(after! evil
  (setq evil-escape-key-sequence "fd"))

(cond
 ((find-font (font-spec :name "Fira Code"))
  (setq doom-font (font-spec :name "Fira Code" :size 12)))
 ((find-font (font-spec :name "FuraMono Nerd Font"))
  (setq doom-font (font-spec :name "FuraMono Nerd Font" :size 12)))
 ((find-font (font-spec :name "FiraCode Nerd Font" :size 12))
  (setq doom-font (font-spec :name "FiraCode Nerd Font" :size 12))))

(define-key key-translation-map (kbd "M-3") (kbd "#"))
;; auto reload files when changed on disk
(global-auto-revert-mode t)
(after! org
  (add-to-list 'org-modules 'org-habit)
  (setq org-startup-folded nil)
  (setq org-agenda-files '("~/org/work" "~/org/personal"))
  (setq org-agenda-prefix-format
   '((agenda . " %i %-30:c%?-12t% s")
     (todo . " %i %-12:c")
     (tags . " %i %-12:c")
     (search . " %i %-12:c")))
  (setq org-agenda-custom-commands
        '(("v" "Work agenda view"
           ((agenda "")
            (tags "ticket"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "Tickets to write:")))))))
  (setq org-capture-templates
    '(("w" "Work Todo" entry (file+headline "~/org/work/work.org" "Inbox")
     "* TODO %?\n  %i\n")))
  (setq org-log-into-drawer "LOGBOOK")
  (setq org-journal-file-type 'weekly)
  (set-company-backend! 'org-mode nil))

(after! org-tree-slide
  (setq org-tree-slide-slide-in-effect nil)
  (advice-remove 'org-tree-slide--display-tree-with-narrow
                 #'+org-present--hide-first-heading-maybe-a))

(after! terraform
  (setq terraform-format-on-save-mode t))

(after! spell
  (setq ispell-dictionary "en_GB-ise"))

(after! spell-fu
  (add-to-list 'spell-fu-ignore-modes 'yaml-mode))

(after! lsp-mode
  (setq lsp-lens-enable t
        lsp-lens-place-position 'above-line
        lsp-diagnostic-clean-after-change t))

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-position 'top
        lsp-ui-sideline-show-code-actions nil))

(defun private/buffer-namespace ()
  (subst-char-in-string ?/ ?.
                        (file-relative-name
                         (directory-file-name
                          (file-name-directory buffer-file-name))
                         (projectile-project-root))))

(load! "local.el" doom-user-dir t)
