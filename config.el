;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

                                        ; Sets opacity
                                        ; (set-frame-parameter (selected-frame) 'alpha '(85 85))
                                        ; (add-to-list 'default-frame-alist '(alpha 85 85))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shadorain"
      user-mail-address "shadorain7517@gmail.com")

;; MELPA/ELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
 doom-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-theme 'shado
 ;; doom-theme 'doom-challenger-deep
 ;; doom-font (font-spec :family "Agave" :size 16)
 ;; doom-theme 'shado
 ;;  ;; doom-theme 'doom-one
 projectile-project-search-path '("~/.xmonad/" "~/Documents/Programming/" "~/dwm/")
 data-format-on-save t)

(add-to-list 'default-frame-alist '(background-color . "#0f0f17"))

;; ;; If you use `org' and don't want your org files in the default location below,
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

;; Clipboard paste
(global-set-key (kbd "C-S-v") #'clipboard-yank)

;; Company
(require 'company)
(setq company-idle-delay 0.01
      company-minimum-prefix-length 1)

;; ERC
(defun start-erc ()
  "Log into freenode with less keystrokes"
  (interactive)
  (let
      ((password-cache nil))
    (erc
     :server "irc.freenode.net"
     :port "6667"
     :nick erc-nick
     :password erc-password)))

(add-to-list 'load-path "~/.emacs.d/lib/gpastel/")

;; Super key instead of Alt
(setq x-super-keysym 'meta)

;; Org Super Agenda
(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                   :time-grid t
                                   :scheduled today)
                                  (:name "Due today"
                                   :deadline today)
                                  (:name "Important"
                                   :priority "A")
                                  (:name "Overdue"
                                   :deadline past)
                                  (:name "Due soon"
                                   :deadline future)
                                  (:name "Big Outcomes"
                                   :tag "bo")))
  :config
  (org-super-agenda-mode))

;; Fix lag
(setq auto-window-vscroll nil)

;; Tab to Spaces
(setq-default indent-tabs-mode nil)

;; Evil Snipe
(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

;; Escreen
(load "escreen")
(escreen-install)
;; (setq escreen-prefix-char "\C-\\")
(global-set-key escreen-prefix-char 'escreen-prefix)

;; Eshell
(global-set-key (kbd "C-S-v") #'clipboard-yank)

;; Avy
(avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)

;; Annotate
(annotate-mode)

;; Rainbow-mode
(use-package! rainbow-mode)

;; Vimish Folds
(setq vimish-fold-find-marks-on-open t)
(setq vimish-fold-global-mode 1)
(turn-off-evil-vimish-fold-mode)
(vimish-fold-from-marks)

;; Org Fancy Priorities
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("" "" "")))

;; Org Mode
;;; Custom Links
(defun make-yt-link (youtube_id)
  (browse-url (concat "https://www.youtube.com/embed/" youtube_id)))

(after! org
  (setq org-hide-emphasis-markers t) ; Hides ugly markup symbols
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-files (list "~/org/Tech/Emacs/")
        org-ellipsis " ... "
        org-fontify-emphasized-text t
        ;; org-ellipsis "➞"
        ; org-add-link-type "yt" #'make-yt-link
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#943d84" :weight bold :underline t)
          ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
          ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
          ("DONE" :strike-through t :foreground "#2F2F4A" :background nil :weight light :underline t)
          ("CANCELLED" :strike-through t :foreground "#de286e" :background nil :weight light :underline t))
        org-priority-faces '((?A :foreground "#de286e")
                             (?B :foreground "#0098dd")
                             (?C :foreground "#a1a1dd"))
        ; org-tags-column -80
    ))

(load! "binds")

;;; Org-Superstar
;; (require 'org-superstar)
;; (setq org-bullets-face-name (quote org-bullet-face))
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq
;;  org-superstar-headline-bullets-list '("⁖" "✲" "✱" "✻" "✼" "✥" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇")
;;  org-superstar-cycle-headline-bullets t
;;  org-superstar-item-bullet-alist t
;;  org-superstar-prettify-item-bullets t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vimish-fold rainbow-mode org-bullets ivy-avy forge evil-snipe evil-multiedit evil-avy company-irony-c-headers company-irony avy-flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
