
local QBCore = exports['qb-core']:GetCoreObject()
local IsAnimated = false


--Functions
function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

--Events
RegisterNetEvent('FT-watercan:checkwater')
AddEventHandler('FT-watercan:checkwater', function(bool, timer)
    if not IsAnimated then
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
	    	if IsEntityInWater(PlayerPedId()) then
                QBCore.Functions.Progressbar("open_cokedrug_crate", "Refilling Water", 10000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = true,
                    disableCombat = true,
                }, {
                    animDict = "anim@heists@narcotics@funding@gang_idle",
                    anim = "gang_chatting_idle01",
                    flags = 49,
                }, {}, {}, function()
                    IsAnimated = true
                    Wait(timer)
                    IsAnimated = false
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('FT-watercan:collectingWater')
                    QBCore.Functions.Notify('Got Full Can Now', 'success')
                end, function()
                end)
	    	else
                QBCore.Functions.Notify('You are not near a water source', 'error')
	    	end
        else
            QBCore.Functions.Notify('You cannot perform this action from a vehicle', 'error')
	    end
    else
        QBCore.Functions.Notify('You are already interacting with something.', 'error')
    end
end)
