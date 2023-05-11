(cl:defpackage :ground-vehicle-console-server
  (:use :common-lisp :ilu)
  (:export #:main))

(in-package :ground-vehicle-console-server)

(defvar gbbopen-id-distance nil)
(defvar gbbopen-id-battery nil)
(defvar gbbopen-id-position nil)
(defvar gbbopen-id-velocity nil)
(defvar gbbopen-id-camerap nil)
(defvar gbbopen-id-zc nil)
(defvar gbbopen-id-vel nil)
(defvar gbbopen-id-acc nil)
(defvar gbbopen-id-yawangle nil)
(defvar puwb (make-hash-table))
(defvar cp1 (make-hash-table))
(defvar cp2 (make-hash-table))
(defvar cp3 (make-hash-table))
(defvar zchash (make-hash-table))
(defvar vw (make-hash-table))
(defvar d (make-hash-table))
(defvar ya (make-hash-table))
(defvar sen (make-hash-table))
(defvar bat (make-hash-table))
(defvar velxyz (make-hash-table))
(defvar accxyz (make-hash-table))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  Ground-Console.Ground-Vehicle-Console
;;;
(defclass ground-vehicle-console-service (Ground-Console:Ground-Vehicle-Console.impl) ())
(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Distance ((self ground-vehicle-console-service) distance vehicleid)
	;(format t "start send ~a distance~%" vehicleid)
	;(format t "send ~a distance end~%" vehicleid)
    (format t "the ~a distance is ~a~%" vehicleid distance)
	(setf (gethash vehicleid d) distance)
)


(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Zc ((self ground-vehicle-console-service) zc vehicleid)
	;(format t "start send ~a zc~%" vehicleid)
	;(format t "send ~a zc end~%" vehicleid)
    (format t "the ~a zc is ~a~%" vehicleid zc)
	(setf (gethash vehicleid zchash) zc)
)


(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Battery ((self ground-vehicle-console-service) battery vehicleid)
	;(format t "start send ~a battery~%" vehicleid)
	;(format t "send ~a battery end~%" vehicleid)
    (format t "the ~a battery is ~a~%" vehicleid battery)
	(setf (gethash vehicleid bat) battery)
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Sensor ((self ground-vehicle-console-service) sensor vehicleid)
	;(format t "start send ~a sensor~%" vehicleid)
	;(format t "send ~a sensor end~%" vehicleid)
    (format t "the ~a sensor is ~a~%" vehicleid sensor)
	(setf (gethash vehicleid sen) sensor)
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Yawangle ((self ground-vehicle-console-service) yawangle vehicleid)
	;(format t "start send ~a yawangle~%" vehicleid)
	;(format t "send ~a yawangle end~%" vehicleid)
    (format t "the ~a yawangle is ~a~%" vehicleid yawangle)
	(setf (gethash vehicleid ya) yawangle)
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Position ((self ground-vehicle-console-service) position vehicleid)
	;(format t "start send ~a position~%" vehicleid)
	;(format t "send ~a position end~%" vehicleid)
    (format t "the ~a position is ~a~%" vehicleid position)
	(setf (gethash vehicleid puwb) (list (Ground-Console:position-info-x position) 
									     (Ground-Console:position-info-y position)
									     (Ground-Console:position-info-z position)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Camerap ((self ground-vehicle-console-service) camerap vehicleid)
	;(format t "start send ~a Camerap~%" vehicleid)
	;(format t "send ~a Camerap end~%" vehicleid)
    (format t "the ~a Camerap is ~a~%" vehicleid camerap)
	(setf (gethash vehicleid cp1) (list (Ground-Console:camerap-info-x camerap) 
									    (Ground-Console:camerap-info-y camerap)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Camerapzc ((self ground-vehicle-console-service) camerapzc vehicleid)
	;(format t "start send ~a Camerapzc~%" vehicleid)
	;(format t "send ~a Camerapzc end~%" vehicleid)
    (format t "the ~a Camerapzc is ~a~%" vehicleid camerapzc)
	(setf (gethash vehicleid cp2) (list (Ground-Console:camerapzc-info-x camerapzc) 
									    (Ground-Console:camerapzc-info-y camerapzc)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Camerapfu ((self ground-vehicle-console-service) camerapfu vehicleid)
	;(format t "start send ~a Camerapfu~%" vehicleid)
	;(format t "send ~a Camerapfu end~%" vehicleid)
    (format t "the ~a Camerapfu is ~a~%" vehicleid camerapfu)
	(setf (gethash vehicleid cp3) (list (Ground-Console:camerapfu-info-x camerapfu) 
									    (Ground-Console:camerapfu-info-y camerapfu)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Vel ((self ground-vehicle-console-service) vel vehicleid)
	;(format t "start send ~a vel~%" vehicleid)
	;(format t "send ~a vel end~%" vehicleid)
    (format t "the ~a vel is ~a~%" vehicleid vel)
	(setf (gethash vehicleid velxyz) (list (Ground-Console:vel-info-x vel) 
									       (Ground-Console:vel-info-y vel)
									       (Ground-Console:vel-info-z vel)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Acc ((self ground-vehicle-console-service) acc vehicleid)
	;(format t "start send ~a acc~%" vehicleid)
	;(format t "send ~a acc end~%" vehicleid)
    (format t "the ~a acc is ~a~%" vehicleid acc)
	(setf (gethash vehicleid accxyz) (list (Ground-Console:acc-info-x acc) 
									       (Ground-Console:acc-info-y acc)
									       (Ground-Console:acc-info-z acc)))
)

(defmethod Ground-Console:Ground-Vehicle-Console.send-Current-Velocity ((self ground-vehicle-console-service) velocity vehicleid)
	;(format t "start send ~a velocity~%" vehicleid)
	;(format t "send ~a velocity end~%" vehicleid)
    (format t "the ~a velocity is ~a~%" vehicleid velocity)
	(setf (gethash vehicleid vw) velocity)
)
(defun main ()
	(let*  	((theServer (make-instance 'ilu:kernel-server 
                                               :id "rikirobotVehicleConsole"
                                               ;:transport '("tcp_127.0.0.1_9977"))) ;local
											   :transport '("tcp_192.168.0.199_9977")));windows
											   ;:transport '("tcp_192.168.0.103_9977")));ubuntu
			 (theObject (make-instance 'ground-vehicle-console-service
					       :ilu-kernel-server theServer
					       :ilu-instance-handle "vehicle")))
			(format t "ground console server is ~a~%" (ilu:string-binding-handle theObject))
		theObject
	)
)
;start define console-server
;------------------------------------------------------------------------------------------
(sleep 6)
(cl:in-package :user)
(defvar sbh1 "ilusbh:rikirobotvehicle/vehicle;IDL%3AGround_Unit%2FGround_Vehicle%3A1.0;iiop@tcp_192.168.0.154_9900");ubuntu
(defvar sbh2 "ilusbh:rikirobotvehicle2/vehicle;IDL%3AGround_Unit%2FGround_Vehicle%3A1.0;iiop@tcp_192.168.0.151_9900");ubuntu
(defvar server1 (ilu:sbh->instance 'Ground-Unit:Ground-Vehicle sbh1))
(defvar server2 (ilu:sbh->instance 'Ground-Unit:Ground-Vehicle sbh2))
;start define unit-client


(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package ':gbbopen-ground-console-server-unit-client-package)
    (make-package ':gbbopen-ground-console-server-unit-client-package
                  :use '(:common-lisp :module-manager :portable-threads
                         :gbbopen-tools :gbbopen :agenda-shell))))

(in-package :gbbopen-ground-console-server-unit-client-package)
;------------------------------------------------------------------

(define-unit-class console () (fire-lst v-q formation-tag
							   d-error
							   p-error
							   w-uwb w-cp1 w-cp2 w-cp3))
(define-unit-class vehicle () (id 
							   p p-lst 
							   tp tp-lst tp-index 
							   d 
							   pv 
							   ground-truth ground-truth-lst 
							   fs 
							   r 
							   s
							   vw 
							   ya
							   battery 
							   acc vel
							   puwb puwb-lst 
							   cp1 cp1-lst 
							   cp2 cp2-lst 
							   cp3 cp3-lst 
							   sensor zc 
							   a-v p-v 
							   update-info
							   d-f))

;--------------------------------------------------------------------------------------------

(defun get-destination-list ()
	(format t "Please enter destination list!~%")
	(setf destination-lst (read))
    (unless (listp destination-lst)
            (get-destination-list))
    destination-lst
)

;---------------------------------------------------------------------

(defun qqqq (z v w time)
	(if (> (+ z w) 0)
		(progn
			(setf x (* v time (sin (+ z w))))
			(setf y (* v time (cos (+ z w))))
		)
		(progn
			(setf x (* v time (sin (+ 360 (+ z w)))))
			(setf y (* v time (cos (+ 360 (+ z w)))))
		)
	)
	(list x y)
)
;=-----------------------------------------------------------------------------------------------------
(defun square (x)
	(* x x)
)
;===========================================================
(defun kalman-one (val fusion-val Accumulated_Error)
	(if (> (/ (abs (- (car val) (car fusion-val))) SCOPE) 0.25)
        (setf Old_Input_x (+ (* (car val) 0.382) (* (car fusion-val) 0.618)))
        (setf Old_Input_x (car fusion-val))
	) 
	(if (> (/ (abs (- (cadr val) (cadr fusion-val))) SCOPE) 0.25)
        (setf Old_Input_y (+ (* (cadr val) 0.382) (* (cadr fusion-val) 0.618)))
        (setf Old_Input_y (cadr fusion-val))
	)
	(setf Old_Error_All_x (sqrt (+ (square (car Accumulated_Error)) (square 0.00002))))
	(setf H_x (/ (square Old_Error_All_x) (+ (square Old_Error_All_x) (square 0.1))))
	(setf fusion_val_x (+ Old_Input_x (* H_x (- (car val) Old_Input_x))))
	(setf Accumulated_Error_x (sqrt (* (- 1 H_x) (square Old_Error_All_x))))
	(setf Old_Error_All_y (sqrt (+ (square (cadr Accumulated_Error)) (square 0.00001))))
	(setf H_y (/ (square Old_Error_All_y) (+ (square Old_Error_All_y) (square 0.14))))
	(setf fusion_val_y (+ Old_Input_y (* H_x (- (cadr val) Old_Input_y))))
	(setf Accumulated_Error_y (sqrt (* (- 1 H_x) (square Old_Error_All_y))))
	
	(list (list fusion_val_x fusion_val_y) (list fusion_val_x fusion_val_y) (list Accumulated_Error_x Accumulated_Error_y))
)
;---------------------------------------------------------------------------------
(defun kalman-two (all-value all-error all-estimate-value)

	(setf all-error-old-x (sqrt (+ (square (car all-error)) (square 0.00003))))
	(setf K-x (/ (square all-error-old-x) (+ (square all-error-old-x) (square 0.09))))
	(setf fusion-x (+ (car all-estimate-value) (* K-x (- (car all-value) (car all-estimate-value)))))
	
	
	(setf all-error-old-y (sqrt (+ (square (cadr all-error)) (square 0.000014))))
	(setf K-y (/ (square all-error-old-y) (+ (square all-error-old-y) (square 0.11))))
	(setf fusion-y (+ (cadr all-estimate-value) (* K-y (- (cadr all-value) (cadr all-estimate-value)))))
	
	(list fusion-x fusion-y)
)

;---------------------------------------------------------------------------------------------

(defun get-instances-position ()
	(let ((p-y nil))
		(dolist (i (find-instances-of-class 'vehicle))
			(if (gethash (id-of i) (symbol-value-in-thread 'ground-vehicle-console-server::puwb *thread-console-server*))
				(push t p-y)
				(push nil p-y)
			)
		)
		(unless (eval (append (list 'and) p-y))
			(sleep 0.5)
			(get-instances-position)
		)
	)
)

;--------------------------------------------------------

(defun get-console-server ()
	(ground-vehicle-console-server::main)
)

;------------------------------------------------------

(defun judge-con1 (norm-con) 
	(let ((result nil))
		(dolist (i norm-con)
			(if (and (eval (nth 1 i)) (eval (nth 2 i)))
				(progn
					(if (eval i)
						(push t result)
						(progn (push nil result) (push nil result))
					)
				)
				(progn (push nil result) (push nil result))
			)
		)
		result
	)
)


;---------------------------------------------------

(defun distance (start end)
	(let ((x (car start))
		  (y (cadr start))
		  (x-destination-list (car end))
		  (y-destination-list (cadr end))
		 ) 
		(sqrt (+ (* (- x x-destination-list) 
					(- x x-destination-list)) 
				 (* (- y y-destination-list) 
					(- y y-destination-list))))))

;--------------------------------------------------------------------------------------------

(defun get-vehicle-queue (vehicle-list)
	(let ((distance-s nil))
		(dolist (i (find-instances-of-class 'vehicle))
			(push (list (distance (list (car (puwb-of i)) 
										(cadr (puwb-of i)))
								   (car (fire-lst-of console)))
						i) 
				  distance-s)
		)
		(mapcar #'cadr (sort (copy-list distance-s) #'< :key #'car))
    )
)


;-----------------------------------------------------------------------------------------

(defun create-vehicles-function (ksa)
	(declare (ignore ksa))
	(sleep 10)
	(setf console (make-instance 'console   :fire-lst (get-destination-list)
											:formation-tag 1
											:v-q nil
											:d-error nil
											:p-error nil
											:w-uwb nil
											:w-cp1 nil
											:w-cp2 nil
											:w-cp3 nil))
	(dotimes (i 2)
		(make-instance 'vehicle :id (+ i 1)
								:d nil
								:p nil 	
								:p-lst nil
								:pv 0.7
								:fs nil
								:r nil
								:p-v nil
								:a-v nil
								:tp-index 0
								:tp nil
								:tp-lst '()
								:sensor nil
								:zc nil
								:puwb nil
								:puwb-lst nil
								:cp1 nil
								:cp1-lst nil
								:cp2 nil 
								:cp2-lst nil
								:cp3 nil
								:cp3-lst nil
								:ground-truth nil
								:ground-truth-lst nil
								:s 'normal
								:vw nil 
							    :battery nil 
							    :acc nil
								:vel nil
								:d-f 0
		)
	)
	(get-instances-position)
	(dolist (i (find-instances-of-class 'vehicle))
		(setf (puwb-of i) (gethash (id-of i) (symbol-value-in-thread 'ground-vehicle-console-server::puwb *thread-console-server*)))
	)
	(do-instances-of-class (instance 'vehicle)
        (describe-instance instance))
	(setf (ground-truth-of (find-instance-by-name 1 'vehicle)) '(5 1.8))
	(setf (ground-truth-of (find-instance-by-name 2 'vehicle)) '(6 1.8))
)

(define-ks create-vehicles-ks
	:trigger-events ((control-shell-started-event))
	:execution-function 'create-vehicles-function
)

;----------------------------------------------------------
(defun formation-precondition-function (ks event)
	(declare (ignore ks event))
	(setf formation-pre '((= formation-tag formation-tag-v)))
	(setf item (sole-trigger-instance-of event))
	(setf formation-tag-v 1)
	(setf formation-tag (formation-tag-of item))
	(setf pre-result (judge-con1 formation-pre))
	(if (eval (append (list 'and) pre-result))
		(progn 
			(setf (formation-tag-of item) 0) 
			9999
		) 
		nil
	)
)


(defun formation-function (ksa)
	(declare (ignore ksa))
	(setf (v-q-of (sole-trigger-instance-of ksa)) (get-vehicle-queue (find-instances-of-class 'vehicle)))
	(if (= (length (v-q-of (sole-trigger-instance-of ksa))) 1)
		(progn
			(setf (r-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 'leader)
			(setf (tp-lst-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (fire-lst-of console))
			(setf (a-v-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (+ i 1))
			(setf (update-info-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 1)
		)
		(dotimes (i (length (v-q-of (sole-trigger-instance-of ksa))))
			(cond 
				((= i 0)	
					(progn	(setf (r-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 'leader)
							(setf (tp-lst-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (fire-lst-of console))
							(setf (a-v-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (id-of (nth (+ i 1) (v-q-of (sole-trigger-instance-of ksa)))))
							(setf (update-info-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 1)
					)
				)
				((< 0 i (- (length (v-q-of (sole-trigger-instance-of ksa))) 1))
					(progn
						(setf (p-v-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (id-of (nth (- i 1) (v-q-of (sole-trigger-instance-of ksa)))))
						(setf (a-v-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (id-of (nth (+ i 1) (v-q-of (sole-trigger-instance-of ksa)))))
						(setf (r-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 'follower)
						(setf (update-info-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 1)
					)
				)
				((= i (- (length (v-q-of (sole-trigger-instance-of ksa))) 1))
					(progn
						(setf (p-v-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) (id-of (nth (- i 1) (v-q-of (sole-trigger-instance-of ksa)))))
						(setf (r-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 'follower)
						(setf (update-info-of (nth i (v-q-of (sole-trigger-instance-of ksa)))) 1)
					)
				)
			)
		)
	)
	(do-instances-of-class (instance 'vehicle)
        (describe-instance instance))
	(setf start-time (get-universal-time))
)

(define-ks formation-ks
	:trigger-events ((nonlink-slot-updated-event console :slot-name v-q))
	:precondition-function 'formation-precondition-function
	:execution-function 'formation-function
)

;----------------------------------------------------------------------------------------------

(defun run-precondition-function (ks event)
	(declare (ignore ks event))
	(setf run-pre '((> distance precision)))
	(setf item (sole-trigger-instance-of event))
	(setf distance (d-of item))
	(setf precision (pv-of item))
	(setf pre-result (judge-con1 run-pre))
	(if (eval (append (list 'and) pre-result))
		1 nil
	)	
)
(defun run-function (ksa)
	(declare (ignore ksa))

	(format t "run ~S~%" (sole-trigger-instance-of ksa))
	(if (tp-of (sole-trigger-instance-of ksa))
		(progn
			(if (= 1 (id-of (sole-trigger-instance-of ksa)))
				(progn
					(setf user::velocity1 (Ground-Unit:make-velocity-info :v (float 0) 
																		  :w (float 0)))
					(setf user::velocitytag1 nil)
					(let ((response1 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server1 user::velocity1 user::velocitytag1)))
						;(format t "~a~%" response1)
						)
				)
			)
			(if (= 2 (id-of (sole-trigger-instance-of ksa)))
				(progn
					(setf user::velocity2 (Ground-Unit:make-velocity-info :v (float 0) 
																		  :w (float 0)))
					(setf user::velocitytag2 nil)
					(let ((response2 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server2 user::velocity2 user::velocitytag2)))
						;(format t "~a~%" response2)
						)
				)
			)
		)
	)
)

(defun run-postcondition-function(ksa)
	(declare (ignore ksa))
	(format t "run post~S~%" (sole-trigger-instance-of ksa))
	(setf run-distance  (qqqq   (nth 2 (puwb-of (sole-trigger-instance-of ksa)))
								(car (vel-of (sole-trigger-instance-of ksa)))
								(cadr (vel-of (sole-trigger-instance-of ksa)))
								start-end-time
						)
	)
	(setf truth-position (list 	(- (car (ground-truth-of (sole-trigger-instance-of ksa))) (car run-distance))
								(- (cadr (ground-truth-of (sole-trigger-instance-of ksa)))) (cadr run-distance))
	
	)
	(if (puwb-of (sole-trigger-instance-of ksa))
		(progn 
			(setf d-error-uwb (distance  (list (car (puwb-of (sole-trigger-instance-of ksa)))
											   (cadr (puwb-of (sole-trigger-instance-of ksa)))
										 )
										 run-distance
							  )
			)
			(pushnew d-error-uwb (d-error-of console))
			(setf d-error-queue  (sort (copy-list (d-error-of console)) #'>))
			(if (> (length (d-error-of console)) 1)
				(setf (p-error-of console) (nth (ceiling (* 0.2 (length (d-error-of console))))  d-error-queue))
				(setf (p-error-of console) (nth 0 (d-error-of console)))
			)
			(if (<= d-error-uwb (p-error-of console))
				(progn (setf w-uwb-count (incf w-uwb-count)) (setf judge-fusion-uwb 1))
				(progn (setf w-uwb-count (decf w-uwb-count)) (setf judge-fusion-uwb 1))
			)
		)
	)
	(if (a-v-of (sole-trigger-instance-of ksa))
		(progn
			(if (cp1-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
				(progn 
					(setf camerap1  (list (+ (car (cp1-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (- (car (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) 1.031636364))
										  (+ (cadr (cp1-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (cadr (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))))
									)
					)
					(setf d-error-cp1 (distance camerap1 run-distance))
					(pushnew d-error-cp1 (d-error-of console))
					(setf d-error-queue (sort (copy-list (d-error-of console)) #'>))
					(if (> (length (d-error-of console)) 1)
						(setf (p-error-of console) (nth (ceiling (* 0.2 (length (d-error-of console)))) d-error-queue))
						(setf (p-error-of console) (nth 0 (d-error-of console)))
					)
					(if (<= d-error-cp1 (p-error-of console))
						(progn (setf w-cp1-count (incf w-cp1-count)) (setf judge-fusion-cp1 1))
						(progn (setf w-cp1-count (decf w-cp1-count)) (setf judge-fusion-cp1 1))
					)
				)
			)
			(if (cp2-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
				(progn 
					(setf camerap2  (list (+ (car (cp2-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (- (car (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) 1.031636364))
										  (+ (cadr (cp2-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (cadr (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))))
									)
					)
					(setf d-error-cp2 (distance camerap2 run-distance))
					(pushnew d-error-cp2 (d-error-of console))
					(setf d-error-queue (sort (copy-list (d-error-of console)) #'>))
					(if (> (length (d-error-of console)) 1)
						(setf (p-error-of console) (nth (ceiling (* 0.2 (length (d-error-of console)))) d-error-queue))
						(setf (p-error-of console) (nth 0 (d-error-of console)))
					)
					(if (<= d-error-cp2 (p-error-of console))
						(progn (setf w-cp2-count (incf w-cp2-count)) (setf judge-fusion-cp2 1))
						(progn (setf w-cp2-count (decf w-cp2-count)) (setf judge-fusion-cp2 1))
					)
				)
			)
			(if (cp3-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
				(progn 
					(setf camerap3  (list (+ (car (cp3-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (- (car (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) 1.031636364))
										  (+ (cadr (cp3-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))) (cadr (puwb-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))))
									)
					)
					(setf d-error-cp3 (distance camerap3 run-distance))
					(pushnew d-error-cp3 (d-error-of console))
					(setf d-error-queue (sort (copy-list (d-error-of console)) #'>))
					(if (> (length (d-error-of console)) 1)
						(setf (p-error-of console) (nth (ceiling (* 0.2 (length (d-error-of console)))) d-error-queue))
						(setf (p-error-of console) (nth 0 (d-error-of console)))
					)
					(if (<= d-error-cp3 (p-error-of console))
						(progn (setf w-cp3-count (incf w-cp3-count)) (setf judge-fusion-cp3 1))
						(progn (setf w-cp3-count (decf w-cp3-count)) (setf judge-fusion-cp3 1))
					)
				)
			)
			(setf (d-f-of (sole-trigger-instance-of ksa)) 1)
		)
	)
	(setf w-lst-1 nil)
	(setf w-lst-1count nil)
	(setf w-lst (list (list 'uwb judge-fusion-uwb w-uwb-count) (list 'cp1 judge-fusion-cp1 w-cp1-count) (list 'cp2 judge-fusion-cp2 w-cp2-count) (list 'cp3 judge-fusion-cp3 w-cp3-count)))
	(dolist (i w-lst)
		(if (= 1 (cadr i))
			(progn 
				(push i w-lst-1)
				(push (nth 2 i) w-lst-1count)
			)
		)
	)
	(setf w-lst-1count (eval (append (list '+) w-lst-1count)))
	
	(dolist (i w-lst-1)
		(cond
			((eq (car i) 'uwb)
				(setf w-uwb (/ w-uwb-count w-lst-1count))
			)
			((eq (car i) 'cp1)
				(setf w-cp1 (/ w-cp1-count w-lst-1count))
			)
			((eq (car i) 'cp2)
				(setf w-cp2 (/ w-cp2-count w-lst-1count))
			)
			((eq (car i) 'cp3)
				(setf w-cp3 (/ w-cp3-count w-lst-1count))
			)
		)
	)
	(format t "w-lst ~S~%" w-lst)
	(format t "w-lst-1 ~S~%" w-lst-1)
	(describe-instance (sole-trigger-instance-of ksa))
)


(define-ks run-ks
	:precondition-function 'run-precondition-function
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name puwb))
	:execution-function 'run-function
	:postcondition-function 'run-postcondition-function
)


(defun decision-fusion-precondition-function (ks event)
	(declare (ignore ks event))
	(format t "(length w-lst-1) ~S~%" (length w-lst-1))
	(if (> (length w-lst-1) 1)
		9999
		nil
	)
)

(defun fusion-function (ksa)
	(declare (ignore ksa))
	(describe-instance (sole-trigger-instance-of ksa))
	
	(if (puwb-of (sole-trigger-instance-of ksa))
		(setf (gethash 'fusion-puwb fusion-parameter) (kalman-one   (list 
																		(car (puwb-of (sole-trigger-instance-of ksa)))
																		(cadr (puwb-of (sole-trigger-instance-of ksa)))
																	)
																	(nth 1 (gethash 'fusion-puwb fusion-parameter))
																	(nth 2 (gethash 'fusion-puwb fusion-parameter))))
	)
	(if (cp1-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
		(setf (gethash 'fusion-pcamera1 fusion-parameter) (kalman-one camerap1
																	(nth 1 (gethash 'fusion-pcamera1 fusion-parameter))
																	(nth 2 (gethash 'fusion-pcamera1 fusion-parameter))))
	)
	(if (cp2-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
		(setf (gethash 'fusion-pcamera2 fusion-parameter) (kalman-one camerap2
																	(nth 1 (gethash 'fusion-pcamera2 fusion-parameter))
																	(nth 2 (gethash 'fusion-pcamera2 fusion-parameter))))
	)
	(if (cp3-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle))
		(setf (gethash 'fusion-pcamera3 fusion-parameter) (kalman-one camerap3
																	(nth 1 (gethash 'fusion-pcamera3 fusion-parameter))
																	(nth 2 (gethash 'fusion-pcamera3 fusion-parameter))))
	)
	(setf all-value-x 0)
	(setf all-value-y 0)
	(setf all-error-x 0)
	(setf all-error-y 0)
	(setf all-estimate-value-x 0)
	(setf all-estimate-value-y 0)
	(dolist (i w-lst-1)
		(cond
			((eq (car i) 'uwb)
			  (progn	
				(setf all-value-x (+ all-value-x (* w-uwb (car (puwb-of (sole-trigger-instance-of ksa))))))
				(setf all-value-y (+ all-value-y (* w-uwb (cadr (puwb-of (sole-trigger-instance-of ksa))))))
				(setf all-error-x (+ all-error-x (car (nth 2 (gethash 'fusion-puwb fusion-parameter)))))
				(setf all-error-y (+ all-error-y (cadr (nth 2 (gethash 'fusion-puwb fusion-parameter)))))
				(setf all-estimate-value-x (+ all-estimate-value-x (car (nth 1 (gethash 'fusion-puwb fusion-parameter)))))
				(setf all-estimate-value-y (+ all-estimate-value-y (cadr (nth 1 (gethash 'fusion-puwb fusion-parameter)))))
			
			  )
			)
			((eq (car i) 'cp1)
			  (progn
				(setf all-value-x (+ all-value-x (* w-cp1 (car camerap1))))
				(setf all-value-y (+ all-value-y (* w-cp1 (cadr camerap1))))
				(setf all-error-x (+ all-error-x (car (nth 2 (gethash 'fusion-pcamera1 fusion-parameter)))))
				(setf all-error-y (+ all-error-y (cadr (nth 2 (gethash 'fusion-pcamera1 fusion-parameter)))))
				(setf all-estimate-value-x (+ all-estimate-value-x (car (nth 1 (gethash 'fusion-pcamera1 fusion-parameter)))))
				(setf all-estimate-value-y (+ all-estimate-value-y (cadr (nth 1 (gethash 'fusion-pcamera1 fusion-parameter)))))
			  )
			)
			((eq (car i) 'cp2)
			  (progn
				(setf all-value-x (+ all-value-x (* w-cp2 (car camerap2))))
				(setf all-value-y (+ all-value-y (* w-cp2 (cadr camerap2))))
				(setf all-error-x (+ all-error-x (car (nth 2 (gethash 'fusion-pcamera2 fusion-parameter)))))
				(setf all-error-y (+ all-error-y (cadr (nth 2 (gethash 'fusion-pcamera2 fusion-parameter)))))
				(setf all-estimate-value-x (+ all-estimate-value-x (car (nth 1 (gethash 'fusion-pcamera2 fusion-parameter)))))
				(setf all-estimate-value-y (+ all-estimate-value-y (cadr (nth 1 (gethash 'fusion-pcamera2 fusion-parameter)))))
			  )
			)
			((eq (car i) 'cp3)
			  (progn
				(setf all-value-x (+ all-value-x (* w-cp3 (car camerap3))))
				(setf all-value-y (+ all-value-y (* w-cp3 (cadr camerap3))))
				(setf all-error-x (+ all-error-x (car (nth 2 (gethash 'fusion-pcamera3 fusion-parameter)))))
				(setf all-error-y (+ all-error-y (cadr (nth 2 (gethash 'fusion-pcamera3 fusion-parameter)))))
				(setf all-estimate-value-x (+ all-estimate-value-x (car (nth 1 (gethash 'fusion-pcamera3 fusion-parameter)))))
				(setf all-estimate-value-y (+ all-estimate-value-y (cadr (nth 1 (gethash 'fusion-pcamera3 fusion-parameter)))))
			  )
			)
		)
	)
	
	(setf all-value (list all-value-x all-value-y))
	(setf all-error (list all-error-x all-error-y))
	(setf all-estimate-value (list all-estimate-value-x all-estimate-value-y))
	(setf (gethash 'fusion-puwb+pcamera-1 fusion-parameter) (kalman-two all-value all-error all-estimate-value))
	;-----------------------------------------------------------------------------------------------------------------------------------------																	
	(setf all-value-x2 0)
	(setf all-value-y2 0)
	(dolist (i w-lst-1)
		(cond
			((eq (car i) 'uwb)
			  (progn
				(setf all-value-x2 (+ all-value-x2 (car (puwb-of (sole-trigger-instance-of ksa)))))
				(setf all-value-y2 (+ all-value-y2 (cadr (puwb-of (sole-trigger-instance-of ksa)))))
			  )
			)
			((eq (car i) 'cp1)
			  (progn
				(setf all-value-x2 (+ all-value-x2 (car camerap1)))
				(setf all-value-y2 (+ all-value-y2 (cadr camerap1)))
			  )
			)
			((eq (car i) 'cp2)
			  (progn
				(setf all-value-x2 (+ all-value-x2 (car camerap2)))
				(setf all-value-y2 (+ all-value-y2 (cadr camerap2)))
			  )
			)
			((eq (car i) 'cp3)
			  (progn
				(setf all-value-x2 (+ all-value-x2 (car camerap3)))
				(setf all-value-y2 (+ all-value-y2 (cadr camerap3)))
			  )
			)
		)
	)
	(setf all-value-x2 (/ all-value-x2 (length w-lst-1)))
	(setf all-value-y2 (/ all-value-y2 (length w-lst-1)))
	(setf (gethash 'fusion-puwb+pcamera-2 fusion-parameter) (list  all-value-x2 all-value-y2))
	;-----------------------------------------------------------------------------------------------------------------------------------------
	(setf finally nil)
	(push (list (distance (gethash 'fusion-puwb+pcamera-1 fusion-parameter) (ground-truth-of (sole-trigger-instance-of ksa)))
				(gethash 'fusion-puwb+pcamera-1 fusion-parameter)) finally)
	(push (list (distance (gethash 'fusion-puwb+pcamera-2 fusion-parameter) (ground-truth-of (sole-trigger-instance-of ksa)))
				(gethash 'fusion-puwb+pcamera-2 fusion-parameter)) finally)
	(setf (gethash 'fusion-puwb+pcamera fusion-parameter) (car (mapcar #'cadr (sort (copy-list finally) #'< :key #'car))))
	;-----------------------------------------------------------------------------------------------------------------------------------------	
	
	(with-open-file 
		(stream "C:/Users/Seminar/Desktop/puwb+pcamera-fusion-2.csv" :if-exists :append :direction :output)
		(format stream "~S," (car (puwb-of (sole-trigger-instance-of ksa))))
		(format stream "~S," (cadr (puwb-of (sole-trigger-instance-of ksa))))
		(format stream "~S," (car (nth 2 (gethash 'fusion-puwb fusion-parameter))))
		(format stream "~S," (cadr (nth 2 (gethash 'fusion-puwb fusion-parameter))))
		
		(format stream "~S," (car camerap1))
		(format stream "~S," (cadr camerap1))
		(format stream "~S," (car (nth 2 (gethash 'fusion-pcamera1 fusion-parameter))))
		(format stream "~S," (cadr (nth 2 (gethash 'fusion-pcamera1 fusion-parameter))))
		
		(format stream "~S," (car camerap2))
		(format stream "~S," (cadr camerap2))
		(format stream "~S," (car (nth 2 (gethash 'fusion-pcamera2 fusion-parameter))))
		(format stream "~S," (cadr (nth 2 (gethash 'fusion-pcamera2 fusion-parameter))))
		
		(format stream "~S," (car camerap3))
		(format stream "~S," (cadr camerap3))
		(format stream "~S," (car (nth 2 (gethash 'fusion-pcamera3 fusion-parameter))))
		(format stream "~S," (cadr (nth 2 (gethash 'fusion-pcamera3 fusion-parameter))))
		
		(format stream "~S," (car (gethash 'fusion-puwb+pcamera-1 fusion-parameter)))
		(format stream "~S," (cadr (gethash 'fusion-puwb+pcamera-1 fusion-parameter)))
		(format stream "~S," (car (gethash 'fusion-puwb+pcamera-2 fusion-parameter)))
		(format stream "~S," (cadr (gethash 'fusion-puwb+pcamera-2 fusion-parameter)))
		(format stream "~S," (car (gethash 'fusion-puwb+pcamera fusion-parameter))) 
		(format stream "~S," (cadr (gethash 'fusion-puwb+pcamera fusion-parameter))) 
		
		(format stream "~S," w-uwb-count)
		(format stream "~S," w-cp1-count)
		(format stream "~S," w-cp2-count)
		(format stream "~S," w-cp3-count)
		
		
		(format stream "~S," (float w-uwb))
		(format stream "~S," (float w-cp1))
		(format stream "~S," (float w-cp2))
		(format stream "~S," (float w-cp3))
		
		(format stream "~S," (car (ground-truth-of (sole-trigger-instance-of ksa))))
		(format stream "~S," (cadr (ground-truth-of (sole-trigger-instance-of ksa))))
		(format stream "~S," (p-error-of console))
		
		(format stream "~%")
	);end write file
	
	;-----------------------------------------------------------------------------------------------------------------------------------------	
	(setf (p-of (sole-trigger-instance-of ksa)) (gethash 'fusion-puwb+pcamera fusion-parameter))
	;-----------------------------------------------------------------------------------------------------------------------------------------	
)

(define-ks decision-fusion-ks
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name d-f))
	:precondition-function 'decision-fusion-precondition-function
	:execution-function 'fusion-function
)

;----------------------------------------------------------------------------------------------

(defun stop-precondition-function (ks event)
	(declare (ignore ks event))
	(setf stop-pre '((<= distance precision)))
	(setf item (sole-trigger-instance-of event))
	(setf distance (d-of item))
	(setf precision (pv-of item))
	(setf pre-result (judge-con1 stop-pre))
	(if (eval (append (list 'and) pre-result))
		2 nil
	)
)
(defun stop-function (ksa)
	(declare (ignore ksa))
	(format t "stop~S~%" (sole-trigger-instance-of ksa))
	(if (= 1 (id-of (sole-trigger-instance-of ksa)))
		(progn
			(setf user::velocity1 (Ground-Unit:make-velocity-info :v (float 0) 
																  :w (float 0)))
			(setf user::velocitytag1 t)
			(let ((response1 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server1 user::velocity1 user::velocitytag1)))
				;(format t "~a~%" response1)
				)
		)
	)
	(if (= 2 (id-of (sole-trigger-instance-of ksa)))
		(progn
			(setf user::velocity2 (Ground-Unit:make-velocity-info :v (float 0) 
																  :w (float 0)))
			(setf user::velocitytag2 t)
			(let ((response2 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server2 user::velocity2 user::velocitytag2)))
				;(format t "~a~%" response2)
				)
		)
	)
	(if (< (tp-index-of (sole-trigger-instance-of ksa)) (- (length (tp-lst-of (sole-trigger-instance-of ksa))) 1))	
		(progn
			(if (eq (r-of (sole-trigger-instance-of ksa)) 'leader) 
				(progn 
					(setf (fire-lst-of console) (remove (nth (tp-index-of (sole-trigger-instance-of ksa)) (tp-lst-of (sole-trigger-instance-of ksa))) (fire-lst-of console)))
				)
			)		
			(setf (tp-index-of (sole-trigger-instance-of ksa)) (+ (tp-index-of (sole-trigger-instance-of ksa)) 1))
		)
		(progn 
			(if (and (eq (r-of (sole-trigger-instance-of ksa)) 'leader)  (listp (fire-lst-of console)))
				(progn 
					(setf (fire-lst-of console) (remove (nth (tp-index-of (sole-trigger-instance-of ksa)) (tp-lst-of (sole-trigger-instance-of ksa))) (fire-lst-of console)))
					(setf demand-exit t)
				)
			)
		)
	)	
)

(define-ks stop-ks
	:precondition-function 'stop-precondition-function
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name puwb))
	:execution-function 'stop-function
	;:postcondition-function 'stop-postcondition-function
)

;--------------------------------------------------------------------------------------------

(defun fall-back-precondition-function (ks event)
	(declare (ignore ks event))
	(setf fall-back-pre '((<= distance fall-back-v)))
	(setf item (sole-trigger-instance-of event))
	(setf distance (d-of item))
	(setf fall-back-v 0.35)
	(setf pre-result (judge-con1 fall-back-pre))
	(if (eval (append (list 'and) pre-result))
		20000 nil
	)
)

(defun fall-back-function (ksa)
	(declare (ignore ksa))
	(format t "fall back ~S~%" (sole-trigger-instance-of ksa))
	(let ((item (sole-trigger-instance-of ksa)))
		(if (vw-of item)
			(cond ((= 1 (id-of item))
					(setf user::velocity1 (Ground-Unit:make-velocity-info :v (- (Ground-Console:velocity-info-v (vw-of item))) 
																		  :w (- (Ground-Console:velocity-info-w (vw-of item)))))
					(setf user::velocitytag1 t)
					(let ((response1 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server1 user::velocity1 user::velocitytag1)))
						;(format t "~a~%" response1)
						)
				  )
				  ((= 2 (id-of item))
						(setf user::velocity2 (Ground-Unit:make-velocity-info :v (- (Ground-Console:velocity-info-v (vw-of item))) 
																			  :w (- (Ground-Console:velocity-info-w (vw-of item)))))
						(setf user::velocitytag2 t)
						(let ((response2 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server2 user::velocity2 user::velocitytag2)))
							;(format t "~a~%" response2)
							)
				  )
			)
			(cond ((= 1 (id-of item))
					(setf user::velocity1 (Ground-Unit:make-velocity-info :v (float 0) 
																		  :w (float 0)))
					(setf user::velocitytag1 t)
					(let ((response1 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server1 user::velocity1 user::velocitytag1)))
						;(format t "~a~%" response1)
						)
				  )
				  ((= 2 (id-of item))
						(setf user::velocity2 (Ground-Unit:make-velocity-info :v (float 0) 
																			  :w (float 0)))
						(setf user::velocitytag2 t)
						(let ((response2 (Ground-Unit:Ground-Vehicle.set-current-velocity user::server2 user::velocity2 user::velocitytag2)))
							;(format t "~a~%" response2)
							)
				  )
			)
		)
	)
)


(define-ks fall-back-ks
	:precondition-function 'fall-back-precondition-function
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name puwb))
	:execution-function 'fall-back-function
	;:postcondition-function 'collide-postcondition-function
)

;------------------------------------------------------------------------------------------------

(defun judge-goal-follow-function1 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre1 '((eq r rv) (> distance 1)))
	(setf rv 'follower)
	(setf distance (d-of item))
	(setf pre-result (judge-con1 judge-goal-pre1))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(defun set-goal-follow-function (ksa)
	(declare (ignore ksa))
	(format t "goal ~S~%" (sole-trigger-instance-of ksa))
	(setf (fs-of (sole-trigger-instance-of ksa)) 'goal-following)
	(setf (tp-index-of (sole-trigger-instance-of ksa)) (- (length (tp-lst-of (sole-trigger-instance-of ksa))) 1))
	;(describe-instance (sole-trigger-instance-of ksa))
)

(define-ks judge-goal-follow-ks1
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name puwb))
	:precondition-function 'judge-goal-follow-function1
	:execution-function 'set-goal-follow-function
)
;------------------------------------------------------------------------------------------

(defun judge-goal-follow-function2 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre2 '((eq r rv) (> zc 4000)))
	(setf rv 'follower)
	(setf zc (zc-of item))
	(setf pre-result (judge-con1 judge-goal-pre2))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)


(define-ks judge-goal-follow-ks2
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name zc))
	:precondition-function 'judge-goal-follow-function2
	:execution-function 'set-goal-follow-function
)

;-------------------------------------------------------------------------------------------
(defun judge-goal-follow-function3 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre3 '((eq r rv) (> sensor 4000)))
	(setf rv 'follower)
	(setf sensor (sensor-of item))
	(setf pre-result (judge-con1 judge-goal-pre3))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(define-ks judge-goal-follow-ks3
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name sensor))
	:precondition-function 'judge-goal-follow-function3
	:execution-function 'set-goal-follow-function
)

;-----------------------------------------------------------------------------------------------

(defun judge-goal-follow-function4 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre4 '((eq r rv) (eq judge-fusion-cp1 1)))
	(setf rv 'follower)
	(setf pre-result (judge-con1 judge-goal-pre4))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(define-ks judge-goal-follow-ks4
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name cp1))
	:precondition-function 'judge-goal-follow-function4
	:execution-function 'set-goal-follow-function
)

;---------------------------------------------------------------------------------------------
(defun judge-goal-follow-function5 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre5 '((eq r rv) (eq judge-fusion-cp2 1)))
	(setf rv 'follower)
	(setf pre-result (judge-con1 judge-goal-pre5))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(define-ks judge-goal-follow-ks5
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name cp2))
	:precondition-function 'judge-goal-follow-function5
	:execution-function 'set-goal-follow-function
)
;----------------------------------------------------------------------------------------------------
(defun judge-goal-follow-function6 (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre6 '((eq r rv) (eq judge-fusion-cp3 1)))
	(setf rv 'follower)
	(setf pre-result (judge-con1 judge-goal-pre6))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(define-ks judge-goal-follow-ks6
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name cp3))
	:precondition-function 'judge-goal-follow-function6
	:execution-function 'set-goal-follow-function
)
;----------------------------------------------------------------------------------------------

(defun judge-trajectory-follow-function (ks event)
	(declare (ignore ks event))
	(setf item (sole-trigger-instance-of event))
	(setf r (r-of item))
	(setf judge-goal-pre '((eq r rv) (<= distance 1)))
	(setf rv 'follower)
	(setf distance (d-of item))
	
	(setf pre-result (judge-con1 judge-goal-pre))
	(if (eval (append (list 'and) pre-result))
		1000 nil
	)
)

(defun set-trajectory-follow-function (ksa)
	(declare (ignore ksa))
	(format t "trajectory ~S~%" (sole-trigger-instance-of ksa))
	(setf (fs-of (sole-trigger-instance-of ksa)) 'trajectory-following)
)

(define-ks judge-trajectory-follow-ks
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name puwb))
	:precondition-function 'judge-trajectory-follow-function
	:execution-function 'set-trajectory-follow-function
)

;---------------------------------------------------------------------------------------------

(defun update-info-function (ksa)
	(declare(ignore ksa))
	
	(if  (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp1 *thread-console-server*))
	    (progn
			(setf (cp1-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp1 *thread-console-server*)))
			(pushnew (cp1-of (sole-trigger-instance-of ksa)) (cp1-lst-of (sole-trigger-instance-of ksa)))
		)
	)
	(if  (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp2 *thread-console-server*))
	    (progn
			(setf (cp2-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp2 *thread-console-server*)))
			(pushnew (cp2-of (sole-trigger-instance-of ksa)) (cp2-lst-of (sole-trigger-instance-of ksa)))
		)
	)
	(if  (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp3 *thread-console-server*))
	    (progn
			(setf (cp3-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::cp3 *thread-console-server*)))
			(pushnew (cp3-of (sole-trigger-instance-of ksa)) (cp3-lst-of (sole-trigger-instance-of ksa)))
		)
	)
	(if  (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::puwb *thread-console-server*))
	    (progn
			(setf (puwb-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::puwb *thread-console-server*)))
			(unless (member (list (car (puwb-of (sole-trigger-instance-of ksa))) 
						          (cadr (puwb-of (sole-trigger-instance-of ksa)))) 
						    (puwb-lst-of (sole-trigger-instance-of ksa)) :test #'equal)
					(push (list (car (puwb-of (sole-trigger-instance-of ksa))) 
								(cadr (puwb-of (sole-trigger-instance-of ksa)))) 
						  (puwb-lst-of (sole-trigger-instance-of ksa)))
			)
		)
	)
	(if (p-v-of (sole-trigger-instance-of ksa))
		(if (and (puwb-of (sole-trigger-instance-of ksa))
				 (eq nil (cp1-of (find-instance-by-name (p-v-of (sole-trigger-instance-of ksa)) 'vehicle)))
				 (eq nil (cp2-of (find-instance-by-name (p-v-of (sole-trigger-instance-of ksa)) 'vehicle)))
				 (eq nil (cp3-of (find-instance-by-name (p-v-of (sole-trigger-instance-of ksa)) 'vehicle)))
			)
			(setf (p-of (sole-trigger-instance-of ksa)) (puwb-of (sole-trigger-instance-of ksa)))
		)
	)
	(setf (zc-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::zchash *thread-console-server*)))
	(setf (s-of (sole-trigger-instance-of ksa)) (s-of (sole-trigger-instance-of ksa)))
	(setf (ya-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::ya *thread-console-server*)))
	(setf (vw-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::vw *thread-console-server*)))
	(setf (vel-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::velxyz *thread-console-server*)))
	(setf (battery-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::bat *thread-console-server*)))
	(setf (sensor-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::sen *thread-console-server*)))
	(setf (acc-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::accxyz *thread-console-server*)))
	(setf end-time (get-universal-time))
	(setf start-end-time (- end-time start-time))
	(push (ground-truth-of (sole-trigger-instance-of ksa)) (ground-truth-lst-of (sole-trigger-instance-of ksa)))
	(if (vw-of (sole-trigger-instance-of ksa))
		(setf (ground-truth-of (sole-trigger-instance-of ksa)) (list (- (car (ground-truth-of (sole-trigger-instance-of ksa))) (* start-end-time (Ground-Console:velocity-info-w (vw-of (sole-trigger-instance-of ksa))) (Ground-Console:velocity-info-v (vw-of (sole-trigger-instance-of ksa)))))
																	 (- (cadr (ground-truth-of (sole-trigger-instance-of ksa))) (* start-end-time (Ground-Console:velocity-info-w (vw-of (sole-trigger-instance-of ksa))) (Ground-Console:velocity-info-v (vw-of (sole-trigger-instance-of ksa))))))
			
		)
	)
	
	(if (a-v-of (sole-trigger-instance-of ksa))
		(setf (tp-lst-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle)) 
			(append (tp-lst-of (find-instance-by-name (a-v-of (sole-trigger-instance-of ksa)) 'vehicle)) 
					(list (list (car (puwb-of (sole-trigger-instance-of ksa))) (cadr (puwb-of (sole-trigger-instance-of ksa))))))
		)
	)
	(if (and (tp-lst-of (sole-trigger-instance-of ksa)) (tp-index-of (sole-trigger-instance-of ksa)))
		(setf (tp-of (sole-trigger-instance-of ksa)) 
			(Ground-Unit:make-targetpoint-info :x (float (car (nth (tp-index-of (sole-trigger-instance-of ksa)) (tp-lst-of (sole-trigger-instance-of ksa))))) 
											   :y (float (cadr (nth (tp-index-of (sole-trigger-instance-of ksa)) (tp-lst-of (sole-trigger-instance-of ksa)))))))
	)
	(if (tp-of (sole-trigger-instance-of ksa))
		(progn 
			(if (= 1 (id-of (sole-trigger-instance-of ksa)))
				(progn
					(setf user::targetpoint1 (tp-of (sole-trigger-instance-of ksa)))
					(let ((response1 (Ground-Unit:Ground-Vehicle.set-current-targetpoint user::server1 user::targetpoint1)))
						;(format t "~a~%" response1)
						)
				)
			)
			(if (= 2 (id-of (sole-trigger-instance-of ksa)))
				(progn
					(setf user::targetpoint2 (tp-of (sole-trigger-instance-of ksa)))
					(let ((response2 (Ground-Unit:Ground-Vehicle.set-current-targetpoint user::server2 user::targetpoint2)))
						;(format t "~a~%" response2)
						)
				)
			)
		)
	)
	(setf (d-of (sole-trigger-instance-of ksa)) (gethash (id-of (sole-trigger-instance-of ksa)) (symbol-value-in-thread 'ground-vehicle-console-server::d *thread-console-server*)))
	(setf (update-info-of (sole-trigger-instance-of ksa)) (update-info-of (sole-trigger-instance-of ksa)))
	;(describe-instance (sole-trigger-instance-of ksa))
	(format t "update~%")
)
	
(define-ks update-info-ks
	:trigger-events ((nonlink-slot-updated-event vehicle :slot-name update-info))
	:execution-function 'update-info-function
)

;-------------------------------------------------------------------------------------------
;;;   Initializations (run at Agenda Shell startup)

(defun initializations (event-name &key &allow-other-keys)
	(declare (ignore event-name))
	(delete-blackboard-repository)
	(defparameter *thread-console-server* (spawn-thread "new-th" #'get-console-server))
(setf fusion-two (list 'puwbx 'puwby 'puwbx-error 'puwby-error 'pcamerax 'pcameray 'pcamerax-error 'pcameray-error   'pcamerax2 'pcameray2 'pcamerax2-error 'pcameray2-error   'pcamerax3 'pcameray3 'pcamerax3-error 'pcameray3-error 'fusionx1 'fusiony1 'fusionx2 'fusiony2 'fusionx 'fusiony 'w0-count 'w1-count 'w2-count 'w3-count 'w0 'w1 'w2 'w3 'ground-truthx 'ground-truthy 'post-error))
	(with-open-file 
		(stream "C:/Users/Seminar/Desktop/puwb+pcamera-fusion-2.csv" :if-exists :supersede :direction :output)
		(dolist (i fusion-two)
			(format stream "~S," i)
		)
		(format stream "~%")
	);end write file
	(setf SCOPE 50)
	(defvar start-end-time 0)
	(defvar w-lst-1 nil)
	(setf w-uwb-count 9874)
	(setf w-cp1-count 9996)
	(setf w-cp2-count 9758)
	(setf w-cp3-count 9786)

	(setf judge-fusion-uwb 0)
	(setf judge-fusion-cp1 0)
	(setf judge-fusion-cp2 0)
	(setf judge-fusion-cp3 0)
	(defvar d-error '(0.20281973 0.21696141 0.22847356 0.24285069 0.25404805 0.27753848 0.27986073 0.28263184 0.28329664 0.28491738 0.28532204 0.2961219
    0.29909405 0.30235323 0.3050766 0.30747762 0.30901212 0.31088582 0.31095687 0.31158486 0.3197564 0.320289 0.3244777 0.3245074
    0.32811278 0.33679074 0.34021544 0.34103635 0.34272 0.34677067 0.34946382 0.35439503 0.35546172 0.35555035 0.35602215 0.35629484
    0.3569104 0.35846904 0.36080614 0.3644949 0.36583337 0.36924285 0.36962277 0.3700217 0.3704484 0.3738041 0.3760013 0.37740436
    0.37823063 0.37854984 0.37882861 0.37915826 0.38104668 0.38123035 0.38331848 0.38530126 0.3855995 0.38992444 0.39093864 0.39103055
    0.3911637 0.39129663 0.39179072 0.39232647 0.39385912 0.39419436 0.39450523 0.3945289 0.3966977 0.39970586 0.4011683 0.40136772
    0.40227488 0.4029219 0.4044997 0.40581244 0.40613303 0.40621284 0.4062431 0.40648857 0.40728006 0.40757814 0.40885597 0.41007927
    0.4106045 0.41105822 0.41114396 0.41130644 0.41170022 0.41175967 0.41222927 0.41225487 0.41317552 0.41341138 0.4147708 0.41643378
    0.41712466 0.41761222 0.41829634 0.4183061 0.4192433 0.41925323 0.4193149 0.41959268 0.42000055 0.42059457 0.42091927 0.4218825
    0.42320678 0.4244455 0.42459044 0.42513055 0.42521766 0.4258227 0.42619833 0.4265513 0.42670867 0.42695427 0.42755234 0.42810866
    0.42877522 0.42902857 0.43027425 0.43032202 0.43038708 0.43044275 0.43076006 0.43084678 0.43097836 0.43352252 0.4336658 0.4337203
    0.4337767 0.4338786 0.43492573 0.43513674 0.43515697 0.4359762 0.43739992 0.4377865 0.4378973 0.43807998 0.43822488 0.43956682
    0.43965894 0.43996957 0.44011363 0.4408195 0.4408446 0.4412624 0.44147506 0.44244096 0.44244888 0.44293302 0.444717 0.44473135
    0.4448157 0.4451641 0.44560146 0.44592044 0.44665146 0.44667226 0.44754553 0.44792524 0.4482957 0.4495979 0.4504292 0.4511242
    0.4513667 0.4518518 0.45189622 0.4523078 0.45305192 0.45342758 0.4543006 0.45443258 0.4545026 0.4545489 0.45477578 0.45513144
    0.45588267 0.4561821 0.45686877 0.45757964 0.4586193 0.4587801 0.45878544 0.45905867 0.45910093 0.459342 0.45935363 0.45959517
    0.45976096 0.46002716 0.46043998 0.46078306 0.46079284 0.4615673 0.4616739 0.46177688 0.46227807 0.46313068 0.46332067 0.46431026
    0.46456224 0.46460345 0.46488744 0.4648979 0.4656189 0.4658079 0.46667546 0.4667673 0.4674399 0.4675917 0.46761623 0.46785045
    0.46812502 0.4688437 0.46888158 0.46903569 0.47010636 0.47062638 0.4709661 0.47105947 0.471816 0.47192582 0.4719344 0.4719575
    0.4724034 0.47246692 0.47249213 0.47297463 0.4732737 0.473355 0.47344613 0.47363433 0.47402135 0.47417507 0.47428682 0.4743217
    0.47449866 0.4753367 0.47544712 0.47565642 0.47609204 0.4761652 0.47619322 0.476448 0.4765234 0.47661614 0.4768701 0.47718906
    0.47828972 0.47854996 0.47904962 0.47912523 0.4792416 0.47977075 0.4805424 0.48090446 0.4809667 0.4813315 0.48145896 0.48157683
    0.48177278 0.4821342 0.48213443 0.48245725 0.48270583 0.48308286 0.48399383 0.48472768 0.48537102 0.48561814 0.48568296 0.48573253
    0.48580033 0.48600844 0.48685983 0.487174 0.4873079 0.4874187 0.48754492 0.4876823 0.4879447 0.48806965 0.48810664 0.48827735
    0.4885786 0.48862836 0.48903596 0.48997778 0.49038842 0.4908116 0.49118742 0.4914245 0.49148044 0.4918693 0.49213007 0.4921545
    0.4921972 0.4922205 0.49237496 0.49260333 0.49285397 0.49340147 0.494006 0.4940797 0.4942368 0.49428135 0.49443406 0.4948834 0.4953272
    0.4954645 0.4955017 0.49582475 0.4958484 0.49623382 0.4963614 0.4964443 0.49647757 0.49658275 0.4969036 0.49713925 0.49732286
    0.4973952 0.49756226 0.49782544 0.49826306 0.49844658 0.49847642 0.49873537 0.4988597 0.49985877 0.49995697 0.5 0.50013274 0.5002807
    0.50044984 0.50068456 0.50090516 0.50096005 0.5010808 0.5021125 0.5021733 0.5021893 0.50246114 0.5028419 0.50308645 0.50343037
    0.5035126 0.5036448 0.5042763 0.5044294 0.5049309 0.5050276 0.5050595 0.50511086 0.505202 0.50521475 0.5053355 0.5054463 0.50554234
    0.50605345 0.50630915 0.5064158 0.5064632 0.5066637 0.50671095 0.50705475 0.5070712 0.5079094 0.5079617 0.5080885 0.5082491 0.5084644
    0.5088271 0.5089456 0.50951445 0.50967693 0.5097784 0.51071733 0.51090604 0.5116816 0.5117831 0.51207906 0.51309764 0.5131233
    0.51363045 0.5138296 0.513892 0.5145134 0.51456034 0.5151351 0.51524174 0.5152778 0.51540756 0.5154279 0.51549006 0.5160647 0.51621103
    0.5164081 0.5165928 0.51663554 0.51685387 0.5169534 0.5174244 0.5174321 0.5174881 0.51776856 0.519158 0.51924276 0.51987517 0.52066594
    0.5217139 0.5222231 0.52241176 0.5224512 0.52268255 0.523261 0.5233785 0.5234179 0.5239972 0.52404714 0.52406967 0.5246097 0.5246962
    0.5249417 0.5254455 0.5256557 0.5256959 0.52683586 0.5289377 0.5300743 0.5302163 0.5303093 0.53037024 0.5305064 0.53109956 0.53127205
    0.53141326 0.532077 0.5321183 0.53213626 0.53260684 0.533258 0.5335214 0.5340262 0.53422827 0.53428704 0.5348467 0.5351608 0.5353217
    0.5354634 0.5361064 0.53679377 0.5370387 0.5370668 0.53709453 0.5377183 0.5384957 0.5388644 0.5389538 0.5396584 0.53971964 0.5403128
    0.5408812 0.541301 0.54162157 0.54177153 0.54201937 0.5420673 0.542643 0.5426472 0.542941 0.54362744 0.543651 0.5438715 0.5442175
    0.5444947 0.5465051 0.5466107 0.5473226 0.547885 0.5486748 0.5487311 0.54898536 0.54958063 0.54973006 0.5500882 0.5519284 0.5521527
    0.5542355 0.55553216 0.55697435 0.5580869 0.558319 0.5583708 0.5584345 0.5585019 0.55890745 0.5591855 0.55946 0.5598332 0.5600924
    0.5611996 0.56179255 0.56200045 0.56289464 0.5629103 0.5630564 0.56364214 0.5645705 0.56703657 0.5671855 0.56753886 0.5677218
    0.5678424 0.5679206 0.56807 0.56925386 0.56929106 0.56940436 0.56947696 0.5697363 0.57013917 0.5720899 0.57227284 0.57324135
    0.57376516 0.57481563 0.5748596 0.57651323 0.5780905 0.57826716 0.5790763 0.5790862 0.57924145 0.5796 0.57967675 0.58041555 0.5806461
    0.58079153 0.58090705 0.58118844 0.58208627 0.5841098 0.5842306 0.58515245 0.58595127 0.5860272 0.5870633 0.5871649 0.5893572
    0.59234816 0.59286463 0.5941451 0.5948628 0.5950101 0.5972044 0.59763277 0.59850913 0.5985111 0.5995804 0.60026586 0.60238546
    0.6027793 0.60324544 0.6039089 0.60430545 0.6048471 0.60554135 0.6058738 0.6062614 0.6070349 0.60735136 0.60755736 0.60784936
    0.6082365 0.6089659 0.61224765 0.6122642 0.61274546 0.61343074 0.614256 0.6150293 0.6173276 0.6186342 0.6189548 0.6204596 0.6218626
    0.62265325 0.6232384 0.62503505 0.62538505 0.6260793 0.62796354 0.62812936 0.6282337 0.62890106 0.6313031 0.6335008 0.6336289
    0.6347451 0.635186 0.6354569 0.6356192 0.63568985 0.63585216 0.63769966 0.6389199 0.6396636 0.64320403 0.6433511 0.6472344 0.64841986
    0.65004057 0.65225935 0.65258956 0.65350306 0.6536844 0.65454584 0.65454894 0.6548559 0.6552177 0.6573312 0.660112 0.6602499 0.6608582
    0.6609057 0.66164047 0.6646389 0.66769 0.6679511 0.66891956 0.66912985 0.6712043 0.67163336 0.67197835 0.6731227 0.67430824 0.6747444
    0.6752929 0.6757054 0.67793924 0.67845786 0.6794342 0.6841239 0.6866996 0.68772703 0.6885974 0.6909832 0.69383836 0.69499403
    0.69678557 0.70366186 0.7052359 0.7086642 0.70883346 0.71026593 0.7133534 0.7137279 0.7143943 0.71624345 0.7166526 0.7166987
    0.71671003 0.7168397 0.71797544 0.7181837 0.7195374 0.7203295 0.72258127 0.7236332 0.7254388 0.72796315 0.72977 0.73058283 0.7306844
    0.73783386 0.7381917 0.7384832 0.74233735 0.7458928 0.7460965 0.74861276 0.7490165 0.7522871 0.75281566 0.75429565 0.75795686
    0.7581221 0.7597188 0.7607969 0.76129264 0.761437 0.7618916 0.7627673 0.7631237 0.76523817 0.7663192 0.7690237 0.7701604 0.7703917
    0.7722795 0.7725131 0.7771097 0.7786895 0.77992904 0.78043824 0.78131765 0.7817618 0.7861046 0.7925048 0.7940403 0.79472154 0.79618317
    0.80212003 0.8023523 0.8049437 0.8057364 0.80577266 0.807244 0.809923 0.81604356 0.8170412 0.81791437 0.8193622 0.8196933 0.82074696
    0.8264485 0.8286843 0.8338779 0.8373757 0.837435 0.8403869 0.84449285 0.84856445 0.8486552 0.85256565 0.85987884 0.86044353 0.8604565
    0.8670833 0.8706949 0.8957843 0.9056767 0.90951985 0.9104596 0.9121269 0.9175711 0.9192194 0.92855674 0.92897826 0.9355724 0.94028586
    0.94478947 0.94941247 0.95169777 0.95442164 0.9553584 0.9570006 0.9608847 0.9647861 0.9702592 0.9722755 0.9779302 0.9805987 0.9920552
    0.99300843 0.9981094 1.0007235 1.002204 1.0115521 1.0135493 1.0144693 1.0182698 1.0261089 1.0292118 1.041342 1.0598835 1.0724548
    1.0764384 1.0806034 1.0828977 1.088547 1.0895367 1.1072592 1.108827 1.1110241 1.1137292 1.1249194 1.1267037 1.1272397 1.135664
    1.1572284 1.1655916 1.169992 1.1825415 1.1912119 1.20703 1.2117494 1.2136378 1.2175221 1.2176862 1.2194129 1.2382907 1.2471823
    1.2555578 1.2567828 1.262674 1.2692387 1.2750486 1.2820805 1.2856897 1.2944295 1.2987949 1.3035207 1.3080585 1.3147717 1.3191938
    1.3277944 1.3354441 1.3509094 1.3559499 1.3601813 1.3636448 1.3678126 1.3739921 1.3859273 1.388021 1.3943111 1.4076892 1.4171253
    1.4269768 1.431656 1.4337544 1.4458548 1.4463731 1.4502535 1.4652565 1.4743203 1.4746615 1.4805164 1.4991865 1.5034683 1.5060196
    1.5272065 1.5317377 1.5480392 1.5654627 1.5685976 1.5693897 1.570982 1.5734859 1.5746844 1.5772945 1.5972457 1.607101 1.6081743
    1.6157051 1.623363 1.6471208 1.6478982 1.6642554 1.6713003 1.6923196 1.7093132 1.7201636 1.7266445 1.7291123 1.7325677 1.7617115
    1.7749723 1.7804888 1.7830174 1.8114474 1.8291398 1.8382552 1.8522592 1.8831706 1.8852707 1.8971051 1.9032512 1.9153585 1.9354017
    2.018552 2.045823 2.1291914 2.1493027 2.2324696 2.284308 2.3317177 2.4103723 2.463203 2.5221996 2.5812476))
	(defvar fusion-parameter (make-hash-table))
	(setf (gethash 'fusion-puwb fusion-parameter) (list 'p '(0 0) '(0.006654	0.006651468)))
	(setf (gethash 'fusion-pcamera1 fusion-parameter) (list 'p '(0 0) '(0.006654	0.006651468)))
	(setf (gethash 'fusion-pcamera2 fusion-parameter) (list 'p '(0 0) '(0.006654	0.006651468)))
	(setf (gethash 'fusion-pcamera3 fusion-parameter) (list 'p '(0 0) '(0.006654	0.006651468)))
  ;; Clean up any previous run:
)

(add-event-function 'initializations 'control-shell-started-event
                    ;; Initializations should be done first!
                    :priority 100)

;;; ===========================================================================
;;;   The main, function (simply starts the Agenda Shell)

(defun main (&rest initargs)
  (declare (dynamic-extent initargs))
  (apply #'start-control-shell initargs)
  (format t "111111111111111111111111111111execute~S~%" (detail-of execute-of-path)))

(pushnew ':gbbopen-ground-console-server-unit-client-package *features*)

;;; ===========================================================================
;;;  Autorun actions

(when (and (boundp '*autorun-modules*) 
           *autorun-modules*)
  (format t "~{~&~s~%~}" (multiple-value-list (main))))