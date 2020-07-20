;;; shado-theme.el --- Custom face theme for Emacs

;;; Code:
(deftheme shado)

(custom-theme-set-faces 'shado
                        '(underline
                          ((((class color)
                             (min-colors 89))
                            (:underline t))))
                        '(font-lock-warning-face
                          ((((class color)
                             (min-colors 89))
                            (:background "#6e2323" :foreground "#ffe5ff"))))
                        '(font-lock-type-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#8677d9"))))
                        '(font-lock-preprocessor-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#849be0"))))
                        '(font-lock-keyword-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#c081fa"))))
                        '(font-lock-builtin-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#505ede"))))
                        '(font-lock-string-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#73daff"))))
                        '(font-lock-constant-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#de286e"))))
                        '(font-lock-function-name-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#e086e0"))))
                        '(font-lock-variable-name-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#cd9ad9"))))
                        '(font-lock-doc-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#6272a4"))))
                        '(font-lock-comment-face
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#6272a4"))))
                        '(cursor
                          ((((class color)
                             (min-colors 89))
                            (:background "#6161b3" :foreground "#dfb7e8"))))
                        '(show-paren-match
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#1ea69d"))))
                        '(show-paren-match-face
                          ((((class color)
                             (min-colors 89))
                            (:inverse-video t :foreground "#1ea69d"))))
                        '(default
                           ((((class color)
                              (min-colors 89))
                             (:foreground "#dfb7e8"))))
                        '(highline-face
                          ((((class color)
                             (min-colors 89))
                            (:underline t :background "#755999"))))
                        '(ac-selection-face
                          ((((class color)
                             (min-colors 89))
                            (:underline t :weight bold :background "#2F2F4A" :foreground "#6876de"))))
                        '(org-todo
                          ((((class color)
                             (min-colors 89))
                            (:underline t :foreground "#943d84"))))
                        '(org-headline-todo
                          ((((class color)
                             (min-colors 89))
                            (:underline t :foreground "#943d84"))))
                        '(org-ellipsis
                          ((((class color)
                             (min-colors 89))
                            (:underline t :foreground "#0fd1be"))))
                        '(hl-line
                          ((((class color)
                             (min-colors 89))
                            (:background nil)))) ; :background "#40408f"
                        '(company-tooltip
                          ((((class color)
                             (min-colors 89))
                            (:background "#2F2F4A" :foreground "#bfaee3"))))
                        '(company-scrollbar-fg
                          ((((class color)
                             (min-colors 89))
                            (:background "#26264a" :foreground "#a883a8"))))
                        '(company-scrollbar-bg
                          ((((class color)
                             (min-colors 89))
                            (:background "#3d3d6b" :foreground "#a883a8"))))
                        '(company-tooltip-selection
                          ((((class color)
                             (min-colors 89))
                            (:background "#464685" :foreground "#6876de"))))
                        '(company-tooltip-common
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#0fd1be"))))
                        '(company-tooltip-common-selection
                          ((((class color)
                             (min-colors 89))
                            (:foreground "#0fd1be"))))
                        '(company-tooltip-mouse
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(company-tooltip-search
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(company-tooltip-search-selection
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(header-line-header
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(highlight
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(doom-modeline-bar
                          ((((class color)
                             (min-colors 89))
                            (:background "#9786d1"))))
                        '(vimish-fold-overlay
                          ((((class color)
                             (min-colors 89))
                            (:slant italic :weight light :foreground "#9786d1"))))
                        '(vimish-fold-mouse-face
                          ((((class color)
                             (min-colors 89))
                            (:slant italic :weight light :foreground "#9786d1"))))
                        '(ac-candidate-face
                          ((((class color)
                             (min-colors 89))
                            (:background "#2F2F4A" :foreground "#eed6ee"))))
                        '(flyspell-duplicate
                          ((((class color)
                             (min-colors 89))
                            (:underline
                             (:style wave)))))
                        '(flyspell-incorrect
                          ((((class color)
                             (min-colors 89))
                            (:underline
                             (:style wave)))))
                        '(region
                          ((((class color)
                             (min-colors 89))
                            (:background "#40408f" :foreground "#bfaee3"))))
                        '(mode-line-inactive
                          ((((class color)
                             (min-colors 89))
                            (:inverse-video t :background "#35355e" :foreground "#1B1B29"))))
                        '(mode-line-buffer-id
                          ((((class color)
                             (min-colors 89))
                            (:weight bold :background "#35355e" :foreground "#1B1B29"))))
                        '(mode-line
                          ((((class color)
                             (min-colors 89))
                            (:weight bold :background "#35355e" :foreground "#1B1B29"))))
                        '(fringe
                          ((((class color)
                             (min-colors 89))
                            (:underline t :background "#1B1B29" :foreground "#a1a1dd"))))
                        '(global-linum-mode
                          ((((class color)
                             (min-colors 89))
                            (:underline t :background "1B1B29" :foreground "#a1a1dd"))))
                        '(linum-highlight-face
                          ((((class color)
                             (min-colors 89))
                            (:underline t :background "1B1B29" :foreground "#de286e"))))
                        '(isearch
                          ((((class color)
                             (min-colors 89))
                            (:inverse-video t :background "#dfb7e8" :foreground "#302b30"))))
                        '(isearch-lazy-highlight-face
                          ((((class color)
                             (min-colors 89))
                            (:underline t :weight bold :background "#de286e" :foreground "#dfb7e8"))))
                        '(dired-directory
                          ((((class color)
                             (min-colors 89))
                            (:weight bold :foreground "#00bbff"))))
                        '(org-checkbox
                          ((((class color)
                             (min-colors 89))
                            (:slant italic :foreground "#ff79c6"))))
                        '(org-checkbox-statistics-done
                          ((((class color)
                             (min-colors 89))
                            (:strike-through t :foreground "#2F2F4A"))))
                        '(org-code
                          ((((class color)
                             (min-colors 89))
                            (:weight extra-light :foreground "#329090"))))
                        '(org-document-title
                          ((((class color)
                             (min-colors 89))
                            (:weight extra-bold :foreground "#8897F4"))))
                        '(org-done
                          ((((class color)
                             (min-colors 89))
                            (:strike-through t :foreground "#2F2F4A"))))
                        '(org-priority
                          ((((class color)
                             (min-colors 89))
                            (:weight extra-bold :foreground "#de286e"))))
                        '(org-warning
                          ((((class color)
                             (min-colors 89))
                            (:weight extra-bold :background "#de286e"))))
                        '(org-headline-done
                          ((((class color)
                             (min-colors 89))
                            (:strike-through t :foreground "#2F2F4A"))))
                        '(org-verbatim
                          ((((class color)
                             (min-colors 89))
                            (:weight light :foreground "#6f88e8"))))
                        '(org-block
                          ((((class color)
                             (min-colors 89))
                            (:weight light :width semi-expanded :foreground "#beaff0"))))
                        '(annotate-annotation
                          ((((class color)
                             (min-colors 89))
                            (:weight light :foreground "#943d84"))))
                        '(annotate-annotatation-secondary
                          ((((class color)
                             (min-colors 89))
                            (:weight light :foreground "#c44faf"))))
                        '(annotate-highlight
                          ((((class color)
                             (min-colors 89))
                            (:weight light :underline t))))
                        '(annotate-highlight-secondary
                          ((((class color)
                             (min-colors 89))
                            (:weight light :underline t))))
                        )

(provide-theme 'shado)

;; Local Variables:
;; no-byte-compile: t
;; End:
