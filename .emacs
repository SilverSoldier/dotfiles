
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
 (quote
 (evil-commentary lsp-uicompany-lsp cquery lsp-mode org-tree-slide yasnippet helm evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Nimbus Mono L" :foundry "urw" :slant normal :weight normal :height 180 :width normal)))))

;; Due to conflict with dwm -> swap meta and super
(setq x-meta-keysym 'super)
(setq x-super-keysym 'meta)

(require 'evil)
  (evil-mode 1)
(evil-commentary-mode)

(require 'org)

;; In general related to lsp
;(require 'lsp-mode)
;(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;(require 'company-lsp)
;(push 'company-lsp company-backends)
;(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates 'auto company-lsp-enable-sn    ippet t)


;; options related to cquery
;(require 'cquery)
;(setq cquery-executable "/path/to/cquery_executable"
)
;(setq cquery-sem-highlight-method 'font-lock)
;(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
;(cquery-use-default-rainbow-sem-highlight)


;(defun cquery-mode-hook ()
;  (lsp-cquery-enable)
;  (company-mode)
;  (flycheck-mode))

;(add-hook 'c++-mode-hook 'cquery-mode-hook)
;(add-hook 'c-mode-hook 'cquery-mode-hook)

(require 'helm)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

(require 'yasnippet)
(yas-global-mode 1)

(global-linum-mode t)

