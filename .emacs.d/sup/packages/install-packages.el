;; Install all the things I want

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(defvar suppackages
  '(;; javascript
    js2-mode
    js2-refactor

    ;; typescript
    typescript-mode
    tss

    ;; json
    json-mode

    ;; html
    emmet-mode

    ;; python
    python-black

    ;; editing
    markdown-mode

    ;; snippet
    yasnippet

    ;; misc utils
    swiper
    smartparens
    load-dir
    expand-region
    ace-jump-mode

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
  (package-refresh-contents)
  (dolist (pkg suppackages)
    (when (not (package-installed-p pkg))
      (print pkg)
      (package-install pkg))))

;; (sup/install-packages)
