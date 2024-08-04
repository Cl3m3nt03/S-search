
local ox_target = exports.ox_target
local ox_lib = exports.ox_lib

local searchProps = {
    {model = 'prop_bin_01a', label = 'Poubelle'},
    {model = 'prop_bin_02a', label = 'Poubelle'},
    {model = 'prop_bin_03a', label = 'Poubelle'},
    {model = 'prop_car_01a', label = 'Voiture'},
}


local searchedProps = {}


local cooldownTime = 5 * 60 * 1000


local function searchProp(entity)
    local entityID = NetworkGetNetworkIdFromEntity(entity)


    if searchedProps[entityID] then
        ox_lib:notify({
            type = 'error',
            description = 'Vous avez déjà fouillé cet objet récemment. Essayez plus tard!'
        })
        return
    end


    ox_lib:notify({
        type = 'info',
        description = 'Vous fouillez...',
        duration = 5000
    })


    Citizen.Wait(5000)


    TriggerServerEvent('my_script:search')

    searchedProps[entityID] = true


    Citizen.SetTimeout(cooldownTime, function()
        searchedProps[entityID] = nil
    end)
end


local function initTarget()
    for _, prop in ipairs(searchProps) do
        ox_target:addModel(prop.model, {
            {
                name = prop.label,
                label = 'Fouiller',
                icon = 'fas fa-search',
                onSelect = function(data)
                    searchProp(data.entity)
                end
            }
        }, {distance = 2.0})
    end
end


RegisterNetEvent('my_script:notifyLoot')
AddEventHandler('my_script:notifyLoot', function(foundLoot)
    if foundLoot then
        ox_lib:notify({
            type = 'success',
            description = 'Vous avez trouvé quelque chose!'
        })
    else
        ox_lib:notify({
            type = 'error',
            description = 'Vous n\'avez rien trouvé cette fois.'
        })
    end
end)


CreateThread(function()
    initTarget()
end)
