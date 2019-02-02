#include <a_samp>
#include <sscanf2>
#include <zcmd>
#include <easydialog>

main()
{
	print("\n----------------------------------");
	print("Freeroam");
	print("----------------------------------\n");
}

#define COLOR_YELLOW 0xFFFF00AA

new isPlayerVGod[MAX_PLAYERS];
new isPlayerGod[MAX_PLAYERS];
new vGodTimer[MAX_PLAYERS];

new aVehicleNames[212][] =
{
    {"Landstalker"},
    {"Bravura"},
    {"Buffalo"},
    {"Linerunner"},
    {"Perrenial"},
    {"Sentinel"},
    {"Dumper"},
    {"Firetruck"},
    {"Trashmaster"},
    {"Stretch"},
    {"Manana"},
    {"Infernus"},
    {"Voodoo"},
    {"Pony"},
    {"Mule"},
    {"Cheetah"},
    {"Ambulance"},
    {"Leviathan"},
    {"Moonbeam"},
    {"Esperanto"},
    {"Taxi"},
    {"Washington"},
    {"Bobcat"},
    {"Mr Whoopee"},
    {"BF Injection"},
    {"Hunter"},
    {"Premier"},
    {"Enforcer"},
    {"Securicar"},
    {"Banshee"},
    {"Predator"},
    {"Bus"},
    {"Rhino"},
    {"Barracks"},
    {"Hotknife"},
    {"Trailer 1"},
    {"Previon"},
    {"Coach"},
    {"Cabbie"},
    {"Stallion"},
    {"Rumpo"},
    {"RC Bandit"},
    {"Romero"},
    {"Packer"},
    {"Monster"},
    {"Admiral"},
    {"Squalo"},
    {"Seasparrow"},
    {"Pizzaboy"},
    {"Tram"},
    {"Trailer 2"},
    {"Turismo"},
    {"Speeder"},
    {"Reefer"},
    {"Tropic"},
    {"Flatbed"},
    {"Yankee"},
    {"Caddy"},
    {"Solair"},
    {"Berkley's RC Van"},
    {"Skimmer"},
    {"PCJ-600"},
    {"Faggio"},
    {"Freeway"},
    {"RC Baron"},
    {"RC Raider"},
    {"Glendale"},
    {"Oceanic"},
    {"Sanchez"},
    {"Sparrow"},
    {"Patriot"},
    {"Quad"},
    {"Coastguard"},
    {"Dinghy"},
    {"Hermes"},
    {"Sabre"},
    {"Rustler"},
    {"ZR-350"},
    {"Walton"},
    {"Regina"},
    {"Comet"},
    {"BMX"},
    {"Burrito"},
    {"Camper"},
    {"Marquis"},
    {"Baggage"},
    {"Dozer"},
    {"Maverick"},
    {"News Chopper"},
    {"Rancher"},
    {"FBI Rancher"},
    {"Virgo"},
    {"Greenwood"},
    {"Jetmax"},
    {"Hotring"},
    {"Sandking"},
    {"Blista Compact"},
    {"Police Maverick"},
    {"Boxville"},
    {"Benson"},
    {"Mesa"},
    {"RC Goblin"},
    {"Hotring Racer A"},
    {"Hotring Racer B"},
    {"Bloodring Banger"},
    {"Rancher"},
    {"Super GT"},
    {"Elegant"},
    {"Journey"},
    {"Bike"},
    {"Mountain Bike"},
    {"Beagle"},
    {"Cropdust"},
    {"Stunt"},
    {"Tanker"},
    {"Roadtrain"},
    {"Nebula"},
    {"Majestic"},
    {"Buccaneer"},
    {"Shamal"},
    {"Hydra"},
    {"FCR-900"},
    {"NRG-500"},
    {"HPV1000"},
    {"Cement Truck"},
    {"Tow Truck"},
    {"Fortune"},
    {"Cadrona"},
    {"FBI Truck"},
    {"Willard"},
    {"Forklift"},
    {"Tractor"},
    {"Combine"},
    {"Feltzer"},
    {"Remington"},
    {"Slamvan"},
    {"Blade"},
    {"Freight"},
    {"Streak"},
    {"Vortex"},
    {"Vincent"},
    {"Bullet"},
    {"Clover"},
    {"Sadler"},
    {"Firetruck LA"},
    {"Hustler"},
    {"Intruder"},
    {"Primo"},
    {"Cargobob"},
    {"Tampa"},
    {"Sunrise"},
    {"Merit"},
    {"Utility"},
    {"Nevada"},
    {"Yosemite"},
    {"Windsor"},
    {"Monster A"},
    {"Monster B"},
    {"Uranus"},
    {"Jester"},
    {"Sultan"},
    {"Stratum"},
    {"Elegy"},
    {"Raindance"},
    {"RC Tiger"},
    {"Flash"},
    {"Tahoma"},
    {"Savanna"},
    {"Bandito"},
    {"Freight Flat"},
    {"Streak Carriage"},
    {"Kart"},
    {"Mower"},
    {"Duneride"},
    {"Sweeper"},
    {"Broadway"},
    {"Tornado"},
    {"AT-400"},
    {"DFT-30"},
    {"Huntley"},
    {"Stafford"},
    {"BF-400"},
    {"Newsvan"},
    {"Tug"},
    {"Trailer 3"},
    {"Emperor"},
    {"Wayfarer"},
    {"Euros"},
    {"Hotdog"},
    {"Club"},
    {"Freight Carriage"},
    {"Trailer 3"},
    {"Andromada"},
    {"Dodo"},
    {"RC Cam"},
    {"Launch"},
    {"Police Car (LSPD)"},
    {"Police Car (SFPD)"},
    {"Police Car (LVPD)"},
    {"Police Ranger"},
    {"Picador"},
    {"S.W.A.T. Van"},
    {"Alpha"},
    {"Phoenix"},
    {"Glendale"},
    {"Sadler"},
    {"Luggage Trailer A"},
    {"Luggage Trailer B"},
    {"Stair Trailer"},
    {"Boxville"},
    {"Farm Plow"},
    {"Utility Trailer"}
};

