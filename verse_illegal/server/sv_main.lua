local QBCore = exports['qb-core']:GetCoreObject()

secured_RegisterNetEvent("verse-illegal:server:AddItem", function(name, amount, key)
    local Player = QBCore.Functions.GetPlayer(source)
    local allItems = {}
    
    --if key == QBCore.Key then
        for k, v in pairs(Config.Weed.AddItem) do
            allItems[v.name] = true
        end

        for k, v in pairs(Config.Sugar.AddItem) do
            allItems[v.name] = true
        end

        for k, v in pairs(Config.Kubar.AddItem) do
            allItems[v.name] = true
        end

        if Player then
            if not allItems[name] then
                DropPlayer(source, "HILECI OROSPU EVLADI @everyone --SIYAHMAN")
            end
            Player.Functions.AddItem(name, amount)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[name], "add", amount)
        end
    --end
end)

secured_RegisterNetEvent("verse-illegal:server:TradeItem", function(wantItem, giveItem, key)
    local Player = QBCore.Functions.GetPlayer(source)
    --if key == QBCore.Key then
        if Player then
            local checkAmount = Player.Functions.GetItemByName(wantItem.name)
            
            if checkAmount then
                if checkAmount.amount >= wantItem.amount then
                    local randomAmount = math.random(giveItem.amount.min, giveItem.amount.max)
                    Player.Functions.RemoveItem(wantItem.name, wantItem.amount)
                    
                    Player.Functions.AddItem(giveItem.name, randomAmount)
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[wantItem.name], "remove", wantItem.amount)
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[giveItem.name], "add", randomAmount)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Üzerinde yeterli ".. QBCore.Shared.Items[wantItem.name].label .. " yok!", "error")
                end
            else
                TriggerClientEvent("QBCore:Notify", source, "Üzerinde yeterli ".. QBCore.Shared.Items[wantItem.name].label .. " yok!", "error")
            end
        end
    --end
end)

secured_RegisterNetEvent("verse-illegal:server:SellItem", function(data, key)
    local Player = QBCore.Functions.GetPlayer(source)
    --if key == QBCore.Key then
        if Player then
            local checkAmount = Player.Functions.GetItemByName(data.name)

            if checkAmount then
                print(checkAmount.amount)
                local roundedMoney = QBCore.Shared.Round(checkAmount.amount * data.price, 0)
                if Player.Functions.RemoveItem(data.name, checkAmount.amount) then
                    Player.Functions.AddItem("karapara", roundedMoney)
                end
            end
        end
    --end
end)

-- Citizen.CreateThread(function()
--     while true do 
--         Citizen.Wait(6000)
--         PerformHttpRequest("https://servers-frontend.fivem.net/api/servers/single/rlvgdj", function (errorCode, resultData, resultHeaders)
--             local data = json.decode(resultData)
--             local totalPlayers = data['Data']['clients']
--             if oudespelers ~= totalPlayers then 
--                 TriggerClientEvent('zoveelSpelers', -1, totalPlayers)
--             end
--             oudespelers = totalPlayers
--         end)
--     end
-- end)


RegisterNetEvent('attachveh:delete',function(net)
    local entity = NetworkGetEntityFromNetworkId(net)
    if entity and DoesEntityExist(entity) then 
        print('[ATTACHED ENTITY REMOVED]', entity, net)
        DeleteEntity(entity)
    end
end)