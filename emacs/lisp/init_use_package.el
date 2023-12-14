(require 'package)
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (package-initialize)
 (setq package-archives '(("gnu" . "http://1.15.88.122/gnu/")		 
                         ;;("melpa" .               "http://1.15.88.122/melpa/")
                         ;;("nongnu" .             "http://1.15.88.122/nongnu/")
                         ("melpa-stable" .    "http://1.15.88.122/stable-melpa/")
                         ;;("org" . "http://1.15.88.122/org/")
			 ))

 (eval-when-compile
   (require 'use-package))




(provide 'init_use_package)
