;; ;;;;;;;;;;;;;;;;;;;;

;; ;;orgmode

;; ;;;;;;;;;;;;;;;;;;;;
(require 'ox-beamer)
(require 'ox-md)

(use-package org-bullets
   :ensure t)

(use-package org
  :ensure t
  :hook 
  (org-mode . org-bullets-mode)
  (org-mode . org-cdlatex-mode)


  :custom
  (org-highlight-latex-and-related '(native latex entities)) ;; LaTeX 高亮设置
  (org-pretty-entities t) ;; LaTeX 代码的 prettify
  (org-pretty-entities-include-sub-superscripts nil) ;; 不隐藏 LaTeX
  ;; 的上下标更容易编辑
  (org-format-latex-options
   '(:foreground default :background default :scale 1.8
		 :html-foreground "Black" :html-background "Transparent"
		 :html-scale 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  ;; 增大公式预览的图片大小
  ;; Choose some fonts
  (set-face-attribute 'default nil :family "Iosevka Nerd Font")
  (set-face-attribute 'variable-pitch nil :family "Iosevka Nerd Font")

  ;; Add frame borders and window dividers
  (modify-all-frames-parameters
   '((right-divider-width . 40)
     (internal-border-width . 40)))
  (dolist (face '(window-divider
                  window-divider-first-pixel
                  window-divider-last-pixel))
    (face-spec-reset-face face)
    (set-face-foreground face (face-attribute 'default :background)))
  (set-face-background 'fringe (face-attribute 'default :background))
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"
   org-startup-with-inline-images t

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  :config
  ;;    (add-hook 'org-mode-hook #'org-bullets-mode)
  ;;    (add-hook 'org-mode-hook #'org-cdlatex-mode) ;; 打开 cdlatex

  (setq org-startup-indented t)
  (setq org-log-done 'time)
  (setq org-log-done 'note)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w!)" "|" "DONE(d!)" "CANCEL(c!/@)")
          (sequence "READ(r!)" "REVIEW(!/@)" "PRACTISE(p!/@)"
		    "NOTE(n!/@)" "AMEMDMEMTS(a!/@)" "|" "FINISHED(f!/@)"))))




;; (use-package org
;;   :ensure t
;;   :hook (;;(org-mode . turn-on-auto-fill)
;;          (org-mode . turn-on-org-cdlatex)
;; 	 (org-mode . org-bullets-mode)
;;          )
;;   :init
;;   (setq org-directory "~/org")
;;   :custom
;;   ;; (org-directory "~/org")
;;   (org-use-sub-superscripts '{})
;;   (org-default-notes-file (concat org-directory "/notes.org"))
;;   (org-allow-promoting-top-level-subtree t)
;;   (org-latex-prefer-user-labels t)
;;   ;; Appearance (set them to t with org-appear on for better visibility and editability)
;;   (org-hide-emphasis-markers t)
;;   ;; - show plain text for links
;;   (org-descriptive-links nil)
;;   ;; - latex-related display settings
;;   (org-pretty-entities t)
;;   (org-pretty-entities-include-sub-superscripts nil)
;;   (org-highlight-latex-and-related '(latex))
;;   (org-src-fontify-natively t)
;;   ;; Automatically generate CUSTOM_ID
;;   (org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
;;   :config
;;   ;; Org LaTeX
;; ;  (setq org-latex-packages-alist '(("" "my" t)))
;; ;  (setq org-format-latex-options (plist-put org-format-latex-options ':html-scale 0.8))
;;   :bind
;;   (("C-c a" . org-agenda)
;;    :map org-cdlatex-mode-map
;;    ("'" . nil)
;;    ("C-\\" . org-cdlatex-math-modify)
;;    )
;;   )

;; (use-package org-appear
;;   :ensure t
;;   :hook ((org-mode . org-appear-mode))
;;   )

;; (use-package org-capture
;;   :bind (("C-c c" . org-capture) ;; global
;;          )
;;   :custom
;;   (org-capture-templates
;;    '(("t" "Tasks" entry (file+headline (lambda () (concat org-directory "/capture.org")) "Tasks") "* TODO %?\n  %U\n  %a")))
;;   )

;; (use-package org-roam
;;   :ensure t
;;   :custom
;;   (org-roam-directory (file-truename "~/org-roam"))
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n c" . org-roam-capture)
;;          ;; Dailies
;;          ("C-c n j" . org-roam-dailies-capture-today))
;;   :config
;;   (org-roam-db-autosync-mode))

;; (use-package org-agenda
;;   ;;:after (org org-roam)
;;   :bind ("C-c a" . org-agenda)
;;   :custom
;;   (org-agenda-files
;;    '("~/notes/org-src" "~/org"
;;      "~/notes/comp4901x" "~/notes/fudan"
;;      ))
;;   )

;; ;; (setq org-agenda-files
;; ;;         `(;;"~/org";;,org-directory
;; ;;           ;;,org-roam-directory
;; ;;           "~/org-src"
;; ;;           "~/notes/comp4901x"
;; ;;           "~/notes/fudan"
;; ;;           ))

;; (use-package org-refile
;; ;;  :after (org-agenda)
;;   :custom
;;   (org-refile-targets '((nil)
;;                         (org-agenda-files)))
;;   )

;; (use-package ol
;;   :bind (("C-c l" . org-store-link) ;; global
;;          )
;;   )

;; ;; Org HTML
;; ;; (use-package ox-html
;; ;;   :ensure t
;; ;;   :custom
;; ;;   (org-html-with-latex 'dvisvgm)
;; ;;   ;; support arbitrary blocks
;; ;;   (org-html-doctype "html5")
;; ;;   (org-html-html5-fancy t)
;; ;;   )

;; (use-package ox-latex
;;   :custom
;;   (org-latex-math-environments-re "\\`[ 	]*\\\\\\[\\|\\\\begin{\\(?:align\\(?:at\\)?\\|d\\(?:array\\|group\\|isplaymath\\|math\\|series\\)\\|e\\(?:mpheq\\|q\\(?:narray\\|uation\\)\\)\\|flalign\\|gather\\|m\\(?:ath\\|ultline\\)\\|subequations\\|x\\(?:x?alignat\\)\\)\\*?}"))

;; (use-package ox
;;   :custom
;;   (org-export-with-creator t)
;;   (org-export-with-date nil)
;;   (org-export-with-sub-superscripts '{}))

;; ;; Publishing
;; (use-package ox-publish
;;   :custom
;;   (org-publish-list-skipped-files nil) ;; a lot of unchanged svg files
;;   (org-html-validation-link nil)
;;   (org-html-head-include-default-style nil)
;;   ;; inserted into <head>
;;   (org-html-head
;;    (with-temp-buffer
;;      (insert-file-contents-literally "~/notes/org-src/head.html")
;;      (buffer-substring-no-properties (point-min) (point-max))))
;;   (org-html-home/up-format
;;    (with-temp-buffer
;;      (insert-file-contents-literally "~/notes/org-src/home-up.html")
;;      (buffer-substring-no-properties (point-min) (point-max)))
;;    )
;;   (org-html-preamble
;;    (with-temp-buffer
;;      (insert-file-contents-literally "~/notes/org-src/preamble.html")
;;      (buffer-substring-no-properties (point-min) (point-max))))
;;   (org-html-postamble t)
;;   (org-html-postamble-format
;;    `(("en"
;;      ,(with-temp-buffer
;;        (insert-file-contents-literally "~/notes/org-src/postamble.html")
;;        (buffer-substring-no-properties (point-min) (point-max))))))
;;   (org-html-prefer-user-labels t)
;;   (org-html-self-link-headlines t)
;;   ;;(org-html-use-infojs t)
;;   (org-html-link-home "/blog/index.html")
;;   (org-html-link-up "../")
;;   ;; for with creator/date, see ox
;;   :config
;;   (setq org-publish-project-alist
;;         '(
;;           ;; the main project
;;           ("org-blog"
;;            :components ("static" "org-src")
;;            )
;;           ;; sub-projects
;;           ("static"
;;            :base-directory "~/notes/org-src/"
;;            :base-extension "css\\|js\\|svg\\|woff\\|woff2\\|png\\|pdf"
;;            :publishing-directory "~/org-blog/"
;;            :exclude: ".*private/.*"
;;            :recursive t
;;            :publishing-function (org-publish-attachment)
;;            )
;;           ("org-src"
;;            :base-directory "~/notes/org-src/"
;;            :publishing-directory "~/org-blog/"
;;            :exclude ".*\.draft\.org\\|.*private/.*"
;;            :base-extension "org"
;;            :recursive t
;;            :publishing-function (org-html-publish-to-html)
;;            :auto-sitemap t
;;            :sitemap-title "Sitemap"
;;            :makeindex t
;;            )
;;           ;; ("private"
;;           ;;  :base-directory "~/org-src/private"
;;           ;;  :publishing-directory "~/org-blog/private"
;;           ;;  :base-extension "org"
;;           ;;  :recursive t
;;           ;;  :publishing-function (org-html-publish-to-html)
;;           ;;  )
;;           ))
;;   )

;; ;; (require 'org-latex-preview)
;; ;; (use-package org-latex-preview
;; ;;   :custom
;; ;;   (org-preview-latex-default-process 'dvisvgm)
;; ;;   ;;(org-latex-preview-auto-mode t)
;; ;;   )

(provide 'init_org)
