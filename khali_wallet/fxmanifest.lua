--[[
    ╔═══════════════════════════════════════════════════════════════════╗
    ║                                                                   ║
    ║             W A L L E T   S Y S T E M                             ║
    ║             ─────────────────────────                             ║
    ║              VORP MONEY ITEM SCRIPT                               ║
    ║                 Redemption Script                                 ║
    ║                                                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   Server:    oXTechnoKhaliXo Scripts                              ║
    ║   Creator:   oXTechnoKhaliXo                                      ║
    ║   Discord:   https://discord.gg/8NjehNeEuZ                        ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   © 2026 oXTechnoKhaliXo | All Rights Reserved                    ║
    ╚═══════════════════════════════════════════════════════════════════╝
]]
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'oXTechnoKhaliXo'
description 'A lightweight and immersive Western-style Wallet UI system for RedM using VORP Core.'

shared_script 'config.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

dependencies {
    'vorp_core'
}