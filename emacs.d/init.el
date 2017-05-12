;; defaults
(setq
 delete-old-versions -1		; delete excess backup versions silently
 version-control t		; use version control
 vc-make-backup-files t		; make backups file even when in version controlled dir
 backup-directory-alist `(("." . "~/.emacs.d/backups")) ; which directory to put backups file
 vc-follow-symlinks t		; don't ask for confirmation when opening symlinked file
 auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ;transform backups file name
 inhibit-startup-screen t	; inhibit useless and old-school startup screen
 ring-bell-function 'ignore	; silent bell when you make a mistake
 sentence-end-double-space nil	; sentence SHOULD end with only a point.
 default-fill-column 80		; toggle wrapping text at the 80th character
 initial-scratch-message ""     ; print a default message in the empty scratch buffer opened at startup
 help-window-select t
 tab-width 4
 )
(blink-cursor-mode -1)

; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; disable GUI elements
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (if (display-graphic-p)
      (menu-bar-mode t)
      (menu-bar-mode -1)))

; Start scratch in text mode for faster loading
(setq initial-major-mode 'fundamental-mode)

; Setup fringes (spaces around windows)
(when (display-graphic-p)
    (fringe-mode 2)
    (setq-default left-fringe-width 12)
    (setq-default right-fringe-width 0))

  (setq-default truncate-lines t)
(setq line-spacing 3)

; Setup repos

(require 'package)

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package)

(use-package evil :ensure t
  :config
  (evil-mode))

(use-package general :ensure t
  :config
  (general-evil-setup t)
  (mmap "j" 'evil-next-visual-line
	"k" 'evil-previous-visual-line)
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(use-package diminish)

(use-package avy :ensure t
  :commands (avy-goto-word-1))

(setq custom-safe-themes t)
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(show-paren-mode 1)

(global-prettify-symbols-mode t)
