-- Bu kod, oyuncu arabada iken fare sol ve sağ tuşlarına basmasını engeller.

local blockMouseClicks = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerId()

        if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if DoesEntityExist(vehicle) then
                if (IsControlJustPressed(0, 24) or IsControlJustPressed(0, 25)) and not blockMouseClicks then
                    blockMouseClicks = true
                end
            else
                blockMouseClicks = false
            end

            if blockMouseClicks and (IsDisabledControlPressed(0, 24) or IsDisabledControlPressed(0, 25)) then
                DisableControlAction(0, 24, true)  -- 24, fare sol tuşunun kontrol kodudur
                DisableControlAction(0, 25, true)  -- 25, fare sağ tuşunun kontrol kodudur
            end
        end
    end
end)
