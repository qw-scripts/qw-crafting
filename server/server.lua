local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qw-crafting:server:craftItem', function(item, location, amount) 

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
        Player.Functions.RemoveItem(v.item, v.amount * amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], 'remove', v.amount * amount)
    end

    Player.Functions.AddItem(item, itemData.amount * amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", itemData.amount * amount)

    if Config.DiscordLog.active then
        local discordData = {
            ["color"] = Config.DiscordLog.color,
            ["type"] = "rich",
            ["title"] = "Crafting Log",
            ["description"] = "**"..GetPlayerName(src).."** has crafted **"..itemData.amount.."x** **"..itemData.name.."**",
            ["footer"] = {
                ["text"] = "qw-crafting",
            },
        }
        PerformHttpRequest(Config.DiscordLog.webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DiscordLog.username, embeds = {discordData}, avatar_url = Config.DiscordLog.image}), { ['Content-Type'] = 'application/json' })
    end
end)


QBCore.Functions.CreateCallback('qw-crafting:server:enoughMaterials', function(source, cb, materials, amountToCraft)
    local src = source
    local hasItems = false
    local idk = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount * amountToCraft then
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