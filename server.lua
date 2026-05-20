local ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.ResetCommand, function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    local group = xPlayer.getGroup()

    if not Config.AllowedGroups[group] then
        TriggerClientEvent('esx:showNotification', source, _L('reset_no_permission'))
        return
    end

    local targetId = tonumber(args[1])

    if not targetId then
        TriggerClientEvent('esx:showNotification', source, _L('reset_usage', Config.ResetCommand))
        return
    end

    local targetPlayer = ESX.GetPlayerFromId(targetId)

    if not targetPlayer then
    TriggerClientEvent('esx:showNotification', source, _L('player_not_found'))
    return
end

    TriggerClientEvent('crp:combatTimeoutReset', targetId)
    TriggerClientEvent('esx:showNotification', source, _L('reset_success', targetId))
end, false)

-- Diese Callback-Funktion liefert dem Client die echte Dimension
ESX.RegisterServerCallback('deathtimeout:checkBucket', function(source, cb)
    local bucket = GetPlayerRoutingBucket(source)
    cb(bucket)
end)