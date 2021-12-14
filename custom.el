(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages
   '(evil-collection html-to-hiccup simpleclip clojure-essential-ref clojure-essential-ref-nov markdown-mode flycheck-clojure flycheck-pos-tip php-mode helm-projectile helm-ag gnu-elpa-keyring-update helm wakatime-mode go-mode lua-mode csharp-mode csproj-mode dockerfile-mode csv-mode yaml-mode web-mode cider clojure-mode key-chord geiser lsp-ui company-lsp json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq nrepl-force-ssh-for-remote-hosts t)

(setq cider-repl-display-help-banner nil)


;;quickly press j-j to exit INSERT MODE
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;macro for wrangling loose parens
(fset 'staple
   (kmacro-lambda-form [?v ?0 ?x ?i ?\C-? escape] 0 "%d"))
(evil-set-register ?s [?v ?0 ?x ?i ?\C-? escape])

;;macro for cider eval end of fn
(fset 'evalcider
   (kmacro-lambda-form [?A ?\C-x ?\C-e escape] 0 "%d"))
(evil-set-register ?e [?A ?\C-x ?\C-e escape])


(defun my-update-env (fn)
  (let ((str
         (with-temp-buffer
           (insert-file-contents fn)
           (buffer-string))) lst)
    (setq lst (split-string str "\000"))
    (while lst
      (setq cur (car lst))
      (when (string-match "^\\(.*?\\)=\\(.*\\)" cur)
        (setq var (match-string 1 cur))
        (setq value (match-string 2 cur))
        (setenv var value))
      (setq lst (cdr lst)))))

;;(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'cider-repl-mode-hook
      '(lambda () (define-key cider-repl-mode-map (kbd "C-c M-b")
            'cider-repl-clear-buffer)))

(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;;(with-eval-after-load 'flycheck
;;  (flycheck-pos-tip-mode))

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "C-c C-g") 'simpleclip-copy)
(global-set-key (kbd "M-p") 'simpleclip-paste)
(global-set-key (kbd "C-c C-j") 'cider-jack-in-clj&cljs)
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

;;color formatting for .mjs files
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . web-mode))
