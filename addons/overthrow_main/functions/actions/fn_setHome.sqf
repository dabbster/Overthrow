if !(captive player) exitWith {"You cannot set home while wanted" call OT_fnc_notifyMinor};

private _buildings =  (getpos player) nearObjects 15;
private _handled = false;
private _building = objNull;
{
	private _owner = _x call OT_fnc_getOwner;
	if(!isNil "_owner") then {
		if ((typeof _x) in OT_allBuyableBuildings && _owner isEqualTo getplayerUID player) exitWith {
			_handled = true;
			player setVariable ["home",getpos _x,true];
			"This is now your home" call OT_fnc_notifyMinor;
		};
	};

}foreach(_buildings);

if !(_handled) then {
	"You don't own any buildings nearby" call OT_fnc_notifyMinor;
};
