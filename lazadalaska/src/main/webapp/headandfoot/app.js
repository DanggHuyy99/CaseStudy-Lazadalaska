function updateCartHtml(imgProduct1 , nameProduct, priceProduct){
    let cartItem= `
                    <li class="header-cart-item flex-w flex-t m-b-12">
                      <div class="header-cart-item-img">
                        <img src="${imgProduct1}" alt="IMG">
                      </div>
                      <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">${nameProduct}</a>
                        <span class="header-cart-item-info">1 x ${priceProduct}</span>
                      </div>
                    </li>
                  `;

    return cartItem;
}