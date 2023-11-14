;Due to copyright reasons, Allegro Common Lisp 10.1 express is a free educational version.
(cl:in-package :ground-console)

(ilu:define-server-class ground-vehicle-console.impl ground-vehicle-console)

(ilu:define-method-server-stub ground-vehicle-console.send-current-yawangle send-current-yawangle
 |Ground-Console.Ground-Vehicle-Console.sendCurrentYawangle|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (yawangle (:primitive :short-real) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-distance send-current-distance
 |Ground-Console.Ground-Vehicle-Console.sendCurrentDistance|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (distance (:primitive :short-real) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-zc send-current-zc
 |Ground-Console.Ground-Vehicle-Console.sendCurrentZc|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (zc (:primitive :short-real) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-sensor send-current-sensor
 |Ground-Console.Ground-Vehicle-Console.sendCurrentSensor|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (sensor (:primitive :short-real) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-battery send-current-battery
 |Ground-Console.Ground-Vehicle-Console.sendCurrentBattery|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (battery (:primitive :short-real) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-position send-current-position
 |Ground-Console.Ground-Vehicle-Console.sendCurrentPosition|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (position (:constructed position-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-camerap send-current-camerap
 |Ground-Console.Ground-Vehicle-Console.sendCurrentCamerap|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (camerap (:constructed camerap-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-camerapzc send-current-camerapzc
 |Ground-Console.Ground-Vehicle-Console.sendCurrentCamerapzc|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (camerapzc (:constructed camerapzc-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-camerapfu send-current-camerapfu
 |Ground-Console.Ground-Vehicle-Console.sendCurrentCamerapfu|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (camerapfu (:constructed camerapfu-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-vel send-current-vel
 |Ground-Console.Ground-Vehicle-Console.sendCurrentVel|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (vel (:constructed vel-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-acc send-current-acc
 |Ground-Console.Ground-Vehicle-Console.sendCurrentAcc|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (acc (:constructed acc-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

(ilu:define-method-server-stub ground-vehicle-console.send-current-velocity send-current-velocity
 |Ground-Console.Ground-Vehicle-Console.sendCurrentVelocity|	; dispatching symbol
 cl:nil	; singleton-p
 cl:nil	; functional-p
 cl:nil	; asynchronous-p
 ((self ground-vehicle-console.impl) (velocity (:constructed velocity-info) :in) (vehicleid (:primitive :short-integer) :in))	; arguments
 ()	; exceptions
 cl:nil	; return-type
 )

