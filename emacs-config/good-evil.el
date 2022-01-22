;;;;EVIL FUNCTIONS & KEYBINDINGS

;;Quickly Press jj To Exit INSERT MODE
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;Macro For Copying The Whole Buffer
(fset 'simple-clip-select-all-copy
   (kmacro-lambda-form [?  ?x ?a ?  ?x ?c escape] 0 "%d"))

;;Marcro For Copy Until End of Line
(fset 'copy-up-to-end-of-line
   (kmacro-lambda-form [?y ?$] 0 "%d"))

;;Macro For Quick Buffer Switching
(fset 'switcheroo
      (kmacro-lambda-form [?i ?\C-x ?b ?\C-m escape] 0 "%d"))

;;Macro For Wrangling Parens
(fset 'the-ultimate-stapler
   (kmacro-lambda-form [?k ?J] 0 "%d"))

;;Macro For Killing Inside Parens
(fset 'kill-inside-parens
   (kmacro-lambda-form [?v ?% ?x ?i ?\( escape] 0 "%d"))

;;Macro For Killing Outside Parens
(fset 'kill-outside-parens
   (kmacro-lambda-form [?v ?% ?x] 0 "%d"))

;; ACLAIMANT TESTING MACROS
;;
;;Macro for using transaction fn, fully qualified name included
(fset 'schema-fn-fq
   (kmacro-lambda-form [?i ?\( ?c backspace ?a ?c ?l ?a ?i ?m ?a
   ?n ?t ?. ?c backspace ?s ?e ?r ?v ?i ?c ?e ?s ?. ?c ?o ?r ?e
   ?. ?d ?b ?. ?c ?u ?s ?t ?o ?m ?e ?r ?- ?s ?c ?h ?e ?m ?a
   ?. ?f ?n ?s ?/ ?t ?r ?a ?n ?s ?a ?c ?t ?i ?o ?n ?- ?i ?n ?- ?s
   ?c ?h ?e ?m ?a ?  ?\" ?s ?c ?h ?e ?m ?a ?\C-f ?  ?\( escape]
   0 "%d"))

;;Macro for using transaction fn, UNQUALIFIED 
(fset 'schema-fn-uq
   (kmacro-lambda-form [?i ?\( ?c ?u ?s ?t ?o ?m ?e ?r ?- ?s ?c
   ?h ?e ?m ?a ?. ?f ?n ?s ?/ ?t ?r ?a ?n ?s ?a ?c ?t ?i ?o ?n ?-
   ?i ?n ?- ?s ?c ?h ?e ?m ?a ?  ?\" ?s ?c ?h ?e ?m ?a ?\C-f ?
   ?\( escape] 0 "%d"))

;;Macros For Assigning Incoming Data to a Symbol
(fset 'def-incoming-data-clean
   (kmacro-lambda-form [?  ?w ?\[ ?i ?& ?  escape ?l ?% ?i ?  ?:
   ?a ?s ?  ?a ?r ?g ?s escape ?o ?\( ?d ?e ?f ?  ?i ?n ?c ?o ?m
   ?i ?n ?g ?- ?d ?a ?t ?a ?- ?1 ?  ?a ?r ?g ?s escape] 0 "%d"))

(fset 'undo-incoming-data-def
   (kmacro-lambda-form [?l ?\M-s ?x ?x ?% ?i backspace backspace
   backspace backspace backspace backspace backspace backspace
   backspace ?j backspace escape ?j ?V ?x] 0 "%d"))

(fset 'comment-playgrnd
   (kmacro-lambda-form [?  ?x ?l ?O ?\( ?c ?o ?m ?m ?e ?n ?t
   return return escape up ?i tab ?\( ?d ?e ?c ?l ?a ?r ?e ?  ?i
   ?n ?c ?o ?m ?i ?n ?g ?- ?d ?a ?t ?a ?- ?1 ?\C-f return ?\( ?d
   ?e ?c ?l ?a ?r ?e escape ?a ?i backspace ?  ?j ?j backspace
   backspace escape ?p escape ?o return ?\( ?a ?p ?p ?l ?y
   backspace backspace backspace backspace backspace backspace ?p
   backspace ?\( ?c ?l ?o ?j ?u ?r ?e ?. ?p ?p ?r ?i ?n ?t ?/ ?p
   ?p ?r ?i ?n ?t ?  ?i ?n ?c ?o ?i backspace ?, ?i backspace
   backspace ?m ?i ?n ?g ?- ?d ?a ?t ?a ?- ?1 ?j ?j backspace
   backspace escape ?o ?\( ?a ?p ?p ?l ?y ?  ?j ?j backspace
   backspace escape right ?p ?u left ?p right ?i ?  ?i ?n ?c ?o
   ?m ?i ?n ?g ?- ?d ?a ?t ?a ?- ?1 escape ?j ?O escape ?u ?j ?O
   escape] 0 "%d"))


;;Clear REPL Buffer
(add-hook 'cider-repl-mode-hook
          '(lambda () (define-key cider-repl-mode-map (kbd "C-c M-b")
                        'cider-repl-clear-buffer)))

;;Parens Navigation Functions
;;TODO: make one dynamic fn that takes in a list
;;      of function names and paren types: #{[] {} ()}
(defun move-forward-paren (&optional arg)
  "Move forward parenthesis"
  (interactive "P")
  (if (looking-at ")") (forward-char 1))
  (while (not (looking-at ")")) (forward-char 1)))

(defun move-backward-paren (&optional arg)
  "Move backward parenthesis"
  (interactive "P")
  (if (looking-at "(") (forward-char -1))
  (while (not (looking-at "(")) (backward-char 1)))

(defun move-forward-sqrParen (&optional arg)
  "Move forward square brackets"
  (interactive "P")
  (if (looking-at "]") (forward-char 1))
  (while (not (looking-at "]")) (forward-char 1)))

(defun move-backward-sqrParen (&optional arg)
  "Move backward square brackets"
  (interactive "P")
  (if (looking-at "[[]") (forward-char -1))
  (while (not (looking-at "[[]")) (backward-char 1)))

(defun move-forward-curlyParen (&optional arg)
  "Move forward curly brackets"
  (interactive "P")
  (if (looking-at "}") (forward-char 1))
  (while (not (looking-at "}")) (forward-char 1)))

(defun move-backward-curlyParen (&optional arg)
  "Move backward curly brackets"
  (interactive "P")
  (if (looking-at "{") (forward-char -1))
  (while (not (looking-at "{")) (backward-char 1)))

;;Miniature Custom Spacemacs Configuration
(setq evil-leader/leader "SPC")
(global-evil-leader-mode)

(evil-leader/set-key

  ;;Evaluate this buffer, and update emacs
  "eb" 'eval-buffer
  
 ;;Navigation
 "o"  'ace-window        ;;other window
 "0"  'delete-window
 "1"  'delete-other-windows
 "2"  'split-window-below
 "3"  'split-window-right
 "8"  'evil-jump-backward
 "9"  'switcheroo       ;;Switch btw current & last buffer
 "mx" 'counsel-M-x
 "s"  'save-some-buffers
 "b"  'ivy-switch-buffer ;;switch Buffer
 "f"  'counsel-find-file ;;switch File (in current directory)
 ","  'move-backward-paren
 "."  'move-forward-paren
 "["  'move-backward-sqrParen
 "]"  'move-forward-sqrParen
 "{"  'move-backward-curlyParen
 "}"  'move-forward-curlyParen

 ;;Great Shit That I Need So Much
 "r" 'backward-kill-word
 "j" 'the-ultimate-stapler

 ;;Search and Go-To
 "gf" 'projectile-find-file ;;Search Files
 "gg" 'projectile-grep      ;;Search git directory Grep
 "gd" 'lsp-find-definition  ;;Go to Definition
 "gr" 'lsp-find-references  ;;Go to References

 ;;Nerd Commenter
 ";l" 'evilnc-comment-or-uncomment-lines        ;;Line
 ";c" 'evilnc-copy-and-comment-lines            ;;Comment
 ";s" 'evilnc-comment-or-uncomment-paragraphs   ;;Section

 ;;Clojure Shortcuts - "l" for "lsp"
 "lcc"  'lsp-clojure-cycle-coll
 "lth"  'lsp-clojure-thread-first
 "ltt"  'lsp-clojure-thread-last
 "ltf"  'lsp-clojure-thread-first-all
 "ltl"  'lsp-clojure-thread-last-all
 "lut"  'lsp-clojure-unwind-thread
 "lua"  'lsp-clojure-unwind-all
 "lml"  'lsp-clojure-move-to-let
 "lil"  'lsp-clojure-introduce-let
 "lel"  'lsp-clojure-expand-let
 "lam"  'lsp-clojure-add-missing-libspec
 "lns"  'lsp-clojure-clean-ns
 "lcp"  'lsp-clojure-cycle-privacy
 "lis"  'lsp-clojure-inline-symbol
 "lrn"  'lsp-rename  ;;ReName
 "lcm"  'clojure-convert-collection-to-map
 "lcs"  'clojure-convert-collection-to-set
 "lcl"  'clojure-convert-collection-to-list
 "lcv"  'clojure-convert-collection-to-vector
 "lc\'" 'clojure-convert-collection-to-quoted-list
 "ls"   'lsp-ui-doc-show
 "lh"   'lsp-ui-doc-hide

 ;;Paren Playground
 "(" 'sp-backward-slurp-sexp
 ")" 'sp-backward-barf-sexp
 "w(" 'sp-wrap-round
 "w[" 'sp-wrap-square
 "w{" 'sp-wrap-curly
 "ks" 'sp-kill-sexp
 "kb" 'sp-backward-kill-sexp
 "ki" 'kill-inside-parens
 "ko" 'kill-outside-parens
 "kr" 'raise-sexp

 ;;Cider
 "cj" 'cider-jack-in-clj                   ;;Cider ~J~ack in
 "cs" 'cider-jack-in-cljs                  ;;Cider jack in clojure~S~cript
 "ca" 'cider-jack-in-clj&cljs              ;;Cider jack in ~A~ll 
 "cb" 'cider-repl-clear-buffer             ;;Cider 'C'lear Buffer
 "ci" 'cider-eval-defun-at-point           ;;Cider evaluate expression from Inside s-exp
 "cr" 'cider-load-buffer                   ;;Cider Recompile buffer
 "ctr" 'cider-insert-last-sexp-in-repl     ;;Cider Copy s-exp into REPL
 "cc" 'cider-pprint-eval-defun-to-comment  ;;Add the result as a comment underneath
 "cn" 'cider-repl-set-ns                   ;;Fuzzy Find NS available
 "cq" 'cider-quit
 "cl" 'cider-eval-defun-at-point
 "cp" 'cider-pprint-eval-defun-at-point

 ;;Magit
 "mg" 'magit-status ;;opens Magit
 "mc" 'with-editor-finish ;;Close Magit Buffer, like after commit message is written
 "mb" 'magit-blame

 ;;Quick Copy Paste & Hacking
 "xa" 'mark-whole-buffer
 "xc" 'simpleclip-copy   ;;copy to macOS clipboard
 "xp" 'simpleclip-paste
 "xl" 'copy-up-to-end-of-line ;;equivalent to VIM's y$
 "xx" 'simple-clip-select-all-copy  ;;copy entire buffer

 ;;Formatting
 "xt" 'indent-region  ;;TAB section
 "xf" 'fill-paragraph ;;FORMAT long string

 ;;Aclaimant
 "as" 'aclaimant-jack-in-service
 "at" 'aclaimant-jack-in-twilio
 "ap" 'aclaimant-jack-in-paper-pusher
 "aj" 'aclaimant-jack-in-jobs
 "ad" 'aclaimant-jack-in-dashboard
 "aa" 'aclaimant-jack-in-alerter
 "ac" 'aclaimant-cider-connection
 ;;Aclaimant testing 
 "a-g"  'def-incoming-data-clean ;;{g}rab incoming data from request and assign it to a variable
 "a-u"  'undo-incoming-data-def
 "a-c"  'comment-playgrnd
 "a-sf" 'schema-fn-fq
 "a-su" 'schema-fn-uq

 ;;Evil Numbers
 "=" 'evil-numbers/inc-at-pt
 "-" 'evil-numbers/dec-at-pt 
 )

;;;end of good-evil.el
