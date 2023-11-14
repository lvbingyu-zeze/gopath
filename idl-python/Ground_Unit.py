_imported_modules = {};
import iluRt ; _imported_modules['iluRt'] = iluRt; _imported_modules['ilu'] = iluRt;
iluRt.CheckStubConsistency('2.0beta1', 'v2 (post-2.0alpha12)');
_imported_modules['ilu__skel'] = iluRt
del iluRt
__types__={}

import iluRt

class Ground_Vehicle(_imported_modules['ilu'].CORBA_Object):
    _IluClass = iluRt.FormClassRecord(
        'Ground_Unit.Ground-Vehicle',
        '',
        'IDL:Ground_Unit/Ground_Vehicle:1.0',
        None,
        iluRt.FALSE,
        iluRt.TRUE,
        None,
        (
            ('setCurrentTargetpoint', 1, iluRt.FALSE, iluRt.FALSE, "ilut:aAKxafHj0BIiFHR4LmrEzKJHc-I", (('targetpoint', 0, 0, 'IDL:Ground_Unit/targetpointInfo:1.0'),), ()),
            ('setCurrentVelocity', 2, iluRt.FALSE, iluRt.FALSE, "ilut:aAKxafHj0BIiFHR4LmrEzKJHc-I", (('velocity', 0, 0, 'IDL:Ground_Unit/velocityInfo:1.0'), ('velocitytag', 0, 0, 'ilut:aAKxafHj0BIiFHR4LmrEzKJHc-I')), ()),
        ),
        (_imported_modules['ilu'].CORBA_Object._IluClass,)
    )

    def setCurrentTargetpoint(_self, targetpoint):
        _result = None
        _call = iluRt.BeginCall(_self, Ground_Vehicle._IluClass, 1)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle)
                    + _SizeOf_targetpointInfo(_call, targetpoint))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle)
                _Output_targetpointInfo(_call, targetpoint)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle._IluClass, _ecode)
                _result = iluRt.InputBoolean(_call)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)
        return _result

    def setCurrentVelocity(_self, velocity, velocitytag):
        _result = None
        _call = iluRt.BeginCall(_self, Ground_Vehicle._IluClass, 2)
        try:
            while 1:
                iluRt.BeginRequest(_call,
                    iluRt.SizeOfObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle)
                    + _SizeOf_velocityInfo(_call, velocity)
                    + iluRt.SizeOfBoolean(_call, velocitytag))
                iluRt.OutputObjectID(_call, _self, iluRt.TRUE, Ground_Vehicle)
                _Output_velocityInfo(_call, velocity)
                iluRt.OutputBoolean(_call, velocitytag)
                iluRt.FinishRequest(_call)
                _ecode = iluRt.GetReply(_call)
                if _ecode != iluRt.RetryCall:
                    break
            try:
                if _ecode != 0:
                    _CatchException(_call, Ground_Vehicle._IluClass, _ecode)
                _result = iluRt.InputBoolean(_call)
            finally:
                iluRt.ReplyRead(_call)
        finally:
            iluRt.FinishCall(_call)
        return _result

__types__['Ground_Vehicle'] = iluRt.RegisterObjectType(Ground_Vehicle, ('Ground_Unit','Ground_Vehicle',), None, None)

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
    __ilu_type_name__ = 'Ground-Unit.velocityInfo'
    def __init__(self, _arg_v, _arg_w):
        self.v = _arg_v;
        self.w = _arg_w;

    def __getinitargs__(self):
        return (self.v, self.w, )

__types__['velocityInfo'] = iluRt.RegisterRecordType(('Ground_Unit','velocityInfo',), None, 'IDL:Ground_Unit/velocityInfo:1.0', (('v', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('w', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Unit/velocityInfo:1.0', _Input_velocityInfo, _Output_velocityInfo, _SizeOf_velocityInfo, 'Ground-Unit.velocityInfo')

def _Input_targetpointInfo(_call):
    iluRt.InputRecord(_call)
    _value = targetpointInfo (None, None)
    _value.x = iluRt.InputShortReal(_call)
    _value.y = iluRt.InputShortReal(_call)
    iluRt.EndRecord(_call)
    return _value

def _Output_targetpointInfo(_call, _value):
    iluRt.OutputRecord(_call)
    iluRt.OutputShortReal(_call, _value['x'])
    iluRt.OutputShortReal(_call, _value['y'])
    iluRt.EndRecord(_call)

def _SizeOf_targetpointInfo(_call, _value):
    _size = iluRt.SizeOfRecord(_call)\
        + iluRt.SizeOfShortReal(_call, _value['x'])\
        + iluRt.SizeOfShortReal(_call, _value['y'])
    iluRt.EndRecord(_call)
    return _size

class targetpointInfo (iluRt.IluRecord):
    __ilu_type_name__ = 'Ground-Unit.targetpointInfo'
    def __init__(self, _arg_x, _arg_y):
        self.x = _arg_x;
        self.y = _arg_y;

    def __getinitargs__(self):
        return (self.x, self.y, )

__types__['targetpointInfo'] = iluRt.RegisterRecordType(('Ground_Unit','targetpointInfo',), None, 'IDL:Ground_Unit/targetpointInfo:1.0', (('x', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),('y', 'ilut:h9V4l47a8J5CGp2fg6ZpsYhXPSO'),), 0, None)
iluRt.RegisterIoFuncs('IDL:Ground_Unit/targetpointInfo:1.0', _Input_targetpointInfo, _Output_targetpointInfo, _SizeOf_targetpointInfo, 'Ground-Unit.targetpointInfo')


def _CatchException(_call, _IluClass, _ecode):
    _value = None
    _name = iluRt.ExceptionName(_call, _IluClass, _ecode)
    raise exception
