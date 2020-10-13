;;; ~/.doom.d/binds.el -*- lexical-binding: t; -*-

;; Super key instead of Alt
(setq x-super-keysym 'meta)

;; Clipboard paste
(global-set-key (kbd "C-S-v") #'clipboard-yank)

;; Eshell
(evil-define-key 'normal 'global (kbd "SPC o t") 'eshell)

;; Pdf Autosave/Compile
(evil-define-key 'normal 'global (kbd "SPC o p") 'org-auto-export-on)
(evil-define-key 'normal 'global (kbd "SPC o l") 'latex-auto-export-on)

;; Pdf Annotations
(evil-define-key 'visual 'global (kbd "SPC a h") 'pdf-annot-add-highlight-markup-annotation)
(evil-define-key 'visual 'global (kbd "SPC a u") 'pdf-annot-add-underline-markup-annotation)
(evil-define-key 'visual 'global (kbd "SPC a s") 'pdf-annot-add-strikeout-markup-annotation)
(evil-define-key 'visual 'global (kbd "SPC a q") 'pdf-annot-add-squigly-markup-annotation)

;; School Notes
(evil-define-key 'normal 'global (kbd "SPC o n") (lambda () (interactive) (find-file "~/org/School/NotesFALL2020.org")))

;; Workspaces
(global-set-key (kbd "M-C-1") 'eyebrowse-switch-to-window-config-1)
(global-set-key (kbd "M-C-2") 'eyebrowse-switch-to-window-config-2)
(global-set-key (kbd "M-C-3") 'eyebrowse-switch-to-window-config-3)
(global-set-key (kbd "M-C-4") 'eyebrowse-switch-to-window-config-4)
(global-set-key (kbd "M-C-5") 'eyebrowse-switch-to-window-config-5)
(global-set-key (kbd "M-C-6") 'eyebrowse-switch-to-window-config-6)
(global-set-key (kbd "M-C-7") 'eyebrowse-switch-to-window-config-7)
(global-set-key (kbd "M-C-8") 'eyebrowse-switch-to-window-config-8)
(global-set-key (kbd "M-C-9") 'eyebrowse-switch-to-window-config-9)

;; Artist mode
(evil-define-key 'normal 'global (kbd "SPC a S") 'artist-ido-select-settings)
(evil-define-key 'normal 'global (kbd "SPC a o") 'artist-ido-select-operation)
;;; Artist Tools
(evil-define-key 'normal 'global (kbd "SPC a l") 'artist-select-op-straight-line)
(evil-define-key 'normal 'global (kbd "SPC a r") 'artist-select-op-rectangle)
(evil-define-key 'normal 'global (kbd "SPC a s") 'artist-select-op-square)
(evil-define-key 'normal 'global (kbd "SPC a p") 'artist-select-op-straight-poly-line)
(evil-define-key 'normal 'global (kbd "SPC a e") 'artist-select-op-ellipse)
(evil-define-key 'normal 'global (kbd "SPC a t") 'artist-select-op-text-see-thru)
(evil-define-key 'normal 'global (kbd "SPC a c") 'artist-select-op-spray-can)
(evil-define-key 'normal 'global (kbd "SPC a E") 'artist-select-op-erase-rectangle)
(evil-define-key 'normal 'global (kbd "SPC a V") 'artist-select-op-vaporize-lines)
(evil-define-key 'normal 'global (kbd "SPC a y") 'artist-select-op-copy-rectangle)
(evil-define-key 'normal 'global (kbd "SPC a x") 'artist-select-op-cut-rectangle)
(evil-define-key 'normal 'global (kbd "SPC a v") 'artist-select-op-paste)
