(require 'python-black)
(require 'anaconda-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; (add-hook 'python-mode-hook
;;           (if (eq major-mode 'python-mode)
;;               (lambda ()
;;                 (anaconda-mode)
;;                 (add-hook 'before-save-hook 'python-black-buffer)
;;                 (add-hook 'python-mode-hook 'anaconda-mode)
;;               )
;;             )
;;           )
