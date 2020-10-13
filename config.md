
# Table of Contents

1.  [DOOM Config.el](#orge2e4e19)
    1.  [Initialization Settings](#org87bb2f3)
        1.  [Lexical binding](#org8eef6ec)
        2.  [Emacs Package Installers](#org2d3cb0d)
        3.  [Optimizations](#org983c0f2)
        4.  [Tabs to Spaces](#orge2dd8f2)
        5.  [Username + Email](#org6287d22)
    2.  [Theming](#org92a041f)
        1.  [Theme & Font](#orgd9e5fb0)
        2.  [Extra Colors](#org04b28f4)
    3.  [Package config](#org4255d1e)
        1.  [Annotate](#org3ab7f6b)
        2.  [Avy](#org3fdb59c)
        3.  [Company](#orgdd4093c)
        4.  [ERC](#org00d654d)
        5.  [Escreen](#org3403148)
        6.  [Evil Snipe](#orgf361fa2)
        7.  [Flycheck/spell](#org4aff809)
        8.  [Gpastel](#org706990b)
        9.  [Hlinum](#org5df05dd)
        10. [Outline](#orgba5801b)
        11. [Mu4e](#orgebdcaf6)
        12. [Pdf-tools](#org4448dd5)
        13. [Rainbow-mode](#org8ce0c50)
        14. [Yasnippet-snippets](#orgb41cd28)
        15. [Vimish Folds](#orge4fca39)
        16. [Whitespace Mode](#orgbe36334)
    4.  [Latex](#orgab5bd64)
        1.  [Auto-Compile + Refresh (latex)](#org41f1768)
        2.  [Auto-Compile + Refresh (from org -> latex)](#org5dbf2b6)
    5.  [Org-Mode](#orge5b973d)
        1.  [General org-mode](#orgc532513)
        2.  [Org -> Markdown](#orgd634b21)
        3.  [org-startup-folded](#org4310a9d)
        4.  [Custom Links](#org7ce3673)
        5.  [Org Agenda](#orgef40aa6)
        6.  [Org Fancy Priorities](#orgb544456)
        7.  [Org Super Agenda \*](#orga6ba5fa)
        8.  [Org-Superstar](#orgbf4ebac)
    6.  [Loads](#orgea433ad)
    7.  [Custom Set Variables](#org318d75e)



<a id="orge2e4e19"></a>

# DOOM Config.el


<a id="org87bb2f3"></a>

## Initialization Settings


<a id="org8eef6ec"></a>

### Lexical binding

    ;;; config.el --- -*- lexical-binding: t -*-


<a id="org2d3cb0d"></a>

### Emacs Package Installers

1.  MELPA/ELPA

        (require 'package)
        (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

2.  GNU

        (add-to-list 'package-archives
                 '("gnu" . "http://elpa.gnu.org/packages/"))
        (package-initialize)
        (unless (package-installed-p 'use-package)
          (package-refresh-contents)
          (package-install 'use-package))
        (setq package-check-signature nil)
        (eval-when-compile
          (require 'use-package))


<a id="org983c0f2"></a>

### Optimizations

    (setq auto-window-vscroll nil)
    (setq scroll-conservatively 101)
    ;; (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq inhibit-compacting-font-caches t)
(setq linum-relative-backend &rsquo;display-line-numbers-mode)
(pixel-scroll-mode)


<a id="orge2dd8f2"></a>

### Tabs to Spaces

    (setq-default indent-tabs-mode nil)


<a id="org6287d22"></a>

### Username + Email

    (setq user-full-name "Shadorain"
          user-mail-address "shadorain7517@gmail.com")


<a id="org92a041f"></a>

## Theming


<a id="orgd9e5fb0"></a>

### Theme & Font

    (setq
     doom-font (font-spec :family "Mononoki Nerd Font" :size 16)
     doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 16)
     doom-theme 'shado
     projectile-project-search-path '("~/.xmonad/" "~/Documents/Programming/" "~/dwm/"))

doom-font (font-spec :family &ldquo;Agave&rdquo; :size 16)
doom-theme &rsquo;doom-challenger-deep
doom-theme &rsquo;doom-one
data-format-on-save t)


<a id="org04b28f4"></a>

### Extra Colors

    (set-face-foreground 'line-number "#a1a1dd") ; Line number colors
    (set-face-foreground 'line-number-current-line "#de286e") ; Current line number color
    (add-to-list 'default-frame-alist '(background-color . "#0f0f17")) ; Background color


<a id="org4255d1e"></a>

## Package config

1.  Help Message

    Here are some additional functions/macros that could help you configure Doom: - \`load!&rsquo; for loading external \*.el files relative to this one - \`use-package!&rsquo; for configuring packages - \`after!&rsquo; for running code after a package has loaded - \`add-load-path!&rsquo; for adding directories to the \`load-path&rsquo;, relative to this file. Emacs searches the \`load-path&rsquo; when you load packages with \`require&rsquo; or \`use-package&rsquo;. - \`map!&rsquo; for binding new keys


<a id="org3ab7f6b"></a>

### Annotate

    ;; (annotate-mode)


<a id="org3fdb59c"></a>

### Avy

    ;; (avy-setup-default)
    (global-set-key (kbd "C-c C-j") 'avy-resume)


<a id="orgdd4093c"></a>

### Company

    (require 'company)
    (setq company-idle-delay 0.01
          company-minimum-prefix-length 2)


<a id="org00d654d"></a>

### ERC

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


<a id="org3403148"></a>

### Escreen

    (load "escreen")
    (escreen-install)
    (global-set-key escreen-prefix-char 'escreen-prefix)


<a id="orgf361fa2"></a>

### Evil Snipe

    (require 'evil-snipe)
    (evil-snipe-mode +1)
    (evil-snipe-override-mode +1)
    (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)


<a id="org4aff809"></a>

### Flycheck/spell

Be off by default

    (flyspell-mode 0)


<a id="org706990b"></a>

### Gpastel

    (add-to-list 'load-path "~/.emacs.d/lib/gpastel/")


<a id="org5df05dd"></a>

### Hlinum

    (require 'hlinum)
    (hlinum-activate)
    (setq display-line-numbers-type 'relative) ; Relative line numbers with current line shown


<a id="orgba5801b"></a>

### Outline

    (use-package outline
      :diminish outline-minor-mode
      :config
      (use-package outline-minor-faces
        :ensure
        :hook
        (outline-minor-mode-hook . outline-minor-faces-add-font-lock-keywords)))
    (global-set-key (kbd "C-`") 'outline-show-entry)
    (global-set-key (kbd "C-~") 'outline-hide-entry)


<a id="orgebdcaf6"></a>

### Mu4e

    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (require 'mu4e)


<a id="org4448dd5"></a>

### Pdf-tools

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

Colors

    (add-hook 'pdf-view-mode-hook (lambda ()
                                  (pdf-view-midnight-minor-mode))) ; automatically turns on midnight-mode for pdfs
    (setq pdf-view-midnight-colors '("#BFAEE3" . "#0a0a12" )) ; #0a0a12 #6f88e8 #e1acff Set custom colors
    
    (defun bms/pdf-no-filter ()
      "View pdf without colour filter."
      (interactive)
      (pdf-view-midnight-minor-mode -1))


<a id="org8ce0c50"></a>

### Rainbow-mode

    ; (use-package! rainbow-mode)


<a id="orgb41cd28"></a>

### Yasnippet-snippets

    (use-package yasnippet
      :config
      (yas-global-mode 1)
      (yas-load-directory "~/.doom.d/snippets/")
      (setq yasnippet-snippets-dir "~/.doom.d/snippets/"))

(yas-load-directory &ldquo;/usr/share/yasnippet-snippets&rdquo;))


<a id="orge4fca39"></a>

### Vimish Folds

    (setq vimish-fold-find-marks-on-open t)
    (turn-off-evil-vimish-fold-mode)
    (vimish-fold-from-marks)

(setq vimish-fold-global-mode 1)


<a id="orgbe36334"></a>

### Whitespace Mode

    (global-whitespace-mode 1)
    (progn
      (setq whitespace-style (quote (face spaces tabs space-mark tab-mark )))
      (setq whitespace-display-mappings
            '((space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」; 4347
              (tab-mark 9 [9655 9] [92 9])))) ; tabs
    (add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
    (add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
    (add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
    (add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
    (add-hook 'nasm-mode-hook 'rc/set-up-whitespace-handling)
    (add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)


<a id="orgab5bd64"></a>

## Latex


<a id="org41f1768"></a>

### Auto-Compile + Refresh (latex)

Set up vars/funcs

    (setq
     split-width-threshold 0
     split-height-threshold nil)
    (global-auto-revert-mode t)

These custom functions first time running will open the pdf in a split, concurring saves will update the pdf!

    (setq TeX-command-force "LaTex")
    (defun latex-export-pdf-then-refresh()
      (TeX-command-master))
    (defun latex-auto-export-on()
      (interactive)
        (add-hook 'after-save-hook 'latex-export-pdf-then-refresh t t)
        (TeX-command-run-all TeX-command-buffer)
        (windmove-left))


<a id="org5dbf2b6"></a>

### Auto-Compile + Refresh (from org -> latex)

These custom functions first time running will open the pdf in a split, concurring saves will update the pdf!

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


<a id="orge5b973d"></a>

## Org-Mode


<a id="orgc532513"></a>

### General org-mode

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


<a id="orgd634b21"></a>

### Org -> Markdown

    (defun md-auto-export-on()
      (interactive)
        (add-hook 'after-save-hook 'org-md-export-to-markdown)
        )
    (eval-after-load 'org-mode
      '(local-set-key (kbd "C-m") #'md-auto-export-on))


<a id="org4310a9d"></a>

### org-startup-folded

    (setq org-startup-folded t)


<a id="org7ce3673"></a>

### Custom Links

    ; (defun make-yt-link (youtube_id)
    ;   (browse-url (concat "https://www.youtube.com/embed/" youtube_id)))


<a id="orgef40aa6"></a>

### Org Agenda

1.  Custom Files


<a id="orgb544456"></a>

### Org Fancy Priorities

    (use-package! org-fancy-priorities
      :hook (org-mode . org-fancy-priorities-mode)
      :config
      (setq org-fancy-priorities-list '("" "" "")))


<a id="orga6ba5fa"></a>

### Org Super Agenda \*

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


<a id="orgbf4ebac"></a>

### Org-Superstar

    ;; (require 'org-superstar)
    ;; (setq org-bullets-face-name (quote org-bullet-face))
    ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    ;; (setq
    ;;  org-superstar-headline-bullets-list '("⁖" "✲" "✱" "✻" "✼" "✥" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇")
    ;;  org-superstar-cycle-headline-bullets t
    ;;  org-superstar-item-bullet-alist t
    ;;  org-superstar-prettify-item-bullets t)


<a id="orgea433ad"></a>

## Loads

Loads my custom keybinds file

    (load! "binds")

This file allows for ERC to start with all fields filled in

    (load "~/.erc-auth")

Loads my updateable org-agenda-files function

    ;; (load! "agenda-files")


<a id="org318d75e"></a>

## Custom Set Variables

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

