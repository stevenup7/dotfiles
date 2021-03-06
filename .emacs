;; setup and configure melpa packages

(load-file "~/.emacs.d/sup/packages/install-packages.el")

;; configure all the things
(load-file "~/.emacs.d/sup/config/ido-setup.el")
(load-file "~/.emacs.d/sup/config/lockfiles-and-backups.el")
(load-file "~/.emacs.d/sup/config/javascript.el")
(load-file "~/.emacs.d/sup/config/handy_functions.el")
(load-file "~/.emacs.d/sup/config/cleanup-on-save.el")
;;(load-file "~/.emacs.d/sup/config/typescript.el")

;; set some keyboard shortcuts and general config
(load-file "~/.emacs.d/sup/config/keyboard.el")
(load-file "~/.emacs.d/sup/config/general.el")

;; All the custom stuff don't mess with it :)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(json-reformat:indent-width 2)
 '(org-agenda-files (quote ("~/org/index.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "brightyellow"))))
 '(org-todo ((t (:foreground "red" :weight bold)))))
