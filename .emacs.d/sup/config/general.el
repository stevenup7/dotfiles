;; make ace jump mode case insensitive
(setq ace-jump-mode-case-fold t)

;; make emmet mode go C-j
(require 'emmet-mode)

(setq yas-snippet-dirs
      '("~/.emacs.d/sup/snippets"                 ;; personal snippets
        ))
