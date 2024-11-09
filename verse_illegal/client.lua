local availableActions = {}
--Toplama

--Karpuz Toplama
local cord = Config.KarpuzToplama
local sonKarpuz = 1

Citizen.CreateThread(function()
    while true do
        local sleep = 2000  -- Sleep time in milliseconds
        local player = PlayerPedId()  -- Get the player's Ped (character)
        local playercoords = GetEntityCoords(player)  -- Get player coordinates
        local dst = GetDistanceBetweenCoords(playercoords, Config.KarpuzToplama[sonKarpuz].x, Config.KarpuzToplama[sonKarpuz].y, Config.KarpuzToplama[sonKarpuz].z, true)
        
        if dst < 30 then  -- Check if the player is within 20 units of the watermelon
            sleep = 2  -- If the player is close, reduce sleep time for more frequent checks
            DrawMarker(2, Config.KarpuzToplama[sonKarpuz].x, Config.KarpuzToplama[sonKarpuz].y, Config.KarpuzToplama[sonKarpuz].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
            if dst < 1 then  -- Check if the player is within 1 unit for interaction
                DrawText3Ds(Config.KarpuzToplama[sonKarpuz].x, Config.KarpuzToplama[sonKarpuz].y, Config.KarpuzToplama[sonKarpuz].z + 0.3, '[E] Ot Topla')
                if IsControlJustReleased(0, 38) then
                    sonKarpuz = math.random(1, #Config.KarpuzToplama)  -- Randomly select a new watermelon location
                    KarpuzTopla()  -- Call a function to handle picking up the watermelon
                end
            end
        end
        
        Citizen.Wait(sleep)  -- Wait for the specified time before the next iteration
    end
end)


function KarpuzTopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "KarpuzTopla",
            duration = 2000,
            label = 'Ot topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                secured_TriggerServerEvent('xdKokoToplama')
                topluyormu = false
            else
            end
        end)
    end
end

-- Portakal Toplama
local cord = Config.PortakalToplama
local sonPortakal = 1

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.PortakalToplama[sonPortakal].x, Config.PortakalToplama[sonPortakal].y, Config.PortakalToplama[sonPortakal].z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.PortakalToplama[sonPortakal].x, Config.PortakalToplama[sonPortakal].y, Config.PortakalToplama[sonPortakal].z, true)
        if dst2 < 30 then
            sleep = 2
            DrawMarker(2, Config.PortakalToplama[sonPortakal].x, Config.PortakalToplama[sonPortakal].y, Config.PortakalToplama[sonPortakal].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
            if dst2 < 1 then
                DrawText3Ds(Config.PortakalToplama[sonPortakal].x, Config.PortakalToplama[sonPortakal].y, Config.PortakalToplama[sonPortakal].z + 0.3, '[E] Meth Üret')
                if IsControlJustReleased(0, 38) then
                    sonPortakal = math.random(1, #Config.PortakalToplama)
                    PortakalTopla()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function PortakalTopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "PortakalTopla",
            duration = 2000,
            label = 'Meth üretiyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                secured_TriggerServerEvent('xdMethToplama')
                topluyormu = false
            else
            end
        end)
    end
end

function BalTopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "BalTopla",
            duration = 2000,
            label = 'Çilek topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                secured_TriggerServerEvent('xdBalToplama')
                topluyormu = false
            else
            end
        end)
    end
end
--İşleme

--Karpuz
local cord = Config.xdKokoIsleme

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Otları Paketle!')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            secured_TriggerServerEvent("xdKokoIsleme")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

-- Portakal
local cord = Config.xdMethIsleme

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Meth i Paketle!')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            secured_TriggerServerEvent("xdMethIsleme")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)


--Bal
local cord = Config.xdBalIsleme

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Çileği işle!')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            secured_TriggerServerEvent("xdBalIsleme")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)


-- Satış

--Karpuz
local cord = Config.xdKokoSatis

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Paketlenmiş Kokoları Sat')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            secured_TriggerServerEvent("xdKokoSatis")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

--Portakal
local cord = Config.xdMethSatis

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Meth Sat')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            secured_TriggerServerEvent("xdMethSatis")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end



function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

--Bal
local cord = Config.xdBalSatis

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Çilekleri Sat!')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            TriggerServerEvent("CilekSattim")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end


--blips

if Config.xdblipac then
    --Karpuz
    CreateThread(function()
        local blip = AddBlipForCoord(Config.KarpuzToplamaBlip.x, Config.KarpuzToplamaBlip.y, Config.KarpuzToplamaBlip.z)
        SetBlipSprite(blip, 140)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.KarpuzToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.KarpuzIslemeBlip.x, Config.KarpuzIslemeBlip.y, Config.KarpuzIslemeBlip.z)
        SetBlipSprite(blip, 303)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.KarpuzIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.KarpuzSatisBlip.x, Config.KarpuzSatisBlip.y, Config.KarpuzSatisBlip.z)
        SetBlipSprite(blip, 178)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 24)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.KarpuzSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)

    --Portakal
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PortakalToplamaBlip.x, Config.PortakalToplamaBlip.y, Config.PortakalToplamaBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 27)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PortakalToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PortakalIslemeBlip.x, Config.PortakalIslemeBlip.y, Config.PortakalIslemeBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 27)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PortakalIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PortakalSatisBlip.x, Config.PortakalSatisBlip.y, Config.PortakalSatisBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 27)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PortakalSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    --Bal
    CreateThread(function()
        local blip = AddBlipForCoord(Config.BalToplamaBlip.x, Config.BalToplamaBlip.y, Config.BalToplamaBlip.z)
        SetBlipSprite(blip, 365)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BalToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.BalIslemeBlip.x, Config.BalIslemeBlip.y, Config.BalIslemeBlip.z)
        SetBlipSprite(blip, 365)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BalIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.BalSatisBlip.x, Config.BalSatisBlip.y, Config.BalSatisBlip.z)
        SetBlipSprite(blip, 365)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BalSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end


-- NPC
-- Karpuz NPC
local NPC = Config.OtSatisNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
local NPC = Config.OtIslemeNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

-- Portakal NPC
local NPC = Config.MethSatisNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
local NPC = Config.MethIslemeNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

-- Bal NPC
local NPC = Config.BalSatisNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
local NPC = Config.BalIslemeNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

-- Blips
CreateThread(function()
    for _,v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.coord)
        SetBlipSprite(blip, v.sprite)
        SetBlipScale(blip, v.scale)
        SetBlipColour(blip, v.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.text)
        EndTextCommandSetBlipName(blip)
        if not v.radius then
            local blipradius = AddBlipForRadius(v.coord, v.radius)
            SetBlipColour(blipradius, v.radiuscolor)
            SetBlipAlpha(blipradius, v.alpha)
        end
    end
end)
Crouched = false
CrouchedForce = false
Aimed = false
Cooldown = false
PlayerInfo = {
	playerPed = PlayerPedId(),
	playerID = GetPlayerIndex(),
	nextCheck = GetGameTimer() + 1500
}
CoolDownTime = 500 -- in ms

NormalWalk = function()
	SetPedMaxMoveBlendRatio(PlayerInfo.playerPed, 1.0)
	ResetPedMovementClipset(PlayerInfo.playerPed, 0.55)
	ResetPedStrafeClipset(PlayerInfo.playerPed)
	SetPedCanPlayAmbientAnims(PlayerInfo.playerPed, true)
	SetPedCanPlayAmbientBaseAnims(PlayerInfo.playerPed, true)
	ResetPedWeaponMovementClipset(PlayerInfo.playerPed)
	Crouched = false
end
