
import sys;
_imported_modules = {};
import iluRt ; _imported_modules['iluRt'] = iluRt; _imported_modules['ilu'] = iluRt;
iluRt.CheckStubConsistency('2.0beta1', 'v2 (post-2.0alpha12)');
_imported_modules['ilu__skel'] = iluRt
del iluRt
import Ground_Console; _imported_modules['Ground_Console'] = Ground_Console; del Ground_Console;
import iluRt

def _Ground_Vehicle_Console__sendCurrentYawangle(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    yawangle = iluRt.InputShortReal(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentYawangle(yawangle, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentDistance(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    distance = iluRt.InputShortReal(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentDistance(distance, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentZc(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    zc = iluRt.InputShortReal(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentZc(zc, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentSensor(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    sensor = iluRt.InputShortReal(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentSensor(sensor, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentBattery(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    battery = iluRt.InputShortReal(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentBattery(battery, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentPosition(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    position = _imported_modules['Ground_Console']._Input_positionInfo(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentPosition(position, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentCamerap(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    camerap = _imported_modules['Ground_Console']._Input_camerapInfo(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentCamerap(camerap, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentVel(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    vel = _imported_modules['Ground_Console']._Input_velInfo(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentVel(vel, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentAcc(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    acc = _imported_modules['Ground_Console']._Input_accInfo(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentAcc(acc, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)

def _Ground_Vehicle_Console__sendCurrentVelocity(_call):
    _self = iluRt.InputObjectID(_call, iluRt.TRUE, _imported_modules['Ground_Console'].Ground_Vehicle_Console)
    velocity = _imported_modules['Ground_Console']._Input_velocityInfo(_call)
    vehicleid = iluRt.InputShortInteger(_call)
    iluRt.RequestRead(_call)
    try:
        _self.sendCurrentVelocity(velocity, vehicleid)
    except:
        iluRt.CaughtUnexpectedException(_call)
    iluRt.BeginReply(_call, iluRt.FALSE, iluRt.BeginSizingReply(_call, iluRt.FALSE) + 0)
    iluRt.FinishReply(_call)


iluRt.RegisterSkeletons(_imported_modules['Ground_Console'].Ground_Vehicle_Console._IluClass, (
    _Ground_Vehicle_Console__sendCurrentYawangle,
    _Ground_Vehicle_Console__sendCurrentDistance,
    _Ground_Vehicle_Console__sendCurrentZc,
    _Ground_Vehicle_Console__sendCurrentSensor,
    _Ground_Vehicle_Console__sendCurrentBattery,
    _Ground_Vehicle_Console__sendCurrentPosition,
    _Ground_Vehicle_Console__sendCurrentCamerap,
    _Ground_Vehicle_Console__sendCurrentVel,
    _Ground_Vehicle_Console__sendCurrentAcc,
    _Ground_Vehicle_Console__sendCurrentVelocity,))


class Ground_Vehicle_Console(iluRt.IluObjTrue):
    _IluClass = _imported_modules['Ground_Console'].Ground_Vehicle_Console._IluClass

    def sendCurrentYawangle(_self, yawangle, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentYawangle')

    def sendCurrentDistance(_self, distance, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentDistance')

    def sendCurrentZc(_self, zc, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentZc')

    def sendCurrentSensor(_self, sensor, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentSensor')

    def sendCurrentBattery(_self, battery, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentBattery')

    def sendCurrentPosition(_self, position, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentPosition')

    def sendCurrentCamerap(_self, camerap, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentCamerap')

    def sendCurrentVel(_self, vel, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentVel')

    def sendCurrentAcc(_self, acc, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentAcc')

    def sendCurrentVelocity(_self, velocity, vehicleid):
        raise iluRt.IluUnimplementedMethodError('sendCurrentVelocity')

