;;; config.el --- -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
         '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq package-check-signature nil)
(eval-when-compile
  (require 'use-package))

(setq auto-window-vscroll nil)
(setq scroll-conservatively 101)
;; (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq-default indent-tabs-mode nil)

(setq user-full-name "Shadorain"
      user-mail-address "shadorain7517@gmail.com")

(setq
 doom-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 16)
 doom-theme 'shado
 projectile-project-search-path '("~/.xmonad/" "~/Documents/Programming/" "~/dwm/"))

(set-face-foreground 'line-number "#a1a1dd") ; Line number colors
(set-face-foreground 'line-number-current-line "#de286e") ; Current line number color
(add-to-list 'default-frame-alist '(background-color . "#0f0f17")) ; Background color

;; (annotate-mode)

;; (avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)

(require 'company)
(setq company-idle-delay 0.01
      company-minimum-prefix-length 2)

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

(load "escreen")
(escreen-install)
(global-set-key escreen-prefix-char 'escreen-prefix)

(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

(flyspell-mode 0)

(add-to-list 'load-path "~/.emacs.d/lib/gpastel/")

(require 'hlinum)
(hlinum-activate)
(setq display-line-numbers-type 'relative) ; Relative line numbers with current line shown

(use-package outline
  :diminish outline-minor-mode
  :config
  (use-package outline-minor-faces
    :ensure
    :hook
    (outline-minor-mode-hook . outline-minor-faces-add-font-lock-keywords)))
(global-set-key (kbd "C-`") 'outline-show-entry)
(global-set-key (kbd "C-~") 'outline-hide-entry)

;; (require 'ox-latex)
;; (require 'pdf-tools)
;; ;; (setq Tex-auto-save t)
;; ;; (setq Tex-parse-self t)
;; ;; (setq-default Tex-master nil)
;; ;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; ;; (setq reftex-plug-into-AUCTeX t)
;; ;; (setq TeX-PDF-mode t)
;; ;; (pdf-tools-install)
;; (with-eval-after-load 'pdf-tools
;;     (require 'pdf-sync))
;; (use-package pdf-tools
;;   :init (pdf-tools-install)
;;   :bind (:map pdf-view-mode-map
;;         ("T" . pdf-annot-add-text-annotation)
;;         ("D" . pdf-annot-delete)
;;         ("t" . pdf-annot-add-highlight-markup-annotation)
;;         ("j" . image-next-line)
;;         ("k" . image-previous-line)
;;         ("l" . image-forward-hscroll)
;;         ("h" . image-backward-hscroll)
;;         ("G" . pdf-view-last-page)
;;         ("g" . nil)
;;         ("gg" . pdf-view-first-page)
;;         ("C-c C-c" . image-toggle-display)
;;         ("C-s" . isearch-forward))
;;   :config
;;   (setq-default pdf-view-display-size 'fit-page)
;;   :custom
;;   (yas-minor-mode nil)
;;   (pdf-cache-image-limit 32)
;;   (pdf-view-max-image-width 2048)
;;   (pdf-view-resize-factor 1.8)
;;   (pdf-isearch-batch-mode t)
;;   (pdf-annot-activate-created-annotations t))
;; (setq pdf-sync-backward-display-action t)
;; (setq pdf-sync-forward-display-action t)

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward)
  ;; (add-hook 'pdf-view-mode-hook (lambda ()
  ;;                 (bms/pdf-midnite-amber))) ; automatically turns on midnight-mode for pdfs
  )

;; (use-package auctex-latexmk
;;   :ensure t
;;   :config
;;   (auctex-latexmk-setup)
;;   (setq auctex-latexmk-inherit-TeX-PDF-mode t))

;; (use-package reftex
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq reftex-cite-prompt-optional-args t)) ;; Prompt for empty optional arguments in cite

;; (use-package auto-dictionary
;;   :ensure t
;;   :init(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))

(use-package company-auctex
  :ensure t
  :init (company-auctex-init))

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config (progn
        (vimish-fold-from-marks)
        (setq TeX-source-correlate-mode t)
        (setq TeX-source-correlate-method 'synctex)
        (setq TeX-auto-save t)
        (setq TeX-parse-self t)
        (pdf-tools-install)
        (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
          TeX-source-correlate-start-server t)
        ;; Update PDF buffers after successful LaTeX runs
        (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)
        ))

(add-hook 'pdf-view-mode-hook (lambda ()
                              (pdf-view-midnight-minor-mode))) ; automatically turns on midnight-mode for pdfs
(setq pdf-view-midnight-colors '("#BFAEE3" . "#0a0a12" )) ; #0a0a12 #6f88e8 #e1acff Set custom colors

(defun bms/pdf-no-filter ()
  "View pdf without colour filter."
  (interactive)
  (pdf-view-midnight-minor-mode -1))

; (use-package! rainbow-mode)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.doom.d/snippets/")
  (setq yasnippet-snippets-dir "~/.doom.d/snippets/"))

(setq vimish-fold-find-marks-on-open t)
(turn-off-evil-vimish-fold-mode)
(vimish-fold-from-marks)

(setq
 split-width-threshold 0
 split-height-threshold nil)
(global-auto-revert-mode t)

(setq TeX-command-force "LaTex")
(defun latex-export-pdf-then-refresh()
  (TeX-command-master))
(defun latex-auto-export-on()
  (interactive)
    (add-hook 'after-save-hook 'latex-export-pdf-then-refresh t t)
    (TeX-command-run-all TeX-command-buffer)
    (windmove-left))

(defun org-export-pdf-then-refresh()
  (org-latex-export-to-pdf))
(defun org-auto-export-on()
  (interactive)
  (cond
    ((string-match "LATEX_CMD: latex" (buffer-string))
     (add-hook 'after-save-hook 'org-export-pdf-then-refresh t t)
     (split-window-right)
     (windmove-right)
     (org-open-file (org-latex-export-to-pdf))
     (windmove-left))))

(after! org
  (setq org-highlight-latex-and-related nil)
  (setq org-hide-emphasis-markers t) ; Hides ugly markup symbols
  (setq org-agenda-skip-scheduled-if-done t
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
(setq org-directory "~/org/")

(setq org-startup-folded t)

; (defun make-yt-link (youtube_id)
;   (browse-url (concat "https://www.youtube.com/embed/" youtube_id)))

(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("" "" "")))

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

;; (require 'org-superstar)
;; (setq org-bullets-face-name (quote org-bullet-face))
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq
;;  org-superstar-headline-bullets-list '("⁖" "✲" "✱" "✻" "✼" "✥" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇")
;;  org-superstar-cycle-headline-bullets t
;;  org-superstar-item-bullet-alist t
;;  org-superstar-prettify-item-bullets t)

(load! "binds")

(load "~/.erc-auth")

;; (load! "agenda-files")

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

;; (org-babel-load-file (expand-file-name "~/.doom.d/config.org"))
