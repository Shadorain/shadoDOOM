;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Shadorain"
      user-mail-address "shadorain7517@gmail.com")

;; MELPA/ELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Set Theme & Font
(setq
 doom-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-theme 'shado
 projectile-project-search-path '("~/.xmonad/" "~/Documents/Programming/" "~/dwm/"))
 ;; doom-font (font-spec :family "Agave" :size 16)
 ;; doom-theme 'doom-challenger-deep
 ;; doom-theme 'doom-one
 ;; data-format-on-save t)
(set-face-foreground 'line-number "#a1a1dd") ; Line number colors
(set-face-foreground 'line-number-current-line "#de286e") ; Current line number color
(add-to-list 'default-frame-alist '(background-color . "#0f0f17")) ; Background color


;; ;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Here are some additional functions/macros that could help you configure Doom:
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;; (put 'customize-variable 'disabled nil)

;; Company
(require 'company)
(setq company-idle-delay 0.01
      company-minimum-prefix-length 2)

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

;; (add-to-list 'load-path "~/.emacs.d/lib/gpastel/")

;; Line Numbers
(require 'hlinum)
(hlinum-activate)
(setq display-line-numbers-type 'relative) ; Relative line numbers with current line shown

;; Super key instead of Alt
(setq x-super-keysym 'meta)

;; Ya-snippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.doom.d/snippets"))
  ;; (yas-load-directory "/usr/share/yasnippet-snippets"))

;; pdf-tools
(use-package pdf-tools
  :init (pdf-tools-install)
  :bind (:map pdf-view-mode-map
        ("T" . pdf-annot-add-text-annotation)
        ("D" . pdf-annot-delete)
        ("t" . pdf-annot-add-highlight-markup-annotation)
        ("j" . image-next-line)
        ("k" . image-previous-line)
        ("l" . image-forward-hscroll)
        ("h" . image-backward-hscroll)
        ("G" . pdf-view-last-page)
        ("g" . nil)
        ("gg" . pdf-view-first-page)
        ("C-c C-c" . image-toggle-display)
        ("C-s" . isearch-forward))
  :config
  (setq-default pdf-view-display-size 'fit-page)
  :custom
  (yas-minor-mode nil)
  (pdf-cache-image-limit 32)
  (pdf-view-max-image-width 2048)
  (pdf-view-resize-factor 1.8)
  (pdf-isearch-batch-mode t)
  (pdf-annot-activate-created-annotations t))

;; Org Super Agenda
;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-groups '((:name "Today"
;;                                    :time-grid t
;;                                    :scheduled today)
;;                                   (:name "Due today"
;;                                    :deadline today)
;;                                   (:name "Important"
;;                                    :priority "A")
;;                                   (:name "Overdue"
;;                                    :deadline past)
;;                                   (:name "Due soon"
;;                                    :deadline future)
;;                                   (:name "Big Outcomes"
;;                                    :tag "bo")))
;;   :config
;;   (org-super-agenda-mode))

;; Fix lag
(setq auto-window-vscroll nil)
(setq scroll-conservatively 101)
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; (setq inhibit-compacting-font-caches t)
;; (setq linum-relative-backend 'display-line-numbers-mode)
;; (pixel-scroll-mode)

;; Tab to Spaces
(setq-default indent-tabs-mode nil)

;; Evil Snipe
(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

;; ;; Escreen
;; (load "escreen")
;; (escreen-install)
;; (global-set-key escreen-prefix-char 'escreen-prefix)

;; Avy
(avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)

;; Annotate
;; (annotate-mode)

;; Rainbow-mode
;; (use-package! rainbow-mode)

;; Vimish Folds
;; (setq vimish-fold-global-mode 1)
(setq vimish-fold-find-marks-on-open t)
(turn-off-evil-vimish-fold-mode)
(vimish-fold-from-marks)

;; Org Mode
;;; Custom Links
;; (defun make-yt-link (youtube_id)
;;   (browse-url (concat "https://www.youtube.com/embed/" youtube_id)))
(add-hook 'org-mode-hook #'turn-off-smartparens-mode)
(sp-local-pair 'org-mode "*" nil)
(after! org
  (setq org-highlight-latex-and-related nil)
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
        ;; org-priority-faces '((?A :foreground "#de286e")
        ;;                      (?B :foreground "#0098dd")
        ;;                      (?C :foreground "#a1a1dd"))
        ; org-tags-column -80
    ))

;; Org Fancy Priorities
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("" "" "")))

;;; Org-Superstar
;; (require 'org-superstar)
;; (setq org-bullets-face-name (quote org-bullet-face))
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq
;;  org-superstar-headline-bullets-list '("⁖" "✲" "✱" "✻" "✼" "✥" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇")
;;  org-superstar-cycle-headline-bullets t
;;  org-superstar-item-bullet-alist t
;;  org-superstar-prettify-item-bullets t)

;; Loads
(load! "binds")
(load "~/.erc-auth")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vimish-fold rainbow-mode ivy-avy forge evil-snipe evil-multiedit evil-avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
