;; setup and configure melpa packages

(load-file "~/.emacs.d/sup/packages/install-packages.el")

;; configure all the things
(load-file "~/.emacs.d/sup/config/ido-setup.el")
(load-file "~/.emacs.d/sup/config/lockfiles-and-backups.el")
(load-file "~/.emacs.d/sup/config/javascript.el")
(load-file "~/.emacs.d/sup/config/handy_functions.el")
(load-file "~/.emacs.d/sup/config/cleanup-on-save.el")
(load-file "~/.emacs.d/sup/config/python.el")
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
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("f0b0416502d80b1f21153df6f4dcb20614b9992cde4d5a5688053a271d0e8612" default)))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(org-agenda-files (quote ("~/org/index.org")))
 '(package-selected-packages
   (quote
    (vue-mode web-mode jinja2-mode jedi flycheck dap-mode flymake-json solarized-theme moe-theme pyimport anaconda-mode python-black js2-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
