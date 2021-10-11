;; make ace jump mode case insensitive
(setq ace-jump-mode-case-fold t)


(xterm-mouse-mode 1)

;; make emmet mode go C-j
(require 'emmet-mode)

;; setup ya snippets
(require 'yasnippet)
;; personal snippets
(setq yas-snippet-dirs '("~/.emacs.d/sup/snippets"))

(yas-global-mode 1)
(yas-reload-all)

;; https://stackoverflow.com/questions/1085170/how-to-achieve-code-folding-effects-in-emacs
;; genius code folding
(global-set-key (kbd "<f5>") 'set-selective-display-dlw)

(defun set-selective-display-dlw (&optional level)
"Fold text indented same of more than the cursor.
If level is set, set the indent level to LEVEL.
If 'selective-display' is already set to LEVEL, clicking
F5 again will unset 'selective-display' by setting it to 0."
  (interactive "P")
  (if (eq selective-display (1+ (current-column)))
      (set-selective-display 0)
    (set-selective-display (or level (1+ (current-column))))))
