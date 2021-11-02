--MADE BY HAVASİZ PLEASE DO NOT SHARE IT WITHOUT MY PERMISSIONS.

RegisterNetEvent('esx_hvszparasut:startparasut')
AddEventHandler('esx_hvszparasut:startparasut', function()
	local ped = PlayerPedId()

	GiveWeaponToPed(ped, GetHashKey("GADGET_PARACHUTE"), true)
	StartParaCheck()
end)

function StartParaCheck() 
	print("start")
	SetPedComponentVariation(PlayerPedId(), 5, 7, 0, 1) --Paraşüt itemini kullandığınızda sırtınızda spawn olan paraşüt (İsterseniz değiştirebilirsiniz)
	Citizen.CreateThread(function()
		local ped = PlayerPedId()

		while true do
			local state = GetPedParachuteState(ped)

			if state == 2 then
				StartLandCheck()
				return
			end
		Citizen.Wait(1)
		end
	end)
end

function StartLandCheck()
	local ped = PlayerPedId()

	Citizen.CreateThread(function()
		while true do
			local state = GetPedParachuteState(ped)

			if state == -1 then
				SetPedComponentVariation(ped, 5, 0, 0, 0) --Yere iniş gerçekleştirdikten sonra sırtınızdaki paraşütün yok olması, isterseniz yok olduktan sonra çanta v.b. spawn ettirebilirsiniz burakadi kodlari değiştirerek.
				return
			end
			Citizen.Wait(1)
		end
	end)
end