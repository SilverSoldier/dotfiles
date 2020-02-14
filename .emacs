;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
	    ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
		   '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(prefer-coding-system 'utf-8)

;;; essentials
(require 'evil)
;; (quelpa 'evil)
(evil-mode 1)
(require 'git)

(require 'helm-config)
;; (quelpa 'helm-config)
(helm-mode 1)
(define-key evil-normal-state-map " " 'helm-M-x)
(define-key evil-emacs-state-map " " 'helm-M-x)

; helm-mini
(define-key evil-emacs-state-map (kbd ";") 'helm-mini)
(define-key evil-normal-state-map (kbd ";") 'helm-mini)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;;; UI
;; (load-theme 'deeper-blue 'tramp 'wombat)
;; (load-theme 'whiteboard 'dichromacy 'adwaita)  
; disable bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(defun my-hl-line-range-function ()
  (cons (line-end-position) (line-beginning-position 2)))
(setq hl-line-range-function #'my-hl-line-range-function)

(global-hl-line-mode 1)

; set font and size
(set-default-font "Monospace 14")

;;; general programming related
(auto-complete-mode 1)
(add-hook 'prog-mode-hook 'company-mode)
(setq-default tab-width 4)

; relative line numbering
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; Git related
(global-git-gutter+-mode)

(define-key evil-normal-state-map (kbd "]c") 'git-gutter+-next-hunk)
(define-key evil-normal-state-map (kbd "[c") 'git-gutter+-previous-hunk)

;;; OCaml related
(load "/home/kavya/.opam/default/share/emacs/site-lisp/tuareg-site-file")

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(setq utop-command "opam config exec -- utop -emacs")
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)


;;; pdf related
(pdf-tools-install)
;; use zathura for dvi and pdf viewer
(setq TeX-view-program-selection
      '((output-dvi "Zathura")
        (output-pdf "Zathura")))
(setq TeX-view-program-list
      '(("Zathura" "zathura %o")))

;;; Latex related
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; Package installation related
