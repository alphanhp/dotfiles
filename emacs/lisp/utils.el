;;--*--utilities--*--
;;;;;;;;;;;;;;;;;;;;
;;amx
;;;;;;;;;;;;;;;;;;;;

;;可以记录我们每次调用 M-x 时输入的命令历史
;;然后每次将最常用的显示在前面
;;对于短时间频繁输入某几个命令的场景非常有用


(use-package amx
  :ensure t
  :init (amx-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;which_key(快捷键补全)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :ensure t
  :init (which-key-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode line 更加漂亮、方便管理
;;自行探索
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package nerd-icons
  :ensure t)
;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   )

;; (use-package 
;;   :ensure t
;;   :init (powerline-major-mode 1))





;; (use-package smart-mode-line
;;   :ensure t
  
  
;;   :init
;;   (setq sml/theme 'respectful)
;;   (setq sml/no-confirm-load-theme t)
;;   (sml/setup)
;;   )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;avy(快速光标跳转，围绕光标操作)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package avy
  :ensure t
  :bind
  (("M-j" . avy-goto-char-timer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;marginalia(minibuffer，注解)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;highlight-symbol
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;高亮出当前 Buffer 中所有的、与光标所在处的符号相同的符号
;;例如一些同名变量、函数名等

(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;rainbow-delimiters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;用不同颜色标记多级括号

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))



(provide 'utils)
