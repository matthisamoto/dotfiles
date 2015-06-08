(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
	((boundp 'user-init-directory) user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(setq user-full-name "Brett Buddin")
(setq user-mail-address "brett@buddin.us")
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
(menu-bar-mode -1)

(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(require 'cl)

(add-to-list 'load-path "~/.emacs.d/colors")
(load "buddin-light")
(set-background-color "buddin-light")

(load-user-file "packages.el")
(load-user-file "settings.el")
(load-user-file "bindings.el")
