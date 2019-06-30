local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 126, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 127, ["N9"] = 118
}

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		if (IsControlJustPressed(0,Keys["-"]))  then
			local ped = PlayerPedId()
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				radioActive = true
				if radioActive then
					RequestAnimDict( "random@arrests" )
					while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
						Citizen.Wait( 100 )
					end
					if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
						ClearPedSecondaryTask(ped)
					else
						TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
						local prop_name = prop_name
						local secondaryprop_name = secondaryprop_name
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		if (IsControlJustPressed(0, Keys['X']))  then
			local ped = PlayerPedId()
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
				RequestAnimDict( "random@mugging3" )
				while ( not HasAnimDictLoaded( "random@mugging3" ) ) do 
					Citizen.Wait( 100 )
				end
				if IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base",3) then
					ClearPedSecondaryTask(ped)
				else
					TaskPlayAnim(ped, "random@mugging3", "handsup_standing_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
					local prop_name = prop_name
					local secondaryprop_name = secondaryprop_name
					DetachEntity(prop, 1, 1)
					DeleteObject(prop)
					DetachEntity(secondaryprop, 1, 1)
					DeleteObject(secondaryprop)
				end
			end
		end
	end
end)

Citizen.CreateThread(function(prop_name, secondaryprop_name)
	while true do
		Citizen.Wait(500)
		if IsPedRagdoll(PlayerPedId()) then
			local playerPed = PlayerPedId()
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		end
	end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

-- [[ guarda 1 ]] -- 
Citizen.CreateThread(function()
    local dict = "amb@world_human_leaning@male@wall@back@hands_together@base"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['N5']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ Mão na cabeça ]] --
Citizen.CreateThread(function()
    local dict = "random@arrests@busted"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['M']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "idle_a", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ Assovio ]] -- 
Citizen.CreateThread(function()
    local dict = "rcmnigel1c"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['L']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

--[[MÃOS NA CINTURA
Citizen.CreateThread(function()
    local dict = "amb@code_human_police_investigate@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['F5']) then --Start holding g
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)--]]


--[[ FACEPALM ]] --
Citizen.CreateThread(function()
    local dict = "anim@mp_player_intcelebrationfemale@face_palm"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['N7']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "face_palm", 8.0, 8.0, -1, 50, 0, false, false, false)
                Wait(8500)
                ClearPedTasks(GetPlayerPed(-1))
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ Pamas ]] --
Citizen.CreateThread(function()
    local dict = "anim@mp_player_intcelebrationmale@slow_clap"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['N4']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "slow_clap", 8.0, 8.0, -1, 50, 0, false, false, false)
                Wait(4000)
                ClearPedTasks(GetPlayerPed(-1))
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ JOINHA ]] --
Citizen.CreateThread(function()
    local dict = "mp_action" 
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['N8']) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "thanks_male_06", 8.0, 8.0, -1, 50, 0, false, false, false)
                Wait(2000)
                ClearPedTasks(GetPlayerPed(-1))
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ cruzar braços ]] --
Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 47) then --Start holding h
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

-- [[ cair no chão ]] --
 Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(1, 107) then
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
        end
    end
 end)

-- [[ Cancela as animações ]] --
Citizen.CreateThread(function()
    local dict = "anim@mp_player_intcelebrationfemale@finger_kiss"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Keys['F10']) then
            ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)