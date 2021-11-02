--MADE BY HAVASIZ PLEASE DO NOT SHARE IT WITHOUT MY PERMISSIONS.

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('parasut', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local parasut = xPlayer.getInventoryItem('parasut') -- Database item adı. / Database item name.

	if parasut.count > 0 then
		xPlayer.removeInventoryItem('parasut', 1)
		TriggerClientEvent('esx_hvszparasut:startparasut', _source)
	end
end)
