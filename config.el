;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thomas C. Abernathy"
      user-mail-address "thomas@crassflag.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "Jetbrains Mono" :size 15 :weight 'Regular)
       doom-variable-pitch-font (font-spec :family "sans" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-spectrum)
(custom-theme-set-faces! 'doom-monokai-spectrum
  '(line-number :foreground "#ffcb12")
  '(line-number-current-line :foreground "#fff"))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Shortcuts
(map! :leader
      :desc "impatient mode"
      "t p" #'impatient-mode) ;adds shortcut (spc t p) to toggle impatient mode

(map! :leader
      :desc "comment or uncomment selected"
      "d d" #'comment-or-uncomment-region) ;adds shortcut (spc d d) to comment or uncomment selected text

;; Org-Mode
(custom-set-variables
 '(org-agenda-files (list org-directory))) ;tells agenda to pull from any files in org directory

(org-babel-do-load-languages
      'org-babel-load-languages
      '((js . t))) ;allows org mode to execute javascript commands

;; Projectile
(setq projectile-project-search-path '("~/Documents/")) ;will search Documents folder for projects to add to projectile

;; mu4e
(setq mu4e-get-mail-commad "mbsync crassflag")

;; Random scripts
(add-to-list 'default-frame-alist(set-frame-parameter (selected-frame) 'alpha '(100 100))) ;sets opacity to 100%, in case transparency is being pulled from window manager
                                                         ;can make transparent by changing numbers if desired
;; Daemon mode
;; (dfun efs/set-frame-parameter ()
;;       (message "Setting transparency!")
;;       (set-frame-parameter (selected-frame) 'alpha '(100 100))

;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (efs/set-frame-parameter))))
;;   (efs/set-frame-parameter))
