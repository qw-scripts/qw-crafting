fx_version 'cerulean'
game 'gta5'

description 'qw-crafting'
version '0.1.0'
author 'qwadebot'

server_script {
	'server/*.lua',
}

client_scripts { 
    'client/*.lua',
}
shared_scripts { 'config.lua' }

ui_page 'html/index.html'

files {
	'html/*.*',
}

lua54 'yes'