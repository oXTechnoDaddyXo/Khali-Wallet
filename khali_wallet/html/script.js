const body =
    document.body

const itemsDiv =
    document.getElementById('items')

const categoriesDiv =
    document.getElementById('categories')

const cartItemsDiv =
    document.getElementById('cartItems')

const totalPrice =
    document.getElementById('totalPrice')

const closeBtn =
    document.getElementById('closeBtn')

const checkoutBtn =
    document.getElementById('checkoutBtn')

let currentItems = []

let imagePath = ''

let cart = []

let locale = {}

window.addEventListener(
    'message',
    function(event) {

        const data = event.data

        if (data.action === 'open') {

            body.style.display = 'flex'

            currentItems = data.items

            imagePath = data.imagePath

            locale = data.locale

            document.getElementById(
                'shopTitle'
            ).innerText =
                locale.shop_name

            document.getElementById(
                'shopSubtitle'
            ).innerText =
                locale.shop_subtitle

            document.getElementById(
                'welcomeTitle'
            ).innerText =
                locale.welcome_title

            document.getElementById(
                'welcomeText'
            ).innerText =
                locale.welcome_text

            document.getElementById(
                'cartTitle'
            ).innerText =
                locale.cart_title

            document.getElementById(
                'checkoutText'
            ).innerText =
                locale.checkout

            document.getElementById(
                'closeText'
            ).innerText =
                locale.close

            loadCategories(currentItems)

            loadItems(currentItems)

            updateCart()
        }
    }
)

function loadCategories(items) {

    categoriesDiv.innerHTML = ''

    const categories = [

        ...new Set(
            items.map(
                i => i.category
            )
        )
    ]

    const allBtn =
        document.createElement('div')

    allBtn.className =
        'category'

    allBtn.innerText =
        locale.all

    allBtn.onclick =
        () => loadItems(items)

    categoriesDiv.appendChild(allBtn)

    categories.forEach(category => {

        const btn =
            document.createElement('div')

        btn.className =
            'category'

        btn.innerText =
            category

        btn.onclick = () => {

            loadItems(

                items.filter(

                    i =>
                    i.category === category
                )
            )
        }

        categoriesDiv.appendChild(btn)
    })
}

function loadItems(items) {

    itemsDiv.innerHTML = ''

    items.forEach(item => {

        const div =
            document.createElement('div')

        div.className =
            'item'

        div.innerHTML = `

            <img src="${imagePath}${item.image}">

            <h2>${item.label}</h2>

            <div class="price">
                ${locale.price}: $${item.buyPrice}
            </div>

            <input
                type="number"
                class="amountInput"
                min="1"
                value="1"
            >

            <button class="buyBtn">
                ${locale.add_to_cart}
            </button>
        `

        const amountInput =
            div.querySelector('.amountInput')

        div.querySelector('.buyBtn')
        .addEventListener('click', () => {

            let amount =
                parseInt(amountInput.value)

            if (
                isNaN(amount)
                ||
                amount <= 0
            ) {

                amount = 1
            }

            addToCart(item, amount)
        })

        itemsDiv.appendChild(div)
    })
}

function addToCart(item, amount) {

    const existing =
        cart.find(
            i => i.item === item.item
        )

    if (existing) {

        existing.amount += amount

    } else {

        cart.push({

            label:
                item.label,

            item:
                item.item,

            buyPrice:
                item.buyPrice,

            amount:
                amount
        })
    }

    updateCart()
}

function updateCart() {

    cartItemsDiv.innerHTML = ''

    let total = 0

    cart.forEach((item, index) => {

        total +=
            item.buyPrice *
            item.amount

        const div =
            document.createElement('div')

        div.className =
            'cartItem'

        div.innerHTML = `

            <h3>${item.label}</h3>

            <p>
                ${locale.amount}: ${item.amount}
            </p>

            <p>
                ${locale.total}: $${item.buyPrice * item.amount}
            </p>

            <button class="removeBtn">
                ${locale.remove}
            </button>
        `

        div.querySelector('.removeBtn')
        .addEventListener('click', () => {

            cart.splice(index, 1)

            updateCart()
        })

        cartItemsDiv.appendChild(div)
    })

    totalPrice.innerText =
        `${locale.total}: $${total}`
}

checkoutBtn.addEventListener(
    'click',
    () => {

        if (cart.length <= 0)
            return

        fetch(

            `https://${GetParentResourceName()}/checkout`,

            {

                method: 'POST',

                headers: {

                    'Content-Type':
                        'application/json'
                },

                body: JSON.stringify({

                    cart: cart
                })
            }
        )

        cart = []

        updateCart()

        closeShop()
    }
)

closeBtn.addEventListener(
    'click',
    () => {

        closeShop()
    }
)

window.addEventListener(
    'keydown',
    function(event) {

        if (event.key === 'Escape') {

            closeShop()
        }
    }
)

function closeShop() {

    body.style.display = 'none'

    fetch(

        `https://${GetParentResourceName()}/close`,

        {
            method: 'POST'
        }
    )
}