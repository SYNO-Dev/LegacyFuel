ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
		end
	end)
end

RegisterServerEvent('fuel:add')
AddEventHandler('fuel:add', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('WEAPON_PETROLCAN')

	if price > 0 then
		if xItem.count >= 1 then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You already have Jerry can', style = { ['background-color'] = '#DF0101', ['color'] = '#000000' } })
		else
			xPlayer.addWeapon('WEAPON_PETROLCAN', 4500)
		end
	
	end
end)
