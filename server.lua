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
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('redbull', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("Ez_Energetyk:wypij", _source)
    xPlayer.removeInventoryItem("redbull", 1)
    TriggerClientEvent('esx_status:add', _source, 'thirst', 200000)
end)