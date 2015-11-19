;; Install all the things I want

(defvar suppackages
  '(;; javascript
    js2-mode
    js2-refactor

    ;; typescript
    typescript-mode

    ;; json
    json-mode

    ;; html
    emmet-mode

    ;; editing
    markdown-mode

    ;; snippet
    yasnippet

    ;; misc utils
    swiper
    smartparens
    load-dir
    expand-region

    ;; ido
    ido-vertical-mode
    ido-at-point
    ido-hacks
    flx-ido
    smex

    ))


(defun sup/install-packages ()
  "loops over packages and installs them"
  (interactive)
  (dolist (pkg suppackages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(sup/install-packages)
