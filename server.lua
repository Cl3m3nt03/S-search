
local ox_inventory = exports.ox_inventory

-- loot
local lootTable = {
    {name = 'bread', amount = 1},
    {name = 'water', amount = 1},
    {name = 'phone', amount = 1},
}

local function giveRandomLoot(player)
    local loot = lootTable[math.random(#lootTable)]
    ox_inventory:AddItem(player, loot.name, loot.amount)
end

RegisterServerEvent('my_script:search')
AddEventHandler('my_script:search', function()
    local player = source
    giveRandomLoot(player)
end)
