_imported_modules = {};
import iluRt ; _imported_modules['iluRt'] = iluRt; _imported_modules['ilu'] = iluRt;
iluRt.CheckStubConsistency('2.0beta1', 'v2 (post-2.0alpha12)');
_imported_modules['ilu__skel'] = iluRt
del iluRt
__types__={}

import iluRt

class Ground_Vehicle_Console(_imported_modules['ilu'].CORBA_Object):
    _IluClass = iluRt.FormClassRecord(
        'Ground_Console.Ground-Vehicle-Console',
        '',
        'IDL:Ground_Console/Ground_Vehicle_Console:1.0',
        None,
        iluRt.FALSE,
        iluRt.TRUE,
        None,
        (
            ('sendCurrentYawangle', 1, iluRt.FALSE, iluRt.FALSE, None, (('yawangle', 0, 0, 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentDistance', 2, iluRt.FALSE, iluRt.FALSE, None, (('distance', 0, 0, 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentZc', 3, iluRt.FALSE, iluRt.FALSE, None, (('zc', 0, 0, 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentSensor', 4, iluRt.FALSE, iluRt.FALSE, None, (('sensor', 0, 0, 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentBattery', 5, iluRt.FALSE, iluRt.FALSE, None, (('battery', 0, 0, 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentPosition', 6, iluRt.FALSE, iluRt.FALSE, None, (('position', 0, 0, 'IDL:Ground_Console/positionInfo:1.0'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentCamerap', 7, iluRt.FALSE, iluRt.FALSE, None, (('camerap', 0, 0, 'IDL:Ground_Console/camerapInfo:1.0'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentVel', 8, iluRt.FALSE, iluRt.FALSE, None, (('vel', 0, 0, 'IDL:Ground_Console/velInfo:1.0'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentAcc', 9, iluRt.FALSE, iluRt.FALSE, None, (('acc', 0, 0, 'IDL:Ground_Console/accInfo:1.0'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
            ('sendCurrentVelocity', 10, iluRt.FALSE, iluRt.FALSE, None, (('velocity', 0, 0, 'IDL:Ground_Console/velocityInfo:1.0'), ('vehicleid', 0, 0, 'ilut:fOLheADuTmKcJTSlmY16DQWP1YJ')), ()),
        ),
        (_imported_modules['ilu'].CORBA_Object._IluClass,)
    )

    def sendCurrentYawangle(_self, yawangle, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 1)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + iluRt.SizeOfShortReal(_call, yawangle)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                iluRt.OutputShortReal(_call, yawangle)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentDistance(_self, distance, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 2)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + iluRt.SizeOfShortReal(_call, distance)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                iluRt.OutputShortReal(_call, distance)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentZc(_self, zc, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 3)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + iluRt.SizeOfShortReal(_call, zc)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                iluRt.OutputShortReal(_call, zc)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentSensor(_self, sensor, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 4)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + iluRt.SizeOfShortReal(_call, sensor)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                iluRt.OutputShortReal(_call, sensor)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentBattery(_self, battery, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 5)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + iluRt.SizeOfShortReal(_call, battery)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                iluRt.OutputShortReal(_call, battery)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentPosition(_self, position, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 6)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + _SizeOf_positionInfo(_call, position)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                _Output_positionInfo(_call, position)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentCamerap(_self, camerap, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 7)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + _SizeOf_camerapInfo(_call, camerap)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                _Output_camerapInfo(_call, camerap)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentVel(_self, vel, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 8)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + _SizeOf_velInfo(_call, vel)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                _Output_velInfo(_call, vel)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentAcc(_self, acc, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 9)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + _SizeOf_accInfo(_call, acc)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                _Output_accInfo(_call, acc)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

    def sendCurrentVelocity(_self, velocity, vehicleid):
        _call = iluRt.BeginCall(_self, Ground_Vehicle_Console._IluClass, 10)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                    + _SizeOf_velocityInfo(_call, velocity)
                    + iluRt.SizeOfShortInteger(_call, vehicleid))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle_Console)
                _Output_velocityInfo(_call, velocity)
                iluRt.OutputShortInteger(_call, vehicleid)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle_Console._IluClass, _ecode)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)

__types__['Ground_Vehicle_Console'] = iluRt.RegisterObjectType(Ground_Vehicle_Console, ('Ground_Console','Ground_Vehicle_Console',), None, None)

def _Input_velocityInfo(_call):
    iluRt.InputRecord(_call)
    _value = velocityInfo (None, None)
    _value.v = iluRt.InputShortReal(_call)
    _value.w = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_velocityInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['v'])
    iluRt.OutputShortReal(_call, _value['w'])
    iluRt.EndRecord(_call)

def _SizeOf_velocityInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['v'])\
        + iluRt.SizeOfShortReal(_call, _value['w'])
    iluRt.EndRecord(_call)
    return _size

class velocityInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Console.velocityInfo'
    def __init__(self, _arg_v, _arg_w):
        self.v = _arg_v;
        self.w = _arg_w;

    def __getinitargs__(self):
        return (self.v, self.w, )

__types__['velocityInfo'] = iluRt.RegisterRecordType(('Ground_Console','velocityInfo',), None, 'IDL:Ground_Console/velocityInfo:1.0', (('v', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('w', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Console/velocityInfo:1.0', _Input_velocityInfo, _Output_velocityInfo, _SizeOf_velocityInfo, 'Ground-Console.velocityInfo')

def _Input_accInfo(_call):
    iluRt.InputRecord(_call)
    _value = accInfo (None, None, None)
    _value.x = iluRt.InputShortReal(_call)
    _value.y = iluRt.InputShortReal(_call)
    _value.z = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_accInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['x'])
    iluRt.OutputShortReal(_call, _value['y'])
    iluRt.OutputShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)

def _SizeOf_accInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['x'])\
        + iluRt.SizeOfShortReal(_call, _value['y'])\
        + iluRt.SizeOfShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)
    return _size

class accInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Console.accInfo'
    def __init__(self, _arg_x, _arg_y, _arg_z):
        self.x = _arg_x;
        self.y = _arg_y;
        self.z = _arg_z;

    def __getinitargs__(self):
        return (self.x, self.y, self.z, )

__types__['accInfo'] = iluRt.RegisterRecordType(('Ground_Console','accInfo',), None, 'IDL:Ground_Console/accInfo:1.0', (('x', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('y', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('z', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Console/accInfo:1.0', _Input_accInfo, _Output_accInfo, _SizeOf_accInfo, 'Ground-Console.accInfo')

def _Input_velInfo(_call):
    iluRt.InputRecord(_call)
    _value = velInfo (None, None, None)
    _value.x = iluRt.InputShortReal(_call)
    _value.y = iluRt.InputShortReal(_call)
    _value.z = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_velInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['x'])
    iluRt.OutputShortReal(_call, _value['y'])
    iluRt.OutputShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)

def _SizeOf_velInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['x'])\
        + iluRt.SizeOfShortReal(_call, _value['y'])\
        + iluRt.SizeOfShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)
    return _size

class velInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Console.velInfo'
    def __init__(self, _arg_x, _arg_y, _arg_z):
        self.x = _arg_x;
        self.y = _arg_y;
        self.z = _arg_z;

    def __getinitargs__(self):
        return (self.x, self.y, self.z, )

__types__['velInfo'] = iluRt.RegisterRecordType(('Ground_Console','velInfo',), None, 'IDL:Ground_Console/velInfo:1.0', (('x', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('y', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('z', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Console/velInfo:1.0', _Input_velInfo, _Output_velInfo, _SizeOf_velInfo, 'Ground-Console.velInfo')

def _Input_camerapInfo(_call):
    iluRt.InputRecord(_call)
    _value = camerapInfo (None, None)
    _value.x = iluRt.InputShortReal(_call)
    _value.y = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_camerapInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['x'])
    iluRt.OutputShortReal(_call, _value['y'])
    iluRt.EndRecord(_call)

def _SizeOf_camerapInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['x'])\
        + iluRt.SizeOfShortReal(_call, _value['y'])
    iluRt.EndRecord(_call)
    return _size

class camerapInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Console.camerapInfo'
    def __init__(self, _arg_x, _arg_y):
        self.x = _arg_x;
        self.y = _arg_y;

    def __getinitargs__(self):
        return (self.x, self.y, )

__types__['camerapInfo'] = iluRt.RegisterRecordType(('Ground_Console','camerapInfo',), None, 'IDL:Ground_Console/camerapInfo:1.0', (('x', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('y', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Console/camerapInfo:1.0', _Input_camerapInfo, _Output_camerapInfo, _SizeOf_camerapInfo, 'Ground-Console.camerapInfo')

def _Input_positionInfo(_call):
    iluRt.InputRecord(_call)
    _value = positionInfo (None, None, None)
    _value.x = iluRt.InputShortReal(_call)
    _value.y = iluRt.InputShortReal(_call)
    _value.z = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_positionInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['x'])
    iluRt.OutputShortReal(_call, _value['y'])
    iluRt.OutputShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)

def _SizeOf_positionInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['x'])\
        + iluRt.SizeOfShortReal(_call, _value['y'])\
        + iluRt.SizeOfShortReal(_call, _value['z'])
    iluRt.EndRecord(_call)
    return _size

class positionInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Console.positionInfo'
    def __init__(self, _arg_x, _arg_y, _arg_z):
        self.x = _arg_x;
        self.y = _arg_y;
        self.z = _arg_z;

    def __getinitargs__(self):
        return (self.x, self.y, self.z, )

__types__['positionInfo'] = iluRt.RegisterRecordType(('Ground_Console','positionInfo',), None, 'IDL:Ground_Console/positionInfo:1.0', (('x', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('y', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('z', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Console/positionInfo:1.0', _Input_positionInfo, _Output_positionInfo, _SizeOf_positionInfo, 'Ground-Console.positionInfo')


def _CatchException(_call, _IluClass, _ecode):
    _value = None
    _name = iluRt.ExceptionName(_call, _IluClass, _ecode)
    raise exception
