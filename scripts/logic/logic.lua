function has_so(n)
    local count = Tracker:ProviderCountForCode('so_100') * 100 +
                    Tracker:ProviderCountForCode('so_250') * 250 +
                    Tracker:ProviderCountForCode('so_500') * 500 +
                    Tracker:ProviderCountForCode('so_750') * 750 +
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