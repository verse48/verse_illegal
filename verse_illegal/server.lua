local QBCore = exports['qb-core']:GetCoreObject()


-- Karpuz
secured_RegisterNetEvent("xdKokoToplama")
secured_AddEventHandler("xdKokoToplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("purplehaze", math.random(Config.MeslekMin,Config.MeslekMax))
end)

secured_RegisterNetEvent("xdKokoIsleme")
secured_AddEventHandler("xdKokoIsleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local requiredKarpuz = 5 -- Gereken purplehaze miktarını burada sabit olarak 5 belirliyoruz

    if xPlayer ~= nil and xPlayer.Functions ~= nil then
        local currentKarpuz = xPlayer.Functions.GetItemByName("purplehaze")

        if currentKarpuz ~= nil and currentKarpuz.count >= requiredKarpuz then
            xPlayer.Functions.RemoveItem("purplehaze", requiredKarpuz)
            xPlayer.Functions.AddItem("pktpurplehaze", 1)
            TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Otları Paketledin', length = 2500 })
        else
            TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince otun yok!', length = 2500 })
        end
    else
        print("Error: xPlayer or xPlayer.Functions is nil.")
    end
end)


secured_RegisterNetEvent("xdKokoSatis")
secured_AddEventHandler("xdKokoSatis", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    -- Check if the player has enough watermelon juice to sell
    --print("31")
    if xPlayer.Functions.RemoveItem("pktpurplehaze", Config.MesleksatisMiktar) then
        --print("31")
        -- If successful, add money to the player based on configured values
        xPlayer.Functions.AddItem(Config.MeslekOdeme, Config.KarpuzFiyat)
        -- Notify the player of successful sale
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Paketlenmiş Ot sattın!', length = 2500})
    else
        -- If the player doesn't have enough watermelon juice, notify them of the error
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Paketlenmiş ot yok!', length = 2500})
    end
end)


-- Portakal
secured_RegisterNetEvent("xdMethToplama")
secured_AddEventHandler("xdMethToplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("seker", math.random(Config.MeslekMin,Config.MeslekMax))
end)

secured_RegisterNetEvent("xdMethIsleme")
secured_AddEventHandler("xdMethIsleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local requiredGrapes = 7 

    if xPlayer ~= nil and xPlayer.Functions ~= nil then
        local currentGrapes = xPlayer.Functions.GetItemByName("seker")

        if currentGrapes ~= nil and currentGrapes.count >= requiredGrapes then
            xPlayer.Functions.RemoveItem("seker", requiredGrapes)
            xPlayer.Functions.AddItem("pktseker", 1)
            TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Methi paketledin!', length = 2500})
        else
            TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Methin yok!', length = 2500})
        end
    else
        print("Error: xPlayer or xPlayer.Functions is nil.")
    end
end)


secured_RegisterNetEvent("xdMethSatis")
secured_AddEventHandler("xdMethSatis", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    -- Check if the player has enough grape juice to sell
    if xPlayer.Functions.RemoveItem("pktseker", Config.MesleksatisMiktar) then
        -- If successful, add money to the player based on configured values
        xPlayer.Functions.AddItem(Config.MeslekOdeme, Config.PortakalFiyat)
        -- Notify the player of successful sale
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Meth sattın!', length = 2500})
    else
        -- If the player doesn't have enough grape juice, notify them of the error
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Meth yok!', length = 2500})
    end
end)


-- -- Mandalin
-- RegisterNetEvent("xdMandalinToplama")
-- AddEventHandler("xdMandalinToplama", function()
--     local xPlayer = QBCore.Functions.GetPlayer(source)
--     xPlayer.Functions.AddItem("mandalin", math.random(Config.MeslekMin,Config.MeslekMax))
-- end)

