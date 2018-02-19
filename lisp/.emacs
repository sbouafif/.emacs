;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq setup-dir
      (expand-file-name "lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path setup-dir)

(require 'package)
(package-initialize)

(require 'dash)

;; Auto save in folder
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

(defun init--install-packages ()
  (packages-install
   '(use-package
     which-key
     smex
     company
     htmlize
     js2-mode
     web-mode
     php-mode
     flycheck
     whitespace
     smartparens
     expand-region
     smart-tabs-mode
     multiple-cursors
     highlight-escape-sequences)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; No tabs
(require 'whitespace)
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(face trailing newline empty tab))
(global-whitespace-mode t)
(setq-default tab-width 2)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
    (if (memq indent-line-function
              '(indent-relative
                indent-relative-maybe))
        (setq indent-tabs-mode nil))
    ad-do-it))

(defmacro smart-tabs-advice (function offset)
  `(progn
     (defvaralias ',offset 'tab-width)
     (defadvice ,function (around smart-tabs activate)
       (cond
        (indent-tabs-mode
         (save-excursion
           (beginning-of-line)
           (while (looking-at "\t*\\( +\\)\t+")
             (replace-match "" nil nil nil 1)))
         (setq tab-width tab-width)
         (let ((tab-width fill-column)
               (,offset fill-column)
               (wstart (window-start)))
           (unwind-protect
               (progn ad-do-it)
             (set-window-start (selected-window) wstart))))
        (t
                  ad-do-it)))))

(smart-tabs-add-language-support go go-mode-hook
      ((go-indent-line . js2-basic-offset)
       (go-indent-region . js2-basic-offset)))

(smart-tabs-add-language-support php web-mode-hook
      ((web-indent-line . js2-basic-offset)
       (web-indent-region . js2-basic-offset)))


(smart-tabs-add-language-support less web-mode-hook
      ((web-indent-line . js2-basic-offset)
       (web-indent-region . js2-basic-offset)))

(smart-tabs-add-language-support scss scss-mode-hook
      ((web-indent-line . js2-basic-offset)
       (web-indent-region . js2-basic-offset)))

(smart-tabs-add-language-support js js-mode-hook
      ((web-indent-line . js2-basic-offset)
       (web-indent-region . js2-basic-offset)))

(smart-tabs-insinuate 'c 'javascript 'go 'php 'less 'scss)

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          go-mode
          markdown-mode
          groovy-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))


;; Load stuff on demand
(autoload 'flycheck-mode "setup-flycheck" nil t)


;; auto-complete // company

;; tab autocomplete
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(setq company-auto-complete t)

;; Finally, to cancel selections by typing non-matching characters
(setq company-require-match 'never)

(add-hook 'after-init-hook 'global-company-mode)

;;(defun indent-or-complete ()
;;    (interactive)
;;    (if (looking-at "\\_>")
;;        (company-complete-common)
;;      (indent-according-to-mode)))
;;
;;(global-set-key "\t" 'company-complete-common)

;; no delay
(setq company-idle-delay 0)

;; company theme
(eval-after-load 'company
  (lambda ()
    (custom-set-faces
     '(company-preview
       ((t (:foreground "darkgray" :underline t))))
     '(company-preview-common
       ((t (:inherit company-preview))))
     '(company-tooltip
       ((t (:background "lightgray" :foreground "black"))))
     '(company-tooltip-selection
       ((t (:background "steelblue" :foreground "white"))))
     '(company-tooltip-common
       ((((type x)) (:inherit company-tooltip :weight bold))
        (t (:inherit company-tooltip))))
     '(company-tooltip-common-selection
       ((((type x)) (:inherit company-tooltip-selection :weight bold))
        (t (:inherit company-tooltip-selection)))))))

;; Load the default configuration
;; (require 'auto-complete-config)
;; Make sure we can find the dictionaries
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
;; Use dictionaries by default
;;(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;;(global-auto-complete-mode t)
;; Start auto-completion after 2 characters of a word
;;(setq ac-auto-start 2)
;; case sensitivity is important when finding matches
;;(setq ac-ignore-case nil)


;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

(require 'expand-region)
(require 'multiple-cursors)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

(setq enable-recursive-minibuffers t)

;; Indentation for python
;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun find-first-non-ascii-char ()
  "Find the first non-ascii character from point onwards."
  (interactive)
  (let (point)
    (save-excursion
      (setq point
            (catch 'non-ascii
              (while (not (eobp))
                (or (eq (char-charset (following-char))
                        'ascii)
                    (throw 'non-ascii (point)))
                (forward-char 1)))))
    (if point
        (goto-char point)
        (message "No non-ascii characters."))))

(require 'key-bindings)

;; Backup files
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name
                (concat user-emacs-directory "auto-save")) t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile-codesearch which-key web-mode sml-mode smex smartparens smart-tabs-mode scss-mode php-mode paredit package-build package+ json-mode jade-mode htmlize highlight-escape-sequences go-mode go-errcheck go-autocomplete flymake-sass flymake-php flymake-less flymake-json flymake-jslint flymake-jshint flymake-csslint flymake-css flycheck expand-region exec-path-from-shell clojure-mode cake2 auto-indent-mode apache-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
