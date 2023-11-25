ENABLE_DEBUG_LOG = false
local variant = Tracker.ActiveVariantUID
IS_ITEMS_ONLY = variant:find("itemsonly")
IS_DETAILED = variant:find("detailed")

print("-- BfBB AP Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Items
Tracker:AddItems("items/items.json")

if not IS_ITEMS_ONLY then
    -- Maps
    Tracker:AddMaps("maps/maps.json")
    if IS_DETAILED then
        Tracker:AddMaps(("maps/maps_detailed.json"))
    end
    -- Locations
    if IS_DETAILED then
        Tracker:AddLocations("locations/hb.json")
        Tracker:AddLocations("locations/jf.json")
        Tracker:AddLocations("locations/bb.json")
        Tracker:AddLocations("locations/gl.json")
        Tracker:AddLocations("locations/bc.json")
        Tracker:AddLocations("locations/rb.json")
        Tracker:AddLocations("locations/sm.json")
        Tracker:AddLocations("locations/kf.json")
        Tracker:AddLocations("locations/gy.json")
        Tracker:AddLocations("locations/db.json")
    else
        Tracker:AddLocations("locations/locations.json")
    end

end

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
