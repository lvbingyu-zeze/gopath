# Skeletons for "Ground-Unit"
#
# This file was automatically generated with ILU (version 2.0beta1) tools
# at Fri Oct 22 16:23:55 2021 by `软智科技有限责任公司'
# running "D:/ILUHOME/bin/python-stubber.exe" of Thu Jun 17 15:35:05 2021
# on "D:/ILUHOME/interfaces/ground_unit.idl" of Fri Oct 22 14:06:47 2021,
# and "D:/ILUHOME/interfaces/ilu.isl" of Tue Apr 15 16:53:40 2014#
# ILU is Copyright 1991-1999 Xerox Corporation, All Rights Reserved.
# ILU information:  ftp://ftp.parc.xerox.com/pub/ilu/ilu.html.

import sys;
_imported_modules = {};
import iluRt ; _imported_modules['iluRt'] = iluRt; _imported_modules['ilu'] = iluRt;
iluRt.CheckStubConsistency('2.0beta1', 'v2 (post-2.0alpha12)');
_imported_modules['ilu__skel'] = iluRt
del iluRt
import Ground_Unit; _imported_modules['Ground_Unit'] = Ground_Unit; del Ground_Unit;
import iluRt

def _Ground_Vehicle__setCurrentTargetpoint(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Unit'].Ground_Vehicle)
    targetpoint = _imported_modules['Ground_Unit']._Input_targetpointInfo(_call)
    iluRt.RequestRead(_call)
    try:
        _result = _self.setCurrentTargetpoint(targetpoint)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + iluRt.SizeOfBoolean(_call, _result))
    iluRt.OutputBoolean(_call, _result)
    iluRt.FinishReply(_call)

def _Ground_Vehicle__setCurrentVelocity(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Unit'].Ground_Vehicle)
    velocity = _imported_modules['Ground_Unit']._Input_velocityInfo(_call)
    velocitytag = iluRt.InputBoolean(_call)
    iluRt.RequestRead(_call)
    try:
        _result = _self.setCurrentVelocity(velocity, velocitytag)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + iluRt.SizeOfBoolean(_call, _result))
    iluRt.OutputBoolean(_call, _result)
    iluRt.FinishReply(_call)


iluRt.RegisterSkeletons(_imported_modules['Ground_Unit'].Ground_Vehicle._IluClass, (
    _Ground_Vehicle__setCurrentTargetpoint,
    _Ground_Vehicle__setCurrentVelocity,))


class Ground_Vehicle(iluRt.IluObjTrue):
    _IluClass = _imported_modules['Ground_Unit'].Ground_Vehicle._IluClass

    def setCurrentTargetpoint(_self, targetpoint):
        raise iluRt.IluUnimplementedMethodError('setCurrentTargetpoint')

    def setCurrentVelocity(_self, velocity, velocitytag):
        raise iluRt.IluUnimplementedMethodError('setCurrentVelocity')

