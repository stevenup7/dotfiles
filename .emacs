;; setup and configure melpa packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(load-file "~/.emacs.d/sup/packages/install-packages.el")

;; configure all the things 
(load-file "~/.emacs.d/sup/config/ido-setup.el")
(load-file "~/.emacs.d/sup/config/lockfiles-and-backups.el")
(load-file "~/.emacs.d/sup/config/javascript.el")
(load-file "~/.emacs.d/sup/config/handy_functions.el")
(load-file "~/.emacs.d/sup/config/cleanup-on-save.el")

;; set some keyboard shortcuts 
(load-file "~/.emacs.d/sup/config/keyboard.el")
(require 'emmet-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
