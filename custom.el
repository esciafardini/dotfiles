(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-leader evil-nerd-commenter lispyville simpleclip cider key-chord clojure-mode yaml-mode web-mode lsp-ui lsp-mode json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number nlinum move-text magit projectile imenu-anywhere hl-todo guru-mode git-modes git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring anzu ag ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Aclaimant cider connection configuration
(defmacro aclaimant-cider-connection (name&dir port)
  `(defun ,(intern (format "aclaimant-jack-in-%s" (symbol-name name&dir))) ()
     ,(format "Jack into project %s and open its base directory." name&dir)
     (interactive)
     (let ((dir ,(format "~/dev/aclaimant/acl/src/aclaimant/"
                         (symbol-name name&dir))))
       (cider-connect (list :host "local.aclaimant.com" :port ,port
                            :project-dir dir)))))

(aclaimant-cider-connection service 7000)
(aclaimant-cider-connection jobs 7001)
(aclaimant-cider-connection alerter 7002)
(aclaimant-cider-connection twilio 7004)
(aclaimant-cider-connection paper-pusher 7005)

;;Call this function with M-x
(defun aclaimant-jack-in-dashboard ()
  (interactive)
  (cider-connect-cljs (list :host "localhost"
                            :port 7888
                            :cljs-repl-type 'figwheel-connected
                            'project-dir "~/dev/aclaimant/acl")))

;; ;;Clojure LSP
(require 'lsp-clojure)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("bash" "-c" "clojure-lsp"))
                  :major-modes '(clojure-mode clojurec-mode clojurescript-mode)
                  :server-id 'clojure-lsp))
(add-to-list 'lsp-language-id-configuration '(clojure-mode . "clojure-mode"))
(setq lsp-enable-indentation nil)
(add-hook 'clojure-mode-hook #'lsp)
(add-hook 'clojurec-mode-hook #'lsp)
(add-hook 'clojurescript-mode-hook #'lsp)

;;Relative line numbers for quick & evil navigation
(setq display-line-numbers-type 'relative)

;;Funk that pink highlighter warning
(setq prelude-whitespace nil)

;;Rainbow delimiters for Clojure
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurec-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)

;;Quickly press j-j to exit INSERT MODE
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;Macro for wrangling loose parens
(fset 'staple
      (kmacro-lambda-form [?v ?0 ?x ?i ?\C-? escape] 0 "%d"))
(evil-set-register ?s [?v ?0 ?x ?i ?\C-? escape])

;;Macro for cider eval end of fn
(fset 'evalcider
      (kmacro-lambda-form [?A ?\C-x ?\C-e escape] 0 "%d"))
(evil-set-register ?e [?A ?\C-x ?\C-e escape])

;;Macro for quick buffer switching
(fset 'switcherooo
   (kmacro-lambda-form [?i ?\C-x ?b ?\C-m escape] 0 "%d"))

;;Clear REPL buffer
(add-hook 'cider-repl-mode-hook
          '(lambda () (define-key cider-repl-mode-map (kbd "C-c M-b")
                        'cider-repl-clear-buffer)))

;;Take me 2 Ur Leader *~*~*~* Space Is The Place
(setq evil-leader/leader "SPC")
(global-evil-leader-mode)

(evil-leader/set-key 
 ;;REMEMBER: don't start anything with "k"
 "k" 'kill-buffer-and-window

 ;; nerd commenter
 ";l" 'evilnc-comment-or-uncomment-lines
 ";n" 'evilnc-comment-or-uncomment-to-the-line
 ";c" 'evilnc-copy-and-comment-lines
 ";s" 'evilnc-comment-or-uncomment-paragraphs

 ;;clojure lsp
 "lcc" 'lsp-clojure-cycle-coll
 "lth" 'lsp-clojure-thread-first
 "ltt" 'lsp-clojure-thread-last
 "ltf" 'lsp-clojure-thread-first-all
 "ltl" 'lsp-clojure-thread-last-all
 "luw" 'lsp-clojure-unwind-thread
 "lua" 'lsp-clojure-unwind-all
 "lml" 'clojure-move-to-let
 "lzz" 'lsp-clojure-move-to-let ;;does not seem to work?
 "lil" 'lsp-clojure-introduce-let
 "lel" 'lsp-clojure-expand-let
 "lam" 'lsp-clojure-add-missing-libspec
 "lns" 'lsp-clojure-clean-ns
 "lcp" 'lsp-clojure-cycle-privacy
 "lis" 'lsp-clojure-inline-symbol
 
 ;;clojure convert
 "ccm" 'clojure-convert-collection-to-map
 "ccs" 'clojure-convert-collection-to-set
 "ccl" 'clojure-convert-collection-to-list
 "ccv" 'clojure-convert-collection-to-vector
 "cc\'" 'clojure-convert-collection-to-quoted-list
 
 ;; smartparens
 "," 'sp-backward-up-sexp
 "." 'sp-up-sexp
 "[" 'sp-backward-slurp-sexp
 "]" 'sp-backward-barf-sexp
 "s(" 'sp-wrap-round
 "s[" 'sp-wrap-square
 "s{" 'sp-wrap-curly

 ;;cider
 "cj" 'cider-jack-in-clj
 "cw" 'cider-jack-in-cljs
 "ca" 'cider-jack-in-clj&cljs
 
 ;;quickies
 "mg" 'magit-status
 "ms" 'staple
 "me" 'evalcider
 "mc" 'simpleclip-copy   ;;copy to macOS clipboard

 ;;navigation
 "o" 'ace-window
 "0" 'delete-window
 "1" 'delete-other-windows
 "2" 'split-window-below
 "3" 'split-window-right
 "bb" 'ivy-switch-buffer
 "bo" 'switcherooo       ;;switch btw current & last buffer
 )

