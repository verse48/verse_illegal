local QBCore = exports['qb-core']:GetCoreObject()
local ScriptData = Config.Sugar

local function OpenProcess()
    local menu = {
        {
            header = "Paketleme",
            isMenuHeader = true,
        },
    }

    for k, v in pairs(ScriptData.Process.Menu) do
        menu[#menu+1] = v
    end

    exports["qb-menu"]:openMenu(menu)
end

function MakeSugar()
    QBCore.Functions.Progressbar("sugar_make", "Yapılıyor", ScriptData.PickupTimeout(), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        flags = 8,
    }, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId())
        local pass = {}

        for k, v in pairs(ScriptData.AddItem) do
            local chance = math.random(1, 100)

            if chance < v.chance then
                pass[#pass+1] = true
                secured_TriggerServerEvent("verse-illegal:server:AddItem", v.name, v.amount, QBCore.Key)
                return
            else
                pass[#pass+1] = false
            end
        end

        print(json.encode(pass))

        for k, v in pairs(pass) do
            if v ~= true then
                secured_TriggerServerEvent("verse-illegal:server:AddItem", ScriptData.AddItem[1].name, ScriptData.AddItem[1].amount, QBCore.Key)
                return
            end
        end
    end, function()
        QBCore.Functions.Notify("İptal Edildi..", "error")
    end)
end

CreateThread(function()
    RequestModel(ScriptData.Process.Ped.model)
    while not HasModelLoaded(ScriptData.Process.Ped.model) do
        Wait(1)
    end

    for k, v in pairs(ScriptData.Process.Ped.coords) do
        local processPed = CreatePed(4, ScriptData.Process.Ped.model, v.x, v.y, v.z, v.w, false, true)
        FreezeEntityPosition(processPed, true)
        SetEntityInvincible(processPed, true)
        SetBlockingOfNonTemporaryEvents(processPed, true)
    end

    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        -- "Şeker Yap" işlemi için E tuşu etkileşimi
        for k, v in pairs(ScriptData.CraftLocation) do
            local dist = #(playerCoords - vector3(v.coords.x, v.coords.y, v.coords.z))
            if dist < 1.5 then
                QBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z, "[E] - Seker Yap")
                if IsControlJustReleased(0, 38) then -- E tuşu
                    MakeSugar()
                end
            end
        end

        -- "Konuş" işlemi için E tuşu etkileşimi
        for k, v in pairs(ScriptData.Process.Ped.coords) do
            local dist = #(playerCoords - vector3(v.x, v.y, v.z))
            if dist < 1.3 then
                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "[E] - Paketciyle Konus")
                if IsControlJustReleased(0, 38) then -- E tuşu
                    OpenProcess()
                end
            end
        end
    end
end)

RegisterNetEvent("verse-illegal:client:SugarProcess", function(id)
    QBCore.Functions.Progressbar("sugar_process", "Paketleniyor", ScriptData.Process.ProcessTimeout(), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        secured_TriggerServerEvent("verse-illegal:server:TradeItem", ScriptData.Process.Menu[id].wantItem, ScriptData.Process.Menu[id].giveItem, QBCore.Key)
    end, function()
        QBCore.Functions.Notify("İptal Edildi..", "error")
    end)
end)
