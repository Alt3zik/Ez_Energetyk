--░█████╗░██╗░░░░░████████╗███████╗███████╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
--██╔══██╗██║░░░░░╚══██╔══╝██╔════╝╚════██║  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
--███████║██║░░░░░░░░██║░░░█████╗░░░░███╔═╝  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
--██╔══██║██║░░░░░░░░██║░░░██╔══╝░░██╔══╝░░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
--██║░░██║███████╗░░░██║░░░███████╗███████╗  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
--╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚══════╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░

--######################################################################################################
--######################################################################################################
--###                                    © 2021 & 2022 AlteZ.                                        ###
--###                                     All rights reserved.                                       ###
--###                Aby otrzymać Permisje do tego Skryptu trzeba skontaktować się z Twórcą          ###
--###################################    Discord:   AlteZ#1245       ###################################
--######################################################################################################
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj), ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local animacja = false

RegisterNetEvent('Ez_Energetyk:wypij')
AddEventHandler('Ez_Energetyk:wypij', function()
    ESX.ShowNotification("Wypiłeś Redbulla")
    if not animacja then
        local prop_name = prop_name or 'prop_ecola_can'
        animacja = true
        local playerPed = GetPlayerPed(-1)
        Citizen.CreateThread(function()
            local x,y,z = table.unpack(GetEntityCoords(playerPed))
            prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
            AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
            RequestAnimDict('mp_player_intdrink')
            while not HasAnimDictLoaded('mp_player_intdrink') do
                Wait(0)
            end
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 3000, 0, 1, true, true, true)
            Wait(3000)
            ESX.ShowNotification("Poczułeś mocny przypływ energii")
            aniamcja = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
        end)
    end
    SetRunSprintMultiplierForPlayer(player, 1.25)
    Wait(30*1000)
    SetRunSprintMultiplierForPlayer(player, 1.0)
end)

