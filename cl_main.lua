QBCore = nil

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

local headMask = false;

RegisterNetEvent('RemoveHeadBag', function(player)
    DeleteEntity(Object);
    SetEntityAsNoLongerNeeded(Object);
    SendNUIMessage({
        ["action"] = "remove"
    })
    headMask = false;
end)

RegisterNetEvent("StartThread", function(player)
    local ped = PlayerPedId();
    local handsup = IsEntityPlayingAnim(ped, "missminuteman_1ig_2", "handsup_base", 1);
    if handsup then
        Object = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true);
        AttachEntityToEntity(Object, ped, GetPedBoneIndex(ped, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true);
        SetEntityCompletelyDisableCollision(Object, false, true);
        SendNUIMessage({
            ["action"] = "open"
        })
        headMask = true;
    end
end)

AddEventHandler("playerSpawned", function()
    DeleteEntity(Object);
    SetEntityAsNoLongerNeeded(Object);
    headMask = false;
end)

RegisterNetEvent("CheckThread")
AddEventHandler("CheckThread", function()
    local closestPlayer, closestDistance = GetClosestPlayer();
    local player = GetPlayerPed(-1);
    if closestPlayer == -1 or closestDistance > 2.0 then
        TriggerEvent("notification", "No players nearby!", "error");
    else
        local handsup = IsEntityPlayingAnim(GetPlayerPed(closestPlayer), "missminuteman_1ig_2", "handsup_base", 1);
        if not headMask then
            if handsup then
                TriggerServerEvent("nc-headbag:getClosestPlayer", GetPlayerServerId(closestPlayer));
                headMask = true;
            end
        else
            TriggerServerEvent("nc-headbag:getClosestPlayer2", GetPlayerServerId(closestPlayer));
            headMask = false;
        end
    end
end)

function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords();
    local closestDistance = -1;
    local closestPlayer = -1;
    local coords = GetEntityCoords(GetPlayerPed(-1));

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then;
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]));
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true);

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i];
                closestDistance = distance;
            end
        end
    end

    return closestPlayer, closestDistance;
end