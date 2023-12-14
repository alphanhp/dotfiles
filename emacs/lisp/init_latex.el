(use-package reftex
  :ensure t
  ;; turn on if LaTeX-mode-hook
  :hook (LaTeX-mode . turn-on-reftex)
  :config
  :custom
  (reftex-plug-into-AUCTeX t)
  )

(use-package cdlatex
  :ensure t
  ;; turn on if LaTeX-mode-hook
  :hook (LaTeX-mode . turn-on-cdlatex)
  :custom
  (cdlatex-takeover-dollar nil)
  (cdlatex-simplify-sub-super-scripts nil)
  (cdlatex-paired-parens nil)
  ;; paren: disable cdlatex and use auctex
  (cdlatex-takeover-parenthesis nil)
  (cdlatex-use-dollar-to-ensure-math nil)
  (cdlatex-math-modify-prefix "C-\\")
  (cdlatex-math-symbol-prefix ?`)
  (cdlatex-math-modify-alist ;;Character Math Text t nil nil
   '((?c "\\textcolor{red}" "\\textcolor{SeaGreen}" t nil nil)
     (?C "\\mathcal" "\\textsc" t nil nil)
     (?h "\\colorbox{SeaGreen}" "\\colorbox{SeaGreen}" t nil nil)
     (?H "\\colorboxd{SeaGreen}" "\\colorboxd{SeaGreen}" t nil nil)
     (?t "\\text" nil t nil nil)
     (?u "\\unit" "\\underline" t nil nil)
     (?z "\\zh" "\\zh" t nil nil)
     (?- "\\bar" "\\sout" t nil nil)
     (?\] "\\underbracket" nil t nil nil)
    )
   )
  (cdlatex-math-symbol-alist
   '((?{ ("\\subseteq"))))
  :bind (:map cdlatex-mode-map
              ("<" . nil)
              )
  )

;; (use-package preview-dvisvgm
;;   :ensure t
;;   :mode "\\.tex\\'"
;;   )

(use-package preview
  :mode "\\.tex\\'"
  :custom
  (preview-image-type 'dvipng)
  )

;; latex.el in AUCTeX
;; https://www.gnu.org/software/auctex/manual/auctex/Modes-and-Hooks.html#Modes-and-Hooks
;; TL;DR: Just *installing* AUCTeX is enough to override the emacs's built in tex-mode.el and to use AUCTeX's LaTeX-mode as the major mode.
;; The AUCTeX's mode functions are TeX-tex-mode, TeX-latex-mode, etc.
;; See this post https://stackoverflow.com/a/70178950/21201947

;; (use-package tex-mode
;;   :mode "\\.tex\\'"
;;   :config
;;   (setq tex--prettify-symbols-alist
;;         (append tex--prettify-symbols-alist
;;                 '(("\\item" . ?•)
;;                   ("\\section" . ?§)
;;                   ("\\subsection" . ?§)
;;                   ("\\subsubsection" . ?§)
;;                   ("\\begin" . ?⦃)
;;                   ("\\end" . ?⦄)
;;                   ("\\implies" . ?⇒)
;;                   ("\\iff" . ?⇔)
;;                   ("\\nrightarrow" . ?↛)
;;                   ("\\nRightarrow" . ?⇏)
;;                   ("\\dots" . ?…)
;;                   ("\\cdots" . ?⋯)
;;                   ("\\ddots" . ?⋱)
;;                   ("\\vdots" . ?⋮)
;;                   ("\\bot" . ?⟂)
;;                   ("\\overline" . ?‾)
;;                   ("\\pm" . ?±)
;;                   ("\\mp" . ?∓)
;;                   ("\\star" . ?★)
;;                   ("\\llbracket" . ?⟦)
;;                   ("\\rrbracket" . ?⟧))))
;;   )

(use-package latex
  :ensure auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :hook (
         (LaTeX-mode . prettify-symbols-mode)
         (LaTeX-mode . outline-minor-mode)
         (LaTeX-mode . turn-on-auto-fill)
         )
  :bind (:map LaTeX-mode-map
              ("<backtab>" . LaTeX-indent-line)
              ("C-c C-a" . (lambda () (interactive) (let (TeX-save-query) (TeX-save-document (TeX-master-file))) (TeX-command-run-all nil)))
              )
  :config
  ;; make AUCTeX aware of style files and multifile documents
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  ;; add-to-list only AFTER package loaded
  (add-to-list 'LaTeX-verbatim-environments "lstlisting")
  (add-to-list 'LaTeX-verbatim-environments "lstinputlisting")
  (add-to-list 'LaTeX-verbatim-environments "lstinline")
  (add-to-list 'LaTeX-verbatim-environments "Verbatim")
  ;; escape indentation for verbatim
  (add-to-list 'LaTeX-indent-environment-list '("tabular" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("tabular*" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("lstlisting" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("lstinputlisting" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("algorithm" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("algorithmic" current-indentation))
  ;; (setq preview-scale-function
  ;;       (lambda () (* 0.75 (funcall (preview-scale-from-face)))))

  :custom
  (LaTeX-fill-excluded-macros '("hypersetup" "title" "author" "date"))
  (TeX-newline-function 'reindent-then-newline-and-indent)
  ;; Braces: https://www.gnu.org/software/auctex/manual/auctex.html#Quotes
  (LaTeX-electric-left-right-brace t)
  )


;; (use-package tex
;;   :ensure auctex
  
;;    :hook( outline-minor-mode-hook
;;           auto-fill-mode-hook
;;           yas-minor-mode-hook
;;           reftex-mode-hook)
;;    )


  

;; (setq-default TeX-master nil)
;; (setq TeX-parse-selt t)
;; (setq TeX-auto-save t)

;; ;; PDF正向搜索相关设置
;; (setq TeX-PDF-mode t) 
;; (setq TeX-source-correlate-mode t) 
;; (setq TeX-source-correlate-method 'synctex) 
;; (setq TeX-view-program-selection 
;;   '(("Sumatrapdf"
;;        ("\"c:/ProgramData/scoop/apps/sumatrapdf/current/SumatraPDF.exe\"
;;           -reuse-instance" (mode-io-correlate " -forward-search %b %n ") "
;;         %o")
;;        )
;;     )
;;   )


;; ;; 调整自动补全字符串的优先级顺序
;; (setq hippie-expand-try-functions-list 
;;       '(try-expand-dabbrev
;;        	try-expand-dabbrev-visible
;; 	try-expand-dabbrev-all-buffers
;; 	try-expand-dabbrev-from-kill
;; 	try-complete-file-name-partially
;; 	try-complete-file-name
;; 	try-expand-all-abbrevs
;; 	try-expand-list
;; 	try-expand-line
;; 	try-complete-lisp-symbol-partially
;; 	try-complete-lisp-symbol)
;;       )


(provide 'init_latex)
