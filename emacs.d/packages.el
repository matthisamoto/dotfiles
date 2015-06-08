(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-archive-enable-alist '(("melpa-stable" deft magit)))

(defvar buddin/packages '(auto-complete
			  deft
			  evil
			  evil-leader
			  flycheck
			  go-mode
			  helm
			  helm-ag
			  helm-gtags
			  helm-package
			  helm-projectile
			  magit
			  org
			  projectile
			  writegood-mode
			  yaml-mode)
  "Packages")

(defun buddin/packages-installed ()
  (loop for pkg in buddin/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (buddin/packages-installed)
  (package-refresh-contents)
  (dolist (pkg buddin/packages)
    (when (not (package-installed-p pkg))
            (package-install pkg))))

(dolist (pkg buddin/packages)
  (require pkg))
