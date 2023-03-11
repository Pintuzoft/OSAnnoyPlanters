#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

/**
 * 
 * Plugin to annoy planting players with randomly dropping the bomb at their feet. but not always. and not when round time is less than 10 seconds. 
 *
 */


public Plugin myinfo = {
	name = "OSAnnoyPlanters",
	author = "Pintuz",
	description = "OldSwedes Annoy Planters plugin",
	version = "0.01",
	url = "https://github.com/Pintuzoft/OSAnnoyPlanters"
}

public void OnPluginStart() {
    HookEvent("bomb_beginplant", Event_BeginPlant);
}

public Action Event_BeginPlant(Handle event, const char[] name, bool dontBroadcast) {
    int userid = GetEventInt(event, "userid");
    int entindex = GetEventInt(event, "entindex");
    int player = GetEventInt(event, "player");
 
    if (GetRandomInt(0, 100) > 90) {
        SetEntProp(entindex, Prop_Send, "m_bBombDropped", true);
    }
    return Plugin_Continue;
}

