
local ox_inventory = exports.ox_inventory


local lootTable = {
    {name = 'bread', amount = 1},
    {name = 'water', amount = 1},
    {name = 'phone', amount = 1},
}


local lootChance = 40


local function giveRandomLoot(player)
    local randomNumber = math.random(100) 
    if randomNumber <= lootChance then
        local loot = lootTable[math.random(#lootTable)]
        ox_inventory:AddItem(player, loot.name, loot.amount)
        TriggerClientEvent('my_script:notifyLoot', player, true) 
    else
        TriggerClientEvent('my_script:notifyLoot', player, false) 
    end
end

RegisterServerEvent('my_script:search')
AddEventHandler('my_script:search', function()
    local player = source
    giveRandomLoot(player)
end)
