function has_so(n)
    local count = Tracker:ProviderCountForCode('so_100') * 100 + Tracker:ProviderCountForCode('so_250') * 250 +
                      Tracker:ProviderCountForCode('so_500') * 500 + Tracker:ProviderCountForCode('so_750') * 750 +
                      Tracker:ProviderCountForCode('so_1000') * 1000
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_so: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1
    end
    return 0
end

DEFAULT_GATE_COSTS = {
    -- ['Pineapple->Hub1']= 1,
    ['Hub1->BB01'] = 5,
    ['Hub1->GL01'] = 10,
    ['Hub1->Poseidome'] = 15,
    ['Hub2->RB01'] = 25,
    ['Hub2->SM01'] = 30,
    ['Hub2->IP'] = 40,
    ['Hub3->KF01'] = 50,
    ['Hub3->GY01'] = 60,
    ['Chum Bucket->CB Lab'] = 75
}

function has_spats_for_gate(gate)
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_spats_for_gate: gate: %s,", gate))
    end
    local costs = {}
    if not SLOT_DATA then
        costs = DEFAULT_GATE_COSTS
    elseif not SLOT_DATA.gate_costs then
        costs = DEFAULT_GATE_COSTS
    else
        costs = SLOT_DATA.gate_costs
    end
    if not costs[gate] then
        print(string.format("has_spats_for_gate called for invalid gate %s", gate))
        return 0
    end
    local spats = Tracker:ProviderCountForCode('spat')
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_spats_for_gate: spats: %s, costs[gate]: %s", spats, costs[gate]))
    end
    if spats >= costs[gate] then
        return 1
    end
    return 0
end

function include_socks()
    if not SLOT_DATA then
        return 1
    end
    if not SLOT_DATA['include_socks'] then
        return 1
    end
    if SLOT_DATA['include_socks'] == 1 then
        return 1
    else
        return 0
    end
end

function include_skills()
    if not SLOT_DATA then
        return 1
    end
    if not SLOT_DATA['include_skills'] then
        return 1
    end
    if SLOT_DATA['include_skills'] == 1 then
        return 1
    else
        return 0
    end
end

function not_include_skills()
    local val = include_skills()
    if val == 1 then
        return 0
    else
        return 1
    end
end

function include_golden_underwear()
    if not SLOT_DATA then
        return 1
    end
    if not SLOT_DATA['include_golden_underwear'] then
        return 1
    end
    if SLOT_DATA['include_golden_underwear'] == 1 then
        return 1
    else
        return 0
    end
end

function include_level_items()
    if not SLOT_DATA then
        return 1
    end
    if not SLOT_DATA['include_level_items'] then
        return 1
    end
    if SLOT_DATA['include_level_items'] == 1 then
        return 1
    else
        return 0
    end
end

function not_include_level_items()
    local val = include_level_items()
    if val == 1 then
        return 0
    else
        return 1
    end
end

function include_purple_so()
    if not SLOT_DATA then
        return 1
    end
    if not SLOT_DATA['include_purple_so'] then
        return 1
    end
    if SLOT_DATA['include_purple_so'] == 1 then
        return 1
    else
        return 0
    end
end
