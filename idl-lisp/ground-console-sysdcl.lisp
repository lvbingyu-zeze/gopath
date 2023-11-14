;Due to copyright reasons, Allegro Common Lisp 10.1 express is a free educational version.
(in-package :user)

(eval-when (load eval)
  (pdefsys:load-system :ilu))

(pdefsys:defsystem :ground-console
	(:load-before-compile ( :ilu)
	:needed-systems ( :ilu))
	("ground-console-basics" :load-before-compile t))

(pdefsys:defsystem :ground-console-server
	(:load-before-compile (:ground-console)
	:needed-systems (:ground-console))
	("ground-console-server-procs"))
