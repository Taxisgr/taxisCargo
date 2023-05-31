ESX = nil
LastDelivery = 0.0
isCooldownActive = false
cooldownDuration = Config.Cooldown * 60 * 1000 -- 1 hour in milliseconds

ESX = exports["es_extended"]:getSharedObject()

function StartCooldown()
    isCooldownActive = true
    Citizen.CreateThread(function()
        Citizen.Wait(cooldownDuration)
        isCooldownActive = false
    end)
end

function GetCopsOnline()

	local PoliceConnected = 0
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end
	end

	return PoliceConnected
end



RegisterServerEvent('taxisCargo:resetEvent')
AddEventHandler('taxisCargo:resetEvent', function()
	LastDelivery = 0.0
end)




ESX.RegisterServerCallback('taxisCargo:getCopsOnline', function(source, cb)
	cb(GetCopsOnline())
end)

		RegisterCommand("taxiscooldown", function()
		StartCooldown()
		end)





ESX.RegisterServerCallback('taxisCargo:sellCargo', function(source, cb, scenario)
	local xPlayer = ESX.GetPlayerFromId(source)
	local selectedScenario = Config.Scenarios[scenario]

	if selectedScenario then
		if selectedScenario.CargoItemRewards then
			for _, reward in ipairs(selectedScenario.CargoItemRewards) do
				xPlayer.addInventoryItem(reward.itemName, reward.amount)
			end
		end

		if selectedScenario.CargoWeaponRewards then
			for _, reward in ipairs(selectedScenario.CargoWeaponRewards) do
				xPlayer.addWeapon(reward.weaponName, reward.ammo)
			end
		end 

		if selectedScenario.CargoMoneyReward then
			xPlayer.addAccountMoney(selectedScenario.CargoMoneyRewardType, selectedScenario.CargoMoneyReward)
		end

		TriggerClientEvent('esx:showNotification', source, "You earned the rewards from the cargo.")
		cb(true)
	else
		print("Something went wrong with the delivery of the cargo. Please contact the staff team")
		cb(false)
	end
    StartCooldown()
	LastDelivery = 0.0
end)





ESX.RegisterServerCallback('taxisCargo:buyCargo', function(source, cb, price)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	if (os.time() - LastDelivery) < 200.0 and LastDelivery ~= 0.0 then

		TriggerClientEvent('esx:showNotification', source, "Delivery in progress")
		cb(false)
	else 
		if isCooldownActive then
			print("ep cooldown is active", isCooldownActive, cooldownDuration)
			local msg = "Cooldown is active. Duration: " .. cooldownDuration/60/1000 .. " minutes"
			TriggerClientEvent('taxisCargo:notifyuser', source, msg)
			cb(false)
		else

		police_alarm_time = os.time() + math.random(10000, 20000)

		if Config.UsesBlackMoney then

			if xPlayer.getAccount('black_money').money >= price then

				xPlayer.removeAccountMoney('black_money', price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Not enough ~r~black money~w~.")
	

				cb(false)
			end

		else 

				if xPlayer.getMoney() >= price then

				xPlayer.removeMoney(price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Not enough ~r~money~w~.")
	
				cb(false)
			end
		end
		end

	end

end)