var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#btnCountinue').off('click').on('click', function () {
            //window.location.href = "/Views/Home/Index.cshtml";
            window.location.href = "/ "
        });
        $('btnUpdate').off('click').on('click', function () {
            var listProduct = $(".txtQuantity");
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push({
                    SoLuong: $(item).val(),
                    IDSP: $(item).data('ID')


                });
            });

            $ajax({
                url: '/Cart',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res)
                {
                    if (res.status == true)
                    {
                        window.location.href = "/Cart/index.cshtml";
                    }
                }
            })
        });

    }
}
cart.init();