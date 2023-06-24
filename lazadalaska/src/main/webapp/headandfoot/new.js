function showCartHtml2(id,imgProduct1 , nameProduct, priceProduct, quantityProduct,costString){

    let cartItem= `
                            <tr class="row-table" style="text-align: center;">
                                <td class="column-1">
                                    <div class="how-itemcart1">
                                        <img src="${imgProduct1}">
                                    </div>
                                </td>
                                <td class="column-2">${nameProduct}</td>
                                <td >${costString}</td>
                                <td class="column-4">
                                    <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                        <div onclick="downQuan(${id})" class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-minus"></i>
                                        </div>

                                        <input class="mtext-104 cl3 txt-center num-product" id="product-${id}" type="number" name="num-product1" value="${quantityProduct}">

                                        <div onclick="upQuan(${id})" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                        </div>
                                    </div>
                                </td>
                                <td class="column-5" id="total-${id}">${priceProduct}</td>
                            </tr>
    `;

    return cartItem;
}
function updateCartHtml2(id, imgProduct1 , nameProduct, priceProduct, quantityProduct, costProduct){
    let cartItem= `
                    <li class="header-cart-item flex-w flex-t m-b-12">
                      <div class="header-cart-item-img">
                        <img src="${imgProduct1}" alt="IMG">
                      </div>
                      <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">${nameProduct}</a>
                        <span class="header-cart-item-info">${quantityProduct} x ${costProduct} = ${priceProduct}</span>
                        <button class="header-cart-item-remove" onclick="confirmRemove(${id})">Remove</button>
                      </div>
                    </li>
                  `;

    return cartItem;
}

