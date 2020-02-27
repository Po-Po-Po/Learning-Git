const products = [
    {
        id: 1,
        title: 'Notebook',
        price: 20000
    },
    {
        id: 2,
        title: 'Mouse',
    },
    {
        id: 3,
        title: 'Keyboard',
        price: 5000
    },
    {
        id: 4,
        title: 'Gamepad',
    }
];

const renderProduct = (title, price=7000, img="./photos/For_lesson_1.jpg" ) =>
        `<img src="${img}" width="200px" height="200px">
        <div class="product-item">
            <h3>${title}</h3>
            <p>${price}</p>
            <button class="by-btn"> Добавить в корзину</button>
           </div>`;

const renderProducts = (list) => {
    const productList = list.map((item) => renderProduct(item.title, item.price)).join('');
    document.getElementsByClassName("products")[0].innerHTML = productList;
};

renderProducts(products);