-- RegisterNetEvent("xdMandalinIsleme")
-- AddEventHandler("xdMandalinIsleme", function()
--     local xPlayer = QBCore.Functions.GetPlayer(source)
--     local requiredMandalins = Config.MandalinIslemeMiktar or 1 -- Assuming a default value if Config.MandalinIslemeMiktar is not defined

--     if xPlayer ~= nil and xPlayer.Functions ~= nil then
--         local currentMandalins = xPlayer.Functions.GetItemByName("mandalin")

--         if currentMandalins ~= nil and currentMandalins.count >= requiredMandalins then
--             xPlayer.Functions.RemoveItem("mandalin", requiredMandalins)
--             xPlayer.Functions.AddItem("mandalinsuyu", 1)
--             TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Mandalinin suyunu sıktın!', length = 2500})
--         else
--             TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince mandalinin yok!', length = 2500})
--         end
--     else
--         print("Error: xPlayer or xPlayer.Functions is nil.")
--     end
-- end)


-- RegisterNetEvent("xdMandalinSatis")
-- AddEventHandler("xdMandalinSatis", function()
--     local xPlayer = QBCore.Functions.GetPlayer(source)

--     if xPlayer.Functions.RemoveItem("mandalinsuyu", Config.MesleksatisMiktar) then
--         xPlayer.Functions.AddMoney(Config.MeslekOdeme, Config.MandalinFiyat)
--         TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Mandalin suyunu sattın!', length = 2500})
--     else
--         TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince mandalin suyun yok!', length = 2500})
--     end
-- end)


-- Bal
secured_RegisterNetEvent("xdBalToplama")
secured_AddEventHandler("xdBalToplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("cilek", math.random(Config.MeslekMin,Config.MeslekMax))
end)

secured_RegisterNetEvent("xdBalIsleme")
secured_AddEventHandler("xdBalIsleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local requiredBal = Config.BalIslemeMiktar or 1 -- Assuming a default value if Config.BalIslemeMiktar is not defined

    if xPlayer ~= nil and xPlayer.Functions ~= nil then
        local currentBal = xPlayer.Functions.GetItemByName("cilek")

        if currentBal ~= nil and currentBal.count >= requiredBal then
            xPlayer.Functions.RemoveItem("cilek", requiredBal)
            xPlayer.Functions.AddItem("islenmiscilek", 1)
            TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Çileği İşledin', length = 2500})
        else
            TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince çileğin yok!', length = 2500})
        end
    else
        print("Error: xPlayer or xPlayer.Functions is nil.")
    end
end)


RegisterNetEvent("CilekSattim")
AddEventHandler("CilekSattim", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    --print("sydzyisiktim")

    -- Check if the player has enough processed strawberries to sell
    if xPlayer.Functions.RemoveItem("islenmiscilek", Config.MesleksatisMiktar) then
        -- If successful, add money to the player based on configured values
        xPlayer.Functions.AddMoney(Config.MeslekOdeme, Config.BalFiyat)
        -- Notify the player of a successful sale
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'İşlenmiş çileği sattın!', length = 2500})
    else
        -- If the player doesn't have enough processed strawberries, notify them of the error
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince işlenmiş çileğin yok!', length = 2500})
    end
end)


RegisterNetEvent("baliksat")
AddEventHandler("baliksat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if  xPlayer.Functions.RemoveItem("sharkfish", 1) then
        xPlayer.Functions.AddItem( "karapara", Config.balikFiyat)
        TriggerClientEvent('QBCore:Notify', source, "Köpek Balığı Sattın!", 2500, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, "Yeterince Köpek Balığı Yok!", 2500, 'error')
    end
end)

RegisterNetEvent("kaplumbagasat")
AddEventHandler("kaplumbagasat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if  xPlayer.Functions.RemoveItem("carettacaretta", 1) then
        xPlayer.Functions.AddItem( "karapara", Config.kaplumbaFiyat)
        TriggerClientEvent('QBCore:Notify', source, "Kaplumbağa Sattın!", 2500, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, "Yeterince Kaplumbağa Yok!", 2500, 'error')
    end
end)

RegisterNetEvent("balikksat")
AddEventHandler("balikksat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if  xPlayer.Functions.RemoveItem("anchovy", 1) then
        xPlayer.Functions.AddMoney( "cash", Config.balikkFiyat)
        TriggerClientEvent('QBCore:Notify', source, "Balık Sattın!", 2500, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, "Yeterince Balık Yok!", 2500, 'error')
    end
end)