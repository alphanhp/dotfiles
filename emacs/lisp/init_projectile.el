;;;;;;;;;;;;;;;;;;;;;;;
;;项目管理（projectile）
;;;;;;;;;;;;;;;;;;;;;;;


(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))
  
(provide 'init_projectile)