public OnGameModeInit()
{
	SetGameModeText("Brian's Freeroam");
	AddPlayerClass(0,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(7,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(13,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(29,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(28,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(55,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	AddPlayerClass(59,1568.0083,-1894.0566,13.5599,358.9790,0,0,0,0,0,0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
	new driverID = getDriverID(hitid);
	if(hittype == 2 && driverID != -1 && isPlayerVGod[driverID] == 1) {
		new message[39 + MAX_PLAYER_NAME];
		format(message, sizeof(message), "SERVER: %s has vehicle godmode enabled", getPlayerName(hitid));
		SendClientMessage(playerid, COLOR_YELLOW, message);
		fixVehicle(hitid);
		return 0;
	}

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1568.0083,-1894.0566,13.5599);
	SetPlayerFacingAngle(playerid,358.9790);
	SetPlayerCameraPos(playerid, 1567.7855,-1883.3054,13.5573);
	SetPlayerCameraLookAt(playerid, 1568.0083,-1894.0566,13.5599);

	return 1;
}

public OnPlayerConnect(playerid)
{
	new joinMessage[29 + MAX_PLAYER_NAME + 1];
	format(joinMessage, sizeof(joinMessage), "JOIN: %s has joined the server!", getPlayerName(playerid));
	SendClientMessageToAll(COLOR_YELLOW, joinMessage);

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new leaveMessage[27 + MAX_PLAYER_NAME + 1];
	format(leaveMessage, sizeof(leaveMessage), "QUIT: %s has left the server!", getPlayerName(playerid));
	SendClientMessageToAll(COLOR_YELLOW, leaveMessage);

	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	SetTimerEx("removeVehicleAfterDeath", 1000, false, "i", vehicleid);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(isPlayerVGod[playerid] == 1) {
		vGodTimer[playerid] = SetTimerEx("fixVehicle", 500, 1, "i", playerid);
	}

	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	KillTimer(vGodTimer[playerid]);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {
	if(isPlayerGod[playerid] == 1) {
		new message[30 + MAX_PLAYER_NAME + 1];
		format(message, sizeof(message), "SERVER: %s has godmode enabled", getPlayerName(playerid));
		SendClientMessage(issuerid, COLOR_YELLOW, message);
	}

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid) {
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

COMMAND:weps(playerid, params[]) {
	Dialog_Show(playerid, WEAPON_DIALOG, DIALOG_STYLE_LIST, "Weapons Menu", "Handguns\nSubmachine Guns\nShotguns\nAssault Rifles\nSniper Rifles\nHeavy Weapons\nThrown\nMelee\nSpecial", "Open", "Close");

	return 1;
}

Dialog:WEAPON_DIALOG(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				Dialog_Show(playerid, HANDGUN_LIST, DIALOG_STYLE_LIST, "Handgun List", "Pistol\nSilenced Pistol\nDesert Eagle", "Select", "Close");
				return 1;
			}
			case 1: {
				Dialog_Show(playerid, SMG_LIST, DIALOG_STYLE_LIST, "Submachine Gun List", "Tec-9\nMicro-UZI\nMP5", "Select", "Close");
				return 1;
			}
			case 2: {
				Dialog_Show(playerid, SHOTGUN_LIST, DIALOG_STYLE_LIST, "Shotgun List", "Pump Shotgun\nSawnoff Shotgun\nSpaz-12", "Select", "Close");
				return 1;
			}
			case 3: {
				Dialog_Show(playerid, ASSAULT_LIST, DIALOG_STYLE_LIST, "Assault Rifle List", "AK-47\nM4", "Select", "Close");
				return 1;
			}
			case 4: {
				Dialog_Show(playerid, SNIPER_LIST, DIALOG_STYLE_LIST, "Sniper Rifle List", "Country Rifle\nSniper Rifle", "Select", "Close");
				return 1;
			}
			case 5: {
				Dialog_Show(playerid, HEAVY_LIST, DIALOG_STYLE_LIST, "Heavy List", "Flamethrower\nRocket Launcher\nHeat-Seeking Rocket Launcher", "Select", "Close");
				return 1;
			}
			case 6: {
				Dialog_Show(playerid, THROWN_LIST, DIALOG_STYLE_LIST, "Thrown List", "Tear Gas\nMolotov Cocktail\nGrenade", "Select", "Close");
				return 1;
			}
			case 7: {
				Dialog_Show(playerid, MELEE_LIST, DIALOG_STYLE_LIST, "Melee List", "Knife\nNightstick\nPool Cue\nGolf Club\nBaseball Bat\nShovel\nKatana\nChainsaw", "Select", "Exit");	
				return 1;
			}
			case 8: {
				Dialog_Show(playerid, SPECIAL_LIST, DIALOG_STYLE_LIST, "Special List", "Camera\nSpray Can\nFire Extinguisher", "Select", "Close");
				return 1;
			}
		}
	}

	return 1;
}

Dialog:HANDGUN_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 22, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 23, 500);
				return 1;
			}
				case 2: {
				GivePlayerWeapon(playerid, 24, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:SMG_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 32, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 28, 500);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 29, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:SHOTGUN_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 25, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 26, 500);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 27, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:ASSAULT_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 30, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 31, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:SNIPER_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 33, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 34, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:HEAVY_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 37, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 35, 500);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 36, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:THROWN_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 17, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 18, 500);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 16, 500);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:MELEE_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 4, 1);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 3, 1);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 7, 1);
				return 1;
			}
			case 3: {
				GivePlayerWeapon(playerid, 2, 1);
				return 1;
			}
			case 4: {
				GivePlayerWeapon(playerid, 5, 1);
				return 1;
			}
			case 5: {
				GivePlayerWeapon(playerid, 6, 1);
				return 1;
			}
			case 6: {
				GivePlayerWeapon(playerid, 8, 1);
				return 1;
			}
			case 7: {
				GivePlayerWeapon(playerid, 9, 1);
				return 1;
			}
		}
	}

	return 1;
}

