;;; ~/.doom.d/binds.el -*- lexical-binding: t; -*-

;; Super key instead of Alt
(setq x-super-keysym 'meta)

;; Clipboard paste
(global-set-key (kbd "C-S-v") #'clipboard-yank)

;; Eshell
(evil-define-key 'normal 'global (kbd "SPC o t") 'eshell)
