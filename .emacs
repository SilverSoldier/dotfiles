
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
(load-theme 'misterioso)
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
(set-default-font "Monospace 16")

; since emacsclient does not load theme and fonts etc.
(defun startup_func(_)
  (load-file "/home/kavya/.emacs"))

(add-hook 'after-make-frame-functions #'startup_func)

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


;;; lisp related
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;adding slime folder
(add-to-list 'load-path "/home/kavya/software/slime-2.20")
(require 'slime)

;;; lsp related
(require 'lsp-mode)
(require 'lsp-ui)
;; (quelpa 'lsp-mode 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-mode-hook 'company-mode)
(add-hook 'lsp-mode-hook 'flycheck-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-sideline-mode)
(require 'company-lsp)
;; (quelpa 'company-lsp)
(push 'company-lsp company-backends)
;(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates 'auto company-lsp-enable-snippet t)
;;; cquery related 
(require 'cquery)
(setq cquery-executable "~/tools/cquery/build/release/bin/cquery")
(setq cquery-sem-highlight-method 'font-lock)
(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
(cquery-use-default-rainbow-sem-highlight)

(defun cquery-mode-hook ()
 (lsp-cquery-enable))

(add-hook 'c++-mode-hook 'cquery-mode-hook)
(add-hook 'c-mode-hook 'cquery-mode-hook)

;;; java related
(require 'lsp-java)
(add-hook 'java-mode-hook  'lsp-java-enable)
(add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
(setq lsp-java--workspace-folders (list "/home/kavya/projects/llice/src/main"))

;;; haskell related
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
(add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
(customize-set-value 'lsp-haskell-process-path-hie "/home/kavya/.local/bin/hie")

;;; go related
(projectile-mode)
(defun my-switch-project-hook ()
  (go-set-project))
(add-hook 'projectile-after-switch-project-hook #'my-switch-project-hook)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save); gofmt before every save
					; Go-def jump keybinding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  ;; (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  ;; (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg
  (setq gofmt-command "goimports")
  )

(add-hook 'go-mode-hook #'my-go-mode-hook)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;;; pdf related
(pdf-tools-install)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
