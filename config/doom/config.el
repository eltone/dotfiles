;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(after! evil
  (setq evil-escape-key-sequence "fd"))
;; (add-hook! 'rspec-compilation-mode-hook 'inf-ruby-enable-auto-breakpoint)
(after! rspec-mode
  (setq rspec-use-rvm nil)
  'inf-ruby-enable-auto-breakpoint)
