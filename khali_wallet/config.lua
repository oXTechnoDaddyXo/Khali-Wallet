Config = {}

Config.Language = 'DE'
-- EN / DE

Config.PromptDistance = 2.0
Config.MarkerDistance = 10.0

Config.Webhook = {

    enabled = true,

    url = 'https://discord.com/api/webhooks/1407703577001984090/PDe_0FuP4AChyyCQ1P03Xu5X1J1t8q3yDXzZkZwy1tmaXZeXcjq_2JTds9tJRzqKL50P'
}

Config.Locales = {

    ['EN'] = {

        shop_name =
            'GUARMA MERCHANT COMPANY',

        shop_subtitle =
            'Imported Colonial Goods • Premium Island Supplies',

        welcome_title =
            'Welcome To Guarma',

        welcome_text =

            'The finest merchant company on the island. ' ..
            'Purchase supplies, luxury goods and essential equipment ' ..
            'for your adventures across Guarma.',

        cart_title =
            'Shopping Cart',

        checkout =
            'Purchase Goods',

        close =
            'Leave Store',

        add_to_cart =
            'Add To Cart',

        all =
            'All',

        price =
            'Price',

        amount =
            'Amount',

        total =
            'Total',

        remove =
            'Remove',

        purchased_goods =
            'Purchased Goods',

        total_paid =
            'Total Paid',

        not_enough_money =
            'Not enough money.',

        open_shop =
            'Open Guarma Merchant Company'
    },

    ['DE'] = {

        shop_name =
            'GUARMA HANDELSGESELLSCHAFT',

        shop_subtitle =
            'Importierte Kolonialwaren • Exklusive Insel Versorgung',

        welcome_title =
            'Willkommen Auf Guarma',

        welcome_text =

            'Die beste Handelsgesellschaft der Insel. ' ..
            'Kaufe Vorräte, Luxuswaren und wichtige Ausrüstung ' ..
            'für deine Abenteuer auf Guarma.',

        cart_title =
            'Warenkorb',

        checkout =
            'Waren Kaufen',

        close =
            'Shop Verlassen',

        add_to_cart =
            'Zum Warenkorb',

        all =
            'Alle',

        price =
            'Preis',

        amount =
            'Menge',

        total =
            'Gesamt',

        remove =
            'Entfernen',

        purchased_goods =
            'Gekaufte Waren',

        total_paid =
            'Gesamt Bezahlt',

        not_enough_money =
            'Nicht genug Geld.',

        open_shop =
            'Guarma Handelsgesellschaft Öffnen'
    }
}

Config.Shop = {

    coords = vector3(
        1283.95,
        -6870.87,
        43.4
    )
}

Config.InventoryImagePath =
    'nui://vorp_inventory/html/img/items/'

Config.Items = {

    {
        label = 'Sauberes Wasser',

        item = 'bcc_clean_bottle',

        image = 'bcc_clean_bottle.png',

        buyPrice = 1.60,

        category = 'Trinken'
    },

    {
        label = 'Striegel',

        item = 'horsebrush',

        image = 'horsebrush.png',

        buyPrice = 4.40,

        category = 'Gegenstände'
    },

    {
        label = 'Vodka',

        item = 'vodka',

        image = 'vodka.png',

        buyPrice = 12,

        category = 'Luxus'
    },

    {
        label = 'Feldflasche',

        item = 'canteen',

        image = 'canteen.png',

        buyPrice = 3.99,

        category = 'Gegenstände'
    },

    {
        label = 'Bluegil',

        item = 'consumable_bluegil',

        image = 'consumable_bluegil.png',

        buyPrice = 2.40,

        category = 'Essen'
    }
}