(evil-mode 1)
(global-evil-leader-mode)
(helm-mode 1)

(transient-mark-mode t)
(delete-selection-mode t)
(electric-pair-mode 1)

(setq make-backup-files nil)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
(setq tab-width 4
      indent-tabs-mode nil)
(setq column-number-mode t)
(setq line-number-mode t)
(setq undo-limit 100000)
(setq x-select-enable-clipboard t)
(setq-default show-trailing-whitespace t)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(ac-config-default)

(setq evil-move-cursor-back nil)
(setq evil-leader/in-all-states 1)
(setq helm-buffers-fuzzy-matching t)

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(add-hook 'after-init-hook #'global-flycheck-mode)
