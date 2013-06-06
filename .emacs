;; Delete a word
(global-set-key "\C-w" 'backward-kill-word)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
(setq-default tab-width 2)

;; Line by line scrolling
(setq scroll-step 1)

;; Show line number
(global-linum-mode 1)

;; Auto refresh all buffers on file change
(global-auto-revert-mode t)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

;; Auto save in folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; undo remapped
(define-key global-map (kbd "C-u") 'undo)

;; utf8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Modes
(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(require 'whitespace)
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)

(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2)

(require 'sws-mode)
(autoload 'sws-mode "sws" nil t)
(require 'jade-mode)
(autoload 'jade-mode "jade" nil t)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(require 'stylus-mode)
(autoload 'sytlus-mode "stylus" nil t)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(require 'scss-mode)
(autoload 'scss-mode "scss" nil t)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
;;(require 'sass-mode)
;;(autoload 'sass-mode "sass" nil t)
;;(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; Lintnode Syntax check
(add-to-list 'load-path "~/.emacs.d/lintnode")
(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/.emacs.d/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
(add-hook 'js-mode-hook
          (lambda ()
            (lintnode-hook)))

;; Flymake cursor
;; Nice Flymake minibuffer messages
(require 'flymake-cursor)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; SLIME for swank.js
(add-to-list 'load-path "~/.emacs.d/slime")
(add-to-list 'load-path "~/.emacs.d/slime/contrib")
(setq slime-backend "~/.emacs.d/slime/swank-loader.lisp")
(load "slime-autoloads")
(require 'slime)
(require 'slime-autoloads)
(eval-after-load "slime"
`(progn
(slime-setup '(slime-repl))
(custom-set-variables
'(inhibit-splash-screen t)
'(slime-complete-symbol*-fancy t)
'(slime-complete-symbol-function ‘slime-fuzzy-complete-symbol)
'(slime-net-coding-system ‘utf-8-unix)
'(slime-startup-animation nil)
'(slime-lisp-implementations ‘((sbcl ("/opt/local/bin/sbcl"))))))) 
;;(require 'slime-autoloads)
;;(setq slime-lisp-implementations `(sbcl ("/opt/local/bin/sbcl"))
;;(add-hook 'lisp-mode-hook
;;  (lambda () 
;;    (cond ((not (featurep 'slime)) (require 'slime) (normal-mode)))))
;;(eval-after-load "slime" '(slime-setup '(slime-fancy slime-banner)))
;;(require 'slime)
;;(add-hook 'lisp-mode-hook 
;;          (lambda () 
;;            (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook 
          (lambda () 
            (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
(setq inferior-lisp-program "sbcl") 

(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

(add-hook 'css-mode-hook
          (lambda ()
            (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
            (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))

;; Expand region
(add-to-list 'load-path "~/.emacs.d/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; Multiple cursors
(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C-#") 'mc/edit-lines)
(global-set-key (kbd "C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
