local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    local itemNeed = Config.ChangeObject
	QBCore.Functions.CreateUseableItem(itemNeed.DeleteItem, function(source)
		TriggerClientEvent('FT-watercan:checkwater', source, itemNeed.DeleteItem)
	end)
end)

RegisterNetEvent('FT-watercan:collectingWater')
AddEventHandler('FT-watercan:collectingWater', function()
	xPlayer = QBCore.Functions.GetPlayer(source)
		local itemNeed = Config.ChangeObject
		xPlayer.Functions.RemoveItem(itemNeed.DeleteItem, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemNeed.DeleteItem], "remove")
		xPlayer.Functions.AddItem(itemNeed.GettingItem, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemNeed.GettingItem], "add")
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("^Force_waterCan ^0|^2 Script started successfully.^7")
    print("^Force_waterCan ^0|^5 Version: 1.0.0^7")

end)
