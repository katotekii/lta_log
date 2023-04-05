local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017+ factor, 0.10, 0, 0, 0, 75)
    ClearDrawOrigin()
end


local ltaTable = {}

local timer 

RegisterNetEvent('ltalog:client', function(data)
    ltaTable = {}
    ltaTable = data
    for k,v in pairs(ltaTable) do 
        if not v.id then timer = 1000 else timer = 0 end
    end
end)


local wait = 1000
CreateThread(function()
    while true do

        for k, v in pairs(ltaTable) do
            local coords = GetEntityCoords(PlayerPedId())
            local distance = #(coords - v.coords )
            if distance < 50.0 then
                local text = ('%s has left server\nId: %s\nReason: %s'):format(v.name, v.id, v.reason)
                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, text)
            end
        end

        Wait(timer)
    end
end)
