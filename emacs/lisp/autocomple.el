;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;补全功能增强插件ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package counsel
  :ensure t)

  (use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
 ; ("C-c v" . 'ivy-push-view)
 ;("C-c s" . 'ivy-switch-view)
 ;("C-c V" . 'ivy-pop-view)
 ;("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射
					;为 C-x C-@，比如在 macOS 上,
					;所以要手动设置
 ;("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;autcompletion(conmpany mode & company box)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自
					; 动补全
  
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等
  ;; 来进行选择).
  
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选
					; 择的频率进行排序，读者如果不
					; 喜欢可以去掉


(use-package company-box

  :ensure t
  :hook (company-mode . company-box-mode))


(provide 'autocomple)
