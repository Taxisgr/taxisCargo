Config                        	= {}


Config.BlipSprite = 67 --Change map blip using spites from here https://docs.fivem.net/docs/game-references/blips/
Config.BlipSpriteColor = 1 --Change map blip color from here https://docs.fivem.net/docs/game-references/blips/#blip-colors
Config.BlipSpriteName = 'Cargo Provider'

Config.Redzone = true --Redzone Visible to all players following the cargo van
Config.RedzoneUpdate = 1500 --In Ms. How many milliseconds to update redzone. RECOMMENDED VALUE : 1500 (Resmon 0.02). Smallest values will lead to bad performance


Config.Cooldown = 1 --In minutes (global cooldown)

-- Change this to false if you want white money (for cargo purchase)
Config.UsesBlackMoney			= true

--Hash of the npc ped. Change only if you know what you are doing.
Config.NPCHash					= 349680864 			

--Random time in which societies will get alerted. This is a range in seconds.
Config.AlertCopsDelayRangeStart	= 50
Config.AlertCopsDelayRangeEnd	= 60

--If you dont want to notify ONLY THE POLICE add extra societies here. example { "taxismafia", "carteldesinaloa" }
Config.AlertExtraSocieties 		= { }


Config.CargoProviderLocation	= { x = 483.6, y = -3382.69, z = 5.1, h = 355.02 }


Config.CargoDeliveryLocations 	= { --add as many locations you want

		{ x = 731.89, y = 4172.27, z = 39.3 },
		{ x = 1959.28, y = 3845.48, z = 31.2 },
		{ x = 388.76, y = 3591.34, z = 32.09},
		{ x = 97.24, y = 3739.86, z = 38.8}

}


Config.Scenarios = { --Add as many as you want
	
	{ 
		SpawnPoint = { x = 478.92, y = -3371.19, z = 5.5, h = 5.77 }, 
		DeliveryPoint = 6.0,
		VehicleName = "burrito3",
		MinCopsOnline = 0,
		CargoCost = 2500,
		CargoMoneyReward = 5000, --Change this value to false if you dont want to give money reward
		CargoMoneyRewardType = 'black_money',
		CargoItemRewards = { --add as many as you want (you can also delete it)
			{ itemName = "bread", amount = 2 },
			{ itemName = "water", amount = 1 },
		},
		CargoWeaponRewards = { --add as many as you want (you can also delete it)
			{ weaponName = "WEAPON_PISTOL", ammo = 1000 },
			{ weaponName = "WEAPON_SMG", ammo = 500 },
		}
	
	},

	{ 
		SpawnPoint = { x = 478.92, y = -3371.19, z = 5.5, h = 5.77 }, 
		DeliveryPoint = 6.0,
		VehicleName = "burrito3",
		MinCopsOnline = 2,
		CargoCost = 5000,
		CargoMoneyReward = 5000, --Change this value to false if you dont want to give money reward
		CargoMoneyRewardType = 'black_money',
		CargoItemRewards = { --add as many as you want (you can also delete it)
			{ itemName = "bread", amount = 2 },
			{ itemName = "water", amount = 1 },
		},
		CargoWeaponRewards = { --add as many as you want (you can also delete it)
			{ weaponName = "WEAPON_PISTOL", ammo = 1000 },
			{ weaponName = "WEAPON_SMG", ammo = 500 },
		}
	
	},
	{ 
		SpawnPoint = { x = 478.92, y = -3371.19, z = 5.5, h = 5.77 },  
		DeliveryPoint = 6.0,
		VehicleName = "burrito3",
		MinCopsOnline = 5,
		CargoCost = 15000,
		CargoMoneyReward = 5000, --Change this value to false if you dont want to give money reward
		CargoMoneyRewardType = 'black_money',
		CargoItemRewards = { --add as many as you want (you can also delete it)
			{ itemName = "bread", amount = 2 },
			{ itemName = "water", amount = 1 },
		},
		CargoWeaponRewards = { --add as many as you want (you can also delete it)
			{ weaponName = "WEAPON_PISTOL", ammo = 1000 },
			{ weaponName = "WEAPON_SMG", ammo = 500 },
		}
	
	}
}