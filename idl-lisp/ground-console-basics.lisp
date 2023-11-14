;Due to copyright reasons, Allegro Common Lisp 10.1 express is a free educational version.
(cl:defpackage :ground-console
  (:use :common-lisp :ilu)
  (:shadow
   #:ground-vehicle-console
   #:ground-vehicle-console.send-current-yawangle
   #+ilu-old-method-names
   #:send-current-yawangle
   #:ground-vehicle-console.send-current-distance
   #+ilu-old-method-names
   #:send-current-distance
   #:ground-vehicle-console.send-current-zc
   #+ilu-old-method-names
   #:send-current-zc
   #:ground-vehicle-console.send-current-sensor
   #+ilu-old-method-names
   #:send-current-sensor
   #:ground-vehicle-console.send-current-battery
   #+ilu-old-method-names
   #:send-current-battery
   #:ground-vehicle-console.send-current-position
   #+ilu-old-method-names
   #:send-current-position
   #:ground-vehicle-console.send-current-camerap
   #+ilu-old-method-names
   #:send-current-camerap
   #:ground-vehicle-console.send-current-camerapzc
   #+ilu-old-method-names
   #:send-current-camerapzc
   #:ground-vehicle-console.send-current-camerapfu
   #+ilu-old-method-names
   #:send-current-camerapfu
   #:ground-vehicle-console.send-current-vel
   #+ilu-old-method-names
   #:send-current-vel
   #:ground-vehicle-console.send-current-acc
   #+ilu-old-method-names
   #:send-current-acc
   #:ground-vehicle-console.send-current-velocity
   #+ilu-old-method-names
   #:send-current-velocity
   #:velocity-info
   #:acc-info
   #:vel-info
   #:camerapfu-info
   #:camerapzc-info
   #:camerap-info
   #:position-info
  )
  (:export
   #:ground-vehicle-console
   #:ground-vehicle-console.send-current-yawangle
   #+ilu-old-method-names
   #:send-current-yawangle
   #:ground-vehicle-console.send-current-distance
   #+ilu-old-method-names
   #:send-current-distance
   #:ground-vehicle-console.send-current-zc
   #+ilu-old-method-names
   #:send-current-zc
   #:ground-vehicle-console.send-current-sensor
   #+ilu-old-method-names
   #:send-current-sensor
   #:ground-vehicle-console.send-current-battery
   #+ilu-old-method-names
   #:send-current-battery
   #:ground-vehicle-console.send-current-position
   #+ilu-old-method-names
   #:send-current-position
   #:ground-vehicle-console.send-current-camerap
   #+ilu-old-method-names
   #:send-current-camerap
   #:ground-vehicle-console.send-current-camerapzc
   #+ilu-old-method-names
   #:send-current-camerapzc
   #:ground-vehicle-console.send-current-camerapfu
   #+ilu-old-method-names
   #:send-current-camerapfu
   #:ground-vehicle-console.send-current-vel
   #+ilu-old-method-names
   #:send-current-vel
   #:ground-vehicle-console.send-current-acc
   #+ilu-old-method-names
   #:send-current-acc
   #:ground-vehicle-console.send-current-velocity
   #+ilu-old-method-names
   #:send-current-velocity
   #:velocity-info
   #:acc-info
   #:vel-info
   #:camerapfu-info
   #:camerapzc-info
   #:camerap-info
   #:position-info
  ))

(cl:in-package :ground-console)

(ilu:define-class-type ground-vehicle-console
 ( ilu:corba-object)	; superclasses
 ( "IDL:omg.org/CORBA/Object:1.0")	; superclass IDs
 cl:nil	; singleton?
 cl:nil	; authentication
 cl:nil	; brand
 cl:t	; optional?
 cl:nil	; collectible?
 (	; methods
  ("sendCurrentYawangle" ground-vehicle-console.send-current-yawangle 1 cl:nil cl:nil  cl:nil ( (yawangle (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentDistance" ground-vehicle-console.send-current-distance 2 cl:nil cl:nil  cl:nil ( (distance (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentZc" ground-vehicle-console.send-current-zc 3 cl:nil cl:nil  cl:nil ( (zc (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentSensor" ground-vehicle-console.send-current-sensor 4 cl:nil cl:nil  cl:nil ( (sensor (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentBattery" ground-vehicle-console.send-current-battery 5 cl:nil cl:nil  cl:nil ( (battery (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentPosition" ground-vehicle-console.send-current-position 6 cl:nil cl:nil  cl:nil ( (position (:constructed position-info) :in "IDL:Ground_Console/positionInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentCamerap" ground-vehicle-console.send-current-camerap 7 cl:nil cl:nil  cl:nil ( (camerap (:constructed camerap-info) :in "IDL:Ground_Console/camerapInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentCamerapzc" ground-vehicle-console.send-current-camerapzc 8 cl:nil cl:nil  cl:nil ( (camerapzc (:constructed camerapzc-info) :in "IDL:Ground_Console/camerapzcInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentCamerapfu" ground-vehicle-console.send-current-camerapfu 9 cl:nil cl:nil  cl:nil ( (camerapfu (:constructed camerapfu-info) :in "IDL:Ground_Console/camerapfuInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentVel" ground-vehicle-console.send-current-vel 10 cl:nil cl:nil  cl:nil ( (vel (:constructed vel-info) :in "IDL:Ground_Console/velInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentAcc" ground-vehicle-console.send-current-acc 11 cl:nil cl:nil  cl:nil ( (acc (:constructed acc-info) :in "IDL:Ground_Console/accInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  ("sendCurrentVelocity" ground-vehicle-console.send-current-velocity 12 cl:nil cl:nil  cl:nil ( (velocity (:constructed velocity-info) :in "IDL:Ground_Console/velocityInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil)) ())
  )
 "2.0beta1" "Ground-Vehicle-Console" "Ground-Console" cl:nil "IDL:Ground_Console/Ground_Vehicle_Console:1.0"
 cl:nil)


(ilu:define-record-type velocity-info
 (v (:primitive :short-real) "v" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (w (:primitive :short-real) "w" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type acc-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type vel-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type camerapfu-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type camerapzc-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type camerap-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record-type position-info
 (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-class ground-vehicle-console)	; get-class-fn

(ilu:define-method ground-vehicle-console.send-current-yawangle send-current-yawangle
 1	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (yawangle (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-distance send-current-distance
 2	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (distance (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-zc send-current-zc
 3	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (zc (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-sensor send-current-sensor
 4	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (sensor (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-battery send-current-battery
 5	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (battery (:primitive :short-real) :in "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-position send-current-position
 6	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (position (:constructed position-info) :in "IDL:Ground_Console/positionInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-camerap send-current-camerap
 7	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (camerap (:constructed camerap-info) :in "IDL:Ground_Console/camerapInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-camerapzc send-current-camerapzc
 8	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (camerapzc (:constructed camerapzc-info) :in "IDL:Ground_Console/camerapzcInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-camerapfu send-current-camerapfu
 9	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (camerapfu (:constructed camerapfu-info) :in "IDL:Ground_Console/camerapfuInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-vel send-current-vel
 10	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (vel (:constructed vel-info) :in "IDL:Ground_Console/velInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-acc send-current-acc
 11	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (acc (:constructed acc-info) :in "IDL:Ground_Console/accInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)

(ilu:define-method ground-vehicle-console.send-current-velocity send-current-velocity
 12	; id
 cl:nil	; singleton-p
 cl:nil	; functional
 cl:nil	; asynch
 (	; arguments
  (self (:object ground-vehicle-console)) (velocity (:constructed velocity-info) :in "IDL:Ground_Console/velocityInfo:1.0" nil) (vehicleid (:primitive :short-integer) :in "ilut:fOLheADuTmKcJTSlmY16DQWP1YJ" nil))
 ()	; exceptions
 cl:nil	; return type
)


(ilu:define-record velocity-info "IDL:Ground_Console/velocityInfo:1.0"
 "velocityInfo" "Ground-Console" nil nil nil  (v (:primitive :short-real) "v" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (w (:primitive :short-real) "w" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record acc-info "IDL:Ground_Console/accInfo:1.0"
 "accInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record vel-info "IDL:Ground_Console/velInfo:1.0"
 "velInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record camerapfu-info "IDL:Ground_Console/camerapfuInfo:1.0"
 "camerapfuInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record camerapzc-info "IDL:Ground_Console/camerapzcInfo:1.0"
 "camerapzcInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record camerap-info "IDL:Ground_Console/camerapInfo:1.0"
 "camerapInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

(ilu:define-record position-info "IDL:Ground_Console/positionInfo:1.0"
 "positionInfo" "Ground-Console" nil nil nil  (x (:primitive :short-real) "x" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (y (:primitive :short-real) "y" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 (z (:primitive :short-real) "z" "ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO")
 )

