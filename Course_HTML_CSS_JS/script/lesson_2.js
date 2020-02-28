class ProductItem {
    constructor(product, img = './photos/For_lesson_1.jpg') {
        this.title = product.title;
        this.price = product.price;
        this.id = product.id;
        this.img = img;
    }

    render() {
        return `<div class="product-item" data-id="${this.id}">
                <img src="${this.img}" alt="Some img">
                <div class="desc">
                    <h3>${this.title}</h3>
                    <p>${this.price} \u20bd</p>
                    <button class="buy-btn">Купить</button>
                </div>
            </div>`
    }
}

class ProductList {
    constructor(container = '.products') {
        this.totalSum = 0;
        this.container = container;
        this.goods = [];
        this.allProducts = [];
        this._fetchProducts();
        this.render();
        this.totalSumProduct();
    }

    _fetchProducts() {
        this.goods = [
            {
                id: 1,
                title: 'Notebook',
                price: 1000
            },
            {
                id: 2,
                title: 'Mouse',
                price: 100
            },
            {
                id: 3,
                title: 'Keyboard',
                price: 250
            },
            {
                id: 4,
                title: 'Gamepad',
                price: 150
            },
    ];
    }

    totalSumProduct() { //Задача 2. Функция для подсчета общей суммы товаров
        for (let item of this.goods) {
            this.totalSum += item.price;
        }
    }

    render() {
        const block = document.querySelector(this.container);

        for (let product of this.goods) {
            const productObject = new ProductItem(product);
            this.allProducts.push(productObject);
            block.insertAdjacentHTML('beforeend', productObject.render());
        }
    }

    searchId(id) {                //Задача 1.
        //поиск товара по id
    }

    searchTitle(title) {
        //поиск товара по title
    }

    productBelowPrice(price) {
        //Вывести список товаров ниже заданной цены
    }
    productAbovePrice(price) {
        //Вывести список товаров выше заданной цены
    }
}

new ProductList();

// Задача 3.
class Hamburger {
    constructor(size, stuffing) {
        
        this._hamburgerStuff = {
            "с сыром": [10, 20],
            "с салатом": [20, 5],
            "с картофелем": [15, 10],
            "приправа": [15, 0],
            "майонез": [20, 5]
        };
        this._hamburgerSize = {
            "маленький": [50, 20],
            "большой": [100, 40]
        };
        if (Object.keys(this._hamburgerSize).includes(size)) {
            this.size = size;
        }
        if (Object.keys(this._hamburgerStuff).includes(stuffing)) {
            this.stuffing = [stuffing];
        }
    }
    addTopping(topping) { // Добавить добавку 
        if (Object.keys(this._hamburgerStuff).includes(topping)) {
            this.stuffing.push(topping);
        } else {
            return "Такой приправы нет.";
        }
    }
    removeTopping(topping) { // Убрать добавку
        if (Object.keys(this._hamburgerStuff).includes(topping)) {
            let index_topping = this.stuffing.indexOf(topping);
            if (index_topping != -1) {
                this.stuffing.splice(index_topping, 1);
            }
        } else {
            return "Такой приправы нет.";
        }
    }
    getToppings(topping) { // Получить список добавок
        console.log(`Список добавок: ${Object.keys(this._hamburgerStuff).join(",")}`);
    }
    getSize() { // Узнать размер гамбургера 
        console.log(this.size);
    }
    getStuffing() { // Узнать начинку гамбургера 
        console.log(this.stuffing.join(","));
    }
    calculatePrice() { // Узнать цену 
        this._price = this._hamburgerSize[this.size][0];
        for (let stuff of this.stuffing){
            this._price += this._hamburgerStuff[stuff][0];
        }
        console.log(this._price);
        this._price = 0;
    }
    calculateCalories() { // Узнать калорийность 
        this._calory = this._hamburgerSize[this.size][1];
        for (let stuff of this.stuffing){
            this._calory += this._hamburgerStuff[stuff][1];
        }
        console.log(this._calory);
        this._calory = 0;
    }
}

my_hamburger = new Hamburger("маленький", "с сыром");
my_hamburger.getToppings();
my_hamburger.getSize();
my_hamburger.getStuffing();
my_hamburger.addTopping("с салатом");
my_hamburger.getStuffing();
my_hamburger.removeTopping("с салатом");
my_hamburger.getStuffing();
my_hamburger.addTopping("с салатом");
my_hamburger.getStuffing();
my_hamburger.calculatePrice();
my_hamburger.calculateCalories();

