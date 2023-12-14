;;--*--*--*--*--*--*--*--*--*--*--*--*--init--*--*--*--*--*--*--*--*--*--*--*--;;
 (when init-file-debug
        (setq use-package-verbose t
              use-package-expand-minimally nil
              use-package-compute-statistics t
              debug-on-error t))


(add-to-list 'load-path(expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)

(defconst *spell-check-support-enable* nil)

;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)

;; From https://github.com/purcell/emacs.d/:
;; Adjust garbage collection thresholds during startup, and thereafter

(setq gc-cons-threshold (* 20 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 128 1024 1024))))


;; Process performance tuning

(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)




(setq custom-file (locate-user-emacs-file "custom.el"))


(require 'init_global)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (require 'init_site_lisp)
 (require 'init_package)
 (require 'init_use_package)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (require 'init_theme)
 (require 'utils)
 (require 'startscr)
 (require 'autocomple)
 (require 'init_snippets)
 (require 'init_projectile)
;(require 'init_nano)

(require 'pdf)
(require 'init_org)
(require 'init_latex)


(provide 'init)
