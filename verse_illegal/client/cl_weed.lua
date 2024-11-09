local QBCore = exports['qb-core']:GetCoreObject()
local ScriptData = Config.Weed

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

function SpawnObject(model, coords, cb)
    local model = (type(model) == 'number' and model or GetHashKey(model))
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end

    local obj = CreateObject(model, coords.x, coords.y, coords.z - 1.0, false, false, true)
    FreezeEntityPosition(obj, true)
    if cb then
        cb(obj)
    end
end

function SpawnLoop()
    for k, v in pairs(ScriptData.SpawnsCoords) do
        SpawnObject(ScriptData.Model, v.coords, function(obj)
            if obj then
                ScriptData.SpawnsCoords[k].object = obj -- obj referansını saklayalım
            end
        end)
    end
end

function Pickup(k)
    if ScriptData.SpawnsCoords[k].value ~= 5 then
        QBCore.Functions.Progressbar("weed_pickup", "Toplanıyor", ScriptData.PickupTimeout(), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "creatures@rottweiler@tricks@",
            anim = "petting_franklin",
            flags = 8,
        }, {}, {}, function() -- Done
            ScriptData.SpawnsCoords[k].value = ScriptData.SpawnsCoords[k].value + 1
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

            for k, v in pairs(pass) do
                if v ~= true then
                    secured_TriggerServerEvent("verse-illegal:server:AddItem", ScriptData.AddItem[1].name, ScriptData.AddItem[1].amount, QBCore.Key)
                    return
                end
            end
        end, function()
            QBCore.Functions.Notify("İptal Edildi..", "error")
        end)
    else
        QBCore.Functions.Notify("Bu ağaçta dal kalmadı, biraz beklemelisin", "error")
    end
end

CreateThread(function()
    SpawnLoop()

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
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(ScriptData.SpawnsCoords) do
            local dist = #(playerCoords - vector3(v.coords.x, v.coords.y, v.coords.z))
            if dist < 1.5 then
                QBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z, "[E] - Otu kes")
                if IsControlJustReleased(0, 38) then -- E tuşu
                    Pickup(k)
                end
            end
        end

        for k, v in pairs(ScriptData.Process.Ped.coords) do
            local dist = #(playerCoords - vector3(v.x, v.y, v.z))
            if dist < 1.5 then
                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "[E] - Paketciyle Konus")
                if IsControlJustReleased(0, 38) then -- E tuşu
                    OpenProcess()
                end
            end
        end
    end
end)

RegisterNetEvent("verse-illegal:client:Process", function(id)
    QBCore.Functions.Progressbar("weed_pickup", "Paketleniyor", ScriptData.Process.ProcessTimeout(), false, true, {
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