Dialog:SPECIAL_LIST(playerid, response, listitem, inputtext[]) {
	if(response) {
		switch(listitem) {
			case 0: {
				GivePlayerWeapon(playerid, 43, 500);
				return 1;
			}
			case 1: {
				GivePlayerWeapon(playerid, 41, 500);
				return 1;
			}
			case 2: {
				GivePlayerWeapon(playerid, 42, 500);
				return 1;
			}
		}
	}

	return 1;
}


COMMAND:disarm(playerid, params[]) {
	ResetPlayerWeapons(playerid);
	SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Weapons removed");

	return 1;
}

COMMAND:injure(playerid, params[]) {
	SetPlayerHealth(playerid, 50);
	SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Oof!");
	PlayAudioStreamForPlayer(playerid, "http://bit.do/Roblox-Death");
	return 1;
}

COMMAND:armor(playerid, params[]) {
	SetPlayerArmour(playerid, 100);
	SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Armor refilled!");

	return 1;
}

COMMAND:setskin(playerid, params[]) {

	new skinID;
	if(sscanf(params, "i", skinID)) {
		return SendClientMessage(playerid, COLOR_YELLOW, "ERROR: Usage is /setskin(ss) [ID]");
	} else if(!isSkinValid(skinID)) {
		return SendClientMessage(playerid, COLOR_YELLOW, "ERROR: Invalid skin ID");
	} else {
		SetPlayerSkin(playerid, skinID);
		return 1;
	}
	
}

