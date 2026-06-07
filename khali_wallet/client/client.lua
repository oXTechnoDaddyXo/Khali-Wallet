local VORPcore =
    exports.vorp_core:GetCore()

local shopOpen = false

local ShopPrompt = nil
local PromptGroup = GetRandomIntInRange(0, 0xffffff)

CreateThread(function()

    local str =
        Config.Locales[
            Config.Language
        ].open_shop

    ShopPrompt =
        PromptRegisterBegin()

    PromptSetControlAction(
        ShopPrompt,
        0x760A9C6F
    )

    str =
        CreateVarString(
            10,
            'LITERAL_STRING',
            str
        )

    PromptSetText(
        ShopPrompt,
        str
    )

    PromptSetEnabled(
        ShopPrompt,
        false
    )

    PromptSetVisible(
        ShopPrompt,
        false
    )

    PromptSetHoldMode(
        ShopPrompt,
        true
    )

    PromptRegisterEnd(
        ShopPrompt
    )
end)

CreateThread(function()

    local blip =
        Citizen.InvokeNative(
            0x554D9D53F696D002,
            1664425300,
            Config.Shop.coords
        )

    SetBlipSprite(
        blip,
        joaat('blip_shop_store'),
        true
    )

    SetBlipScale(
        blip,
        0.2
    )

    Citizen.InvokeNative(
        0x9CB1A1623062F402,
        blip,
        Config.Locales[
            Config.Language
        ].shop_name
    )
end)

CreateThread(function()

    while true do

        local sleep = 1500

        local playerPed =
            PlayerPedId()

        local coords =
            GetEntityCoords(
                playerPed
            )

        local distance =
            #(coords - Config.Shop.coords)

        if distance < Config.MarkerDistance then

            sleep = 0

            local x,y,z =
                table.unpack(
                    Config.Shop.coords
                )

            DrawMarker(

                28,

                x,
                y,
                z - 0.95,

                0.0,
                0.0,
                0.0,

                0.0,
                0.0,
                0.0,

                0.35,
                0.35,
                0.35,

                255,
                205,
                90,
                190,

                false,
                true,
                2,
                false,
                nil,
                nil,
                false
            )
        end

        if distance < Config.PromptDistance
        and not shopOpen then

            sleep = 0

            local label =
                CreateVarString(

                    10,

                    'LITERAL_STRING',

                    Config.Locales[
                        Config.Language
                    ].shop_name
                )

            PromptSetActiveGroupThisFrame(
                PromptGroup,
                label
            )

            PromptSetEnabled(
                ShopPrompt,
                true
            )

            PromptSetVisible(
                ShopPrompt,
                true
            )

            if PromptHasHoldModeCompleted(
                ShopPrompt
            ) then

                Wait(500)

                OpenShop()
            end

        else

            PromptSetEnabled(
                ShopPrompt,
                false
            )

            PromptSetVisible(
                ShopPrompt,
                false
            )
        end

        Wait(sleep)
    end
end)

function OpenShop()

    if shopOpen then
        return
    end

    shopOpen = true

    SetNuiFocus(
        true,
        true
    )

    SendNUIMessage({

        action = 'open',

        items = Config.Items,

        imagePath =
            Config.InventoryImagePath,

        locale =
            Config.Locales[
                Config.Language
            ]
    })
end

function CloseShop()

    shopOpen = false

    SetNuiFocus(
        false,
        false
    )

    SendNUIMessage({

        action = 'close'
    })
end

RegisterNUICallback(
    'close',
    function(_, cb)

        CloseShop()

        cb('ok')
    end
)

RegisterNUICallback(
    'checkout',
    function(data, cb)

        TriggerServerEvent(
            'guarma_shop:checkout',
            data.cart
        )

        CloseShop()

        cb('ok')
    end
)

RegisterNetEvent(
    'guarma_shop:notify'
)

AddEventHandler(

    'guarma_shop:notify',

    function(message, notifyType)

        if notifyType == 'success' then

            VORPcore.NotifyLeft(

                Config.Locales[
                    Config.Language
                ].shop_name,

                message,

                'generic_textures',

                'tick',

                5000,

                'COLOR_GREEN'
            )

        elseif notifyType == 'error' then

            VORPcore.NotifyLeft(

                Config.Locales[
                    Config.Language
                ].shop_name,

                message,

                'menu_textures',

                'cross',

                5000,

                'COLOR_RED'
            )
        end
    end
)

RegisterNetEvent(
    'guarma_shop:purchaseEffect'
)

AddEventHandler(

    'guarma_shop:purchaseEffect',

    function()

        local ped =
            PlayerPedId()

        local coords =
            GetEntityCoords(
                ped
            )

        UseParticleFxAsset(
            'scr_rcbarry2'
        )

        StartNetworkedParticleFxNonLoopedAtCoord(

            'scr_mp_treasure_chest',

            coords.x,
            coords.y,
            coords.z + 1.0,

            0.0,
            0.0,
            0.0,

            1.2,

            false,
            false,
            false
        )

        UseParticleFxAsset(
            'core'
        )

        StartNetworkedParticleFxNonLoopedAtCoord(

            'ent_anim_cig_smoke',

            coords.x,
            coords.y,
            coords.z + 0.8,

            0.0,
            0.0,
            0.0,

            0.8,

            false,
            false,
            false
        )
    end
)