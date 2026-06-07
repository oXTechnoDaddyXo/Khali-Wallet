local VORPcore =
    exports.vorp_core:GetCore()

RegisterServerEvent(
    'guarma_shop:checkout'
)

AddEventHandler(

    'guarma_shop:checkout',

    function(cart)

        local source = source

        local User =
            VORPcore.getUser(source)

        if not User then
            return
        end

        local Character =
            User.getUsedCharacter

        local firstname =
            Character.firstname

        local lastname =
            Character.lastname

        local charid =
            Character.charIdentifier

        local total = 0

        local purchaseText = ''

        for _, item in pairs(cart) do

            total =
                total +
                (item.buyPrice * item.amount)

            purchaseText =
                purchaseText ..
                item.amount ..
                'x ' ..
                item.label ..
                '\n'
        end

        if Character.money < total then

            TriggerClientEvent(

                'guarma_shop:notify',

                source,

                Config.Locales[
                    Config.Language
                ].not_enough_money,

                'error'
            )

            return
        end

        Character.removeCurrency(
            0,
            total
        )

        for _, item in pairs(cart) do

            exports.vorp_inventory:addItem(

                source,

                item.item,

                item.amount
            )
        end

        local finalMessage =

            Config.Locales[
                Config.Language
            ].purchased_goods ..

            ':\n\n' ..

            purchaseText ..

            '\n' ..

            Config.Locales[
                Config.Language
            ].total_paid ..

            ': $' ..

            total

        TriggerClientEvent(

            'guarma_shop:notify',

            source,

            finalMessage,

            'success'
        )

        TriggerClientEvent(
            'guarma_shop:purchaseEffect',
            source
        )

        if Config.Webhook.enabled then

            local embed = {

                {

                    color = 16753920,

                    title =
                        'Guarma Shop Purchase',

                    description =

                        '**Character:** ' ..
                        firstname ..
                        ' ' ..
                        lastname ..

                        '\n\n**Character ID:** ' ..
                        charid ..

                        '\n\n**Purchased:**\n' ..
                        purchaseText ..

                        '\n**Total Paid:** $' ..
                        total,

                    footer = {

                        text =
                            'Khali Guarma Shop'
                    }
                }
            }

            PerformHttpRequest(

                Config.Webhook.url,

                function(err, text, headers)

                end,

                'POST',

                json.encode({

                    username =
                        'Guarma Shop Logs',

                    embeds = embed
                }),

                {

                    ['Content-Type'] =
                        'application/json'
                }
            )
        end
    end
)