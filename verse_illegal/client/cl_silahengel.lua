local QBCore = exports['qb-core']:GetCoreObject()
-- CreateThread(function()
--     while true do
--         local playerPed = PlayerPedId()
--         local wepHash = GetSelectedPedWeapon(playerPed)
--         if wepHash ~= -1569615261 then
--             if not exports["verse-warzone"]:inZone() then
--                 if QBCore.Shared.Weapons[wepHash] then
--                     local wep = QBCore.Shared.Weapons[wepHash]
--                     if not QBCore.Functions.HasItem(wep.name) then
--                     SetPedAmmo(playerPed, wepHash, 0)
--                     RemoveAllPedWeapons(playerPed, true)
--                     end
--                 end
--             end
--         end
--         Wait(1000)
--     end
-- end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)