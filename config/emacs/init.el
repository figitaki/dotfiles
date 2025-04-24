(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     default))
 '(package-selected-packages '(auto-dark catppuccin-theme doom-themes evil undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'latte)
(catppuccin-reload)

(load-theme 'doom-one :no-confirm)

(require 'auto-dark)
(setq auto-dark-allow-osascript t)
(auto-dark-mode)
(setq auto-dark-themes '((doom-one) (catppuccin)))

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(autoload 'gerbil-mode "gerbil-mode" "Gerbil editing mode." t)

(defvar gerbil-program-name
  (expand-file-name "/opt/homebrew/bin/gxi")) ; default installation, adjust for your GERBIL_INSTALL_PREFIX
(setq scheme-program-name gerbil-program-name)

(menu-bar-mode)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
