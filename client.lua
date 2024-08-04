
local ox_target = exports.ox_target
local ox_lib = exports.ox_lib


local searchProps = {
    {model = 'prop_bin_01a', label = 'Poubelle'},
    {model = 'prop_bin_02a', label = 'Poubelle'},
    {model = 'prop_bin_03a', label = 'Poubelle'},
    {model = 'prop_car_01a', label = 'Voiture'},
}


local function searchProp(entity)

    ox_lib:notify({
        type = 'info',
        description = 'Vous fouillez...',
        duration = 5000
    })


    TriggerServerEvent('my_script:search')

 
    Citizen.Wait(5000)
    ox_lib:notify({
        type = 'success',
        description = 'Vous avez trouvé quelque chose!'
    })
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


CreateThread(function()
    initTarget()
end)
