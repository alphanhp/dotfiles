;;;;;;;;;;;;
;;theme
;;;;;;;;;;;;
(use-package base16-theme
  :ensure t)
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'base16-everforest t)
  )

(custom-set-faces
 '(default ((t (:family "CodeNewRoman Nerd Font Mono" :foundry "outline" :slant normal
 :weight regular :height 140 :width normal)))))




(provide 'init_theme)
