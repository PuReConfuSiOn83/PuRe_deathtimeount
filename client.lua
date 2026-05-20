local ESX = exports['es_extended']:getSharedObject()
local combatBlocked = false
local combatEnd = 0
local isThreadRunning = false
local isDead = false

-- Zeichnet den Timer (Nur sichtbar in Dimension 0)
local function DrawTimerText(text)
    SetTextFont(4)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.85, 0.5)
end

-- Startet die Sperre
local function StartCombatBlock(seconds)
    -- Wir fragen den Server nach der aktuellen Dimension
    ESX.TriggerServerCallback('deathtimeout:checkBucket', function(currentBucket)
        -- NUR wenn wir in Dimension 0 sind, wird der Rest ausgeführt
        if currentBucket ~= 0 then
            return
        end

        if combatBlocked then
            combatEnd = GetGameTimer() + (seconds * 1000)
            return
        end

        combatBlocked = true
        combatEnd = GetGameTimer() + (seconds * 1000)

        -- Waffe entziehen via ox_inventory
        TriggerServerEvent('ox_inventory:disarm', true)

        if isThreadRunning then return end
        isThreadRunning = true

        CreateThread(function()
            while combatBlocked do
                local ped = PlayerPedId()
                local timeLeft = math.ceil((combatEnd - GetGameTimer()) / 1000)

                -- Falls Zeit um: Ende
                if timeLeft <= 0 then
                    combatBlocked = false
                    break
                end

                -- Sicherheitscheck: Falls man währenddessen die Dimension wechselt
                -- (Optional: für maximale Performance hier nur alle paar Sekunden prüfen)
                DrawTimerText(_L('combat_disabled_timer', timeLeft))

                -- Kampfhandlungen unterbinden
                if GetSelectedPedWeapon(ped) ~= `WEAPON_UNARMED` then
                    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                end

                DisablePlayerFiring(ped, true)
                DisableControlAction(0, 24, true)  -- Attack
                DisableControlAction(0, 25, true)  -- Aim
                DisableControlAction(0, 140, true) -- Melee
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
                DisableControlAction(0, 257, true)

                for i = 157, 163 do
                    DisableControlAction(0, i, true)
                end

                Wait(0)
            end

            isThreadRunning = false

            -- Benachrichtigung NUR in Dimension 0
            ESX.ShowNotification(_L('combat_ready_again'))
        end)
    end)
end

-- Automatischer Check beim Revive
CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local isCurrentlyDead = IsEntityDead(playerPed) or GetEntityHealth(playerPed) <= 0

        if isCurrentlyDead and not isDead then
            isDead = true
        elseif not isCurrentlyDead and isDead then
            isDead = false
            Wait(1000) -- Warten bis Spawn fertig
            StartCombatBlock(Config.CombatBlockTime)
        end

        Wait(1000)
    end
end)

-- Event Handler für Revive
RegisterNetEvent(Config.ReviveEvent, function()
    Wait(500)
    StartCombatBlock(Config.CombatBlockTime)
end)

RegisterNetEvent('crp:combatTimeoutReset', function()
    combatBlocked = false
end)