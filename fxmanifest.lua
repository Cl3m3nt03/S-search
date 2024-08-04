fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Slayze'
description 'Script de fouille avec loot pour FiveM utilisant ox_target et ox_lib'
version '1.0.0'

-- Les fichiers à inclure
client_scripts {
    '@ox_lib/init.lua', 
    'client.lua'
}

server_scripts {
    '@ox_lib/init.lua', 
    'server.lua'
}


dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory' -- Si utilisé pour gérer les items
}
