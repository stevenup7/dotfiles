
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;; (print "configuring ido and flx ido")

(require 'flx-ido)
(require 'ido-hacks nil t)

(ido-mode 1)

(if (commandp 'ido-vertical-mode)
    (progn
      (ido-vertical-mode 1)
      (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)))

(if (commandp 'smex)
    (global-set-key (kbd "M-x") 'smex))

(if (commandp 'flx-ido-mode)
    (flx-ido-mode 1))

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
