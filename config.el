;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

; Sets opacity 
; (set-frame-parameter (selected-frame) 'alpha '(85 85))
; (add-to-list 'default-frame-alist '(alpha 85 85))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq
 doom-font (font-spec :family "Agave" :size 18)
 doom-theme 'shado
 ;; doom-theme 'doom-one
 projectile-project-search-path '("~/.xmonad/" "~/Documents/Programming/" "~/dwm/")
 data-format-on-save t)

(add-to-list 'default-frame-alist '(background-color . "#0f0f17"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(require 'hlinum)
(hlinum-activate)
(set-face-foreground 'line-number "#a1a1dd")
(set-face-foreground 'line-number-current-line "#de286e")


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(put 'customize-variable 'disabled nil)

(global-set-key (kbd "C-S-v") #'clipboard-yank)

(after! erc :server "irc.freenode.net" :port 6667 :nick erc-nick :password erc-password)
(after! erc erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#org-mode" "#haskell" "#xmonad")))
(after! erc erc-prompt-for-nickserv-password nil)
(after! erc erc-services-mode 1)
; (after! erc add-to-list 'erc-modules 'notifications)
;; (after! erc erc-update-modules)
