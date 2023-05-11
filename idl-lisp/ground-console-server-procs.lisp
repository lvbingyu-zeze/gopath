;;; -*- Mode:Lisp;  Package: ground-console;  Syntax: COMMON-LISP;  Base: 10 -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file was automatically generated with ILU (version 2.0beta1) tools
;;; at Fri Dec 30 12:41:17 2022 by `软智科技有限责任公司'
;;; running "D:/ILUHOME/bin/lisp-stubber.exe" of Mon Feb 28 19:47:37 2022
;;; on "D:/ILUHOME/interfaces/ground_console.idl" of Fri Dec 30 03:36:26 2022,
;;; and "D:/ILUHOME/interfaces/ilu.isl" of Tue Apr 15 16:53:40 2014;;;
;;; ILU is Copyright 1991-1999 Xerox Corporation, All Rights Reserved.
;;; ILU information:  ftp://ftp.parc.xerox.com/pub/ilu/ilu.html.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

