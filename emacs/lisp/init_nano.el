(use-package nano
  :config
  (quelpa '(nano
		    :fetcher github
		    :repo "rougier/nano-emacs"))
  :custom
  (setq nano-font-family-proportional (face-attribute 'variable-width :family))
  (setq nano-font-size 14))
(use-package nano-theme
  :config
  (quelpa '(nano-theme
		    :fetcher github
		    :repo "rougier/nano-theme"))

)

(provide 'init_nano)
