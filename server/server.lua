local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qw-crafting:server:craftItem', function(item, location) 

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not Config.CraftingLocations[location] then
        -- DropPlayer(src, 'Attempted Exploit Abuse (Crafting)')
        print('Not the Same Location (Exploit)')
    end

    -- if Config.CraftingLocations[location].items[item] ~= item then
    --     -- DropPlayer(src, 'Attempted Exploit Abuse (Crafting)')
    --     print('Not the Same Item (Exploit) - Got: '..item)
    --     print('was looking for: '..Config.CraftingLocations[location].items[item])
    -- end

    local itemData = Config.CraftingLocations[location].items[item]

    for k, v in pairs(itemData.materialsNeeded) do
        Player.Functions.RemoveItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], 'remove', v.amount)
    end

    Player.Functions.AddItem(item, item.amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", item.amount)
end)


QBCore.Functions.CreateCallback('qw-crafting:server:enoughMaterials', function(source, cb, materials)
    local src = source
    local hasItems = false
    local idk = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            idk = idk + 1
            if idk == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)