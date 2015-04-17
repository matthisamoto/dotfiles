(require 'package)
(require 'mwheel)

(setq inhibit-startup-message t)

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/" )))

(setq package-list '(let-alist 
                     evil 
                     evil-leader 
                     flycheck 
                     helm 
                     helm-ag 
                     helm-descbinds
                     color-theme-approximate 
                     helm-projectile 
                     molokai-theme 
                     powerline 
                     powerline-evil 
                     projectile-rails)) 

(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)

(xterm-mouse-mode)
(mouse-wheel-mode)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(unless package-archive-contents (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; plugins

(evil-mode 1)

(setq projectile-completion-system 'helm)
(helm-projectile-on)
(helm-mode 1)
(helm-autoresize-mode)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")

;(color-theme-approximate-on)

(custom-set-variables
 '(custom-safe-themes
   (quote
    ("08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" default))))
(custom-set-faces)

(load-theme 'molokai)

; key bindings

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "C-f") 'helm-find-files)
(define-key evil-normal-state-map [escape] 'keyboard-quit)

(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

(define-key helm-map (kbd "C-c") 'helm-keyboard-quit)
(define-key helm-map [escape] 'helm-keyboard-quit)