COMMAND:ss(playerid, params[]) return cmd_setskin(playerid, params);

COMMAND:heal(playerid, params[]) {

	new Float:healthValue;
	if(sscanf(params, "f", healthValue)) {
		SetPlayerHealth(playerid, 100);
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Fully healed!");
	} else {
		new Float:currentHealth;
		new message[26];
		GetPlayerHealth(playerid, currentHealth);
		SetPlayerHealth(playerid, (currentHealth + healthValue));
		format(message, sizeof(message), "SERVER: Healed %d health", floatround(healthValue, floatround_round));
		SendClientMessage(playerid, COLOR_YELLOW, message);
	}

	return 1;
}

COMMAND:v(playerid, params[]) {
	new vehicleName[128];
	if(sscanf(params, "s[128]", vehicleName)) {
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Usage is /v (name)");
	} else {
		if(IsPlayerInAnyVehicle(playerid) == 1) {
			return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: You're already in a vehicle");
		}

		new Float:xPos;
		new Float:yPos;
		new Float:zPos;
		new Float:angle;

		GetPlayerPos(playerid, xPos, yPos, zPos);
		GetPlayerFacingAngle(playerid, angle);
		new vehicleSpawned = CreateVehicle(vehicleToID(vehicleName), xPos, 5+yPos, zPos, angle+90, 0, 0, -1, 0);
		LinkVehicleToInterior(vehicleSpawned, GetPlayerInterior(playerid));
	}

	return 1;
}

COMMAND:dv(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid) == 0) {
		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: You're not in a vehicle");
	}

	if(GetPlayerVehicleSeat(playerid) != 0) {
		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: You're not the driver");
	}

	DestroyVehicle(GetPlayerVehicleID(playerid));
	SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Vehicle deleted");

	return 1;
}

COMMAND:vgod(playerid, params[]) {
	if(isPlayerVGod[playerid] == 0) {
		isPlayerVGod[playerid] = 1;
		if(IsPlayerInAnyVehicle(playerid)) {
			vGodTimer[playerid] = SetTimerEx("fixVehicle", 500, 1, "i", playerid);
		}
		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Vehicle godmode ON");
	} 

	if(isPlayerVGod[playerid] == 1) {
		isPlayerVGod[playerid] = 0;		
		KillTimer(vGodTimer[playerid]);
		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Vehicle godmode OFF");
	}

	return 1;
}

COMMAND:god(playerid, params[]) {
	if(isPlayerGod[playerid] == 0) {
		isPlayerGod[playerid] = 1;
		SetPlayerHealth(playerid,  Float:0x7F800000);

		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Godmode ON");
	}

	if(isPlayerGod[playerid] == 1) {
		isPlayerGod[playerid] = 0;
		SetPlayerHealth(playerid, 100);
		return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Godmode OFF");
	}

	return 1;
}



forward isSkinValid(skinid);
public isSkinValid(skinid) {
	if(skinid >= 0 && skinid <= 311 && skinid != 74) {
		return true;
	}

	return false;
}

forward vehicleToID(vehicleName[]);
public vehicleToID(vehicleName[]) {
	for(new i = 0; i<211; i++) {
		if(strfind(aVehicleNames[i], vehicleName, true) != -1) {
			return i+400;
		}
	}

	return -1;
}

forward fixVehicle(playerid);
public fixVehicle(playerid) {
	RepairVehicle(GetPlayerVehicleID(playerid));
	SetVehicleHealth(GetPlayerVehicleID(playerid), 1000);

	return 1;
}

forward getDriverID(vehicleid);
public getDriverID(vehicleid) {
	for(new i = 0; i<=GetPlayerPoolSize(); i++) {
		if(GetPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_DRIVER) {
			return i;
		}
	}

	return -1;
}

forward removeVehicleAfterDeath(vehicleid);
public removeVehicleAfterDeath(vehicleid) {
	DestroyVehicle(vehicleid);
	return 1;
}

stock getPlayerName(playerid) {
	new pName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pName, MAX_PLAYER_NAME+1);
	return pName;
}
