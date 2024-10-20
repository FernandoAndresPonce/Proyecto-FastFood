<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FastFood.User.Cart" %>

<%@ Import Namespace="Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function updateGrandTotal() {
            var total = 0;
            var totalLabels = document.querySelectorAll('.lblTotalPrice');

            totalLabels.forEach(function (label) {
                total += parseFloat(label.innerText.replace("$", "")) || 0;
            });

            // Actualiza el total en el botón
            document.getElementById("totalAmount").innerText = total.toFixed(2);
        }

        function updateTotalPrice(input) {
            var row = input.closest('tr');
            var priceLabel = row.querySelector('.lblPrice');
            var totalPriceLabel = row.querySelector('.lblTotalPrice');

            if (priceLabel && totalPriceLabel) {
                var unitPrice = parseFloat(priceLabel.innerText.replace("$ ", "").replace(",", ""));
                var quantity = parseInt(input.value) || 0;

                // Asegúrate de que la cantidad no sea menor a 1
                if (quantity < 1) {
                    quantity = 1;
                    input.value = quantity; // Actualiza el input si es menor a 1
                }

                var newTotalPrice = unitPrice * quantity;
                totalPriceLabel.innerText =  newTotalPrice.toFixed(2);

                // Actualiza el total global
                updateGrandTotal();
            } else {
                console.error("No se encontraron los elementos necesarios.");
            }
        }

        function updateQuantity(button, amount) {
            var proQtyDiv = button.closest('.pro-qty');
            var quantityInput = proQtyDiv.querySelector('input[type="number"]');

            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value) || 0;
                var newValue = currentValue + amount;

                // Asegurarse de que la cantidad no sea menor a 1
                if (newValue < 1) {
                    newValue = 1;
                }

                quantityInput.value = newValue;
                updateTotalPrice(quantityInput); // Actualiza el precio total después de cambiar la cantidad
            } else {
                console.error("El elemento de cantidad no se encuentra.");
            }
        }
    </script>




</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .product__details__option .pro-qty {
            display: flex;
            align-items: center; /* Alinea verticalmente */
        }

            .product__details__option .pro-qty .qtybtn {
                font-size: 16px;
                height: 50px; /* Ajusta según tu diseño */
                cursor: pointer;
                border: none;
                background-color: black; /* Color de fondo negro */
                color: white; /* Texto blanco */
                width: 40px; /* Ancho de los botones */
            }

            .product__details__option .pro-qty input {
                border: 1px solid #e1e1e1; /* Borde del textbox */
                height: 50px; /* Altura del textbox */
                width: 70px; /* Ajusta según tu diseño */
                font-size: 16px;
                font-weight: 600;
                text-align: center;
            }

        .allhome {
            width: 100%;
            background: url(../TemplateFiles/images/fondoMenu1.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }
    </style>

    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>

                <h2>Your Shopping Cart</h2>
            </div>
        </div>

        <div class="container">
            <%--1 itemsCart, ir a templateFiles - js - custom  --%>
            <asp:Repeater ID="rCartItem" runat="server" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Image</td>
                                <td>Unit Price</td>
                                <td>Quantity</td>
                                <td>Total Price</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </td>
                        <td>
                            <img src="<%# Utils.GetImageUrlProduct(Eval("ProductImageUrl")) %>" alt="" width="60" />
                        </td>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" CssClass="lblPrice" Text='<%#"$ " +  Eval("ProductPrice") %>' />
                            <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("ProductId") %>' />
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                            <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%# Eval("ProductQuantity") %>' />
                        </td>
                        <td>
                            <div class="product__details__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <button type="button" class="btn btn-primary qtybtn dec" onclick="updateQuantity(this, -1)">-</button>
                                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>' oninput="updateTotalPrice(this)" />
                                        <button type="button" class="btn btn-primary qtybtn inc" onclick="updateQuantity(this, 1)">+</button>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>$
                            <asp:Label ID="lblTotalPrice" runat="server" CssClass="lblTotalPrice"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbDelete" runat="server" Text="Remove" CommandName="remove"
                                CommandArgument='<%# Eval("ProductId") %>'
                                OnClientClick="return confirm('Do you want to remove this item from cart?');">                
            <i class="fa fa-close"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    <tr>
                        <td colspan="3"></td>
                        <td class="pl-lg-5">
                            <b>Grand Total: -</b>
                        </td>
                        <%--  <td>--%>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="continue_btn">
                            <a href="Menu.aspx" class="btn btn-info">
                                <i class="fa fa-arrow-circle-left mr-2"></i>Continue Shopping</a>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbUpdateCart" CommandName="updateCart" CssClass="btn btn-warning" runat="server">
                            <i class="fa fa-refresh mr-2"></i> Update Cart </asp:LinkButton>

                        </td>
                        <td>
                            <asp:LinkButton ID="lbCheckout" CommandName="checkout" CssClass="btn btn-success" runat="server">
                            <i class="fa fa-arrow-circle-left ml-2"></i> Checkout</asp:LinkButton>
                        </td>
                    </tr>





                    <tr>
                        <td colspan="3"></td>
                        <td class="pl-lg-5"></td>
                        <td>
                            <asp:LinkButton ID="lbTotal" runat="server" CssClass="btn btn-primary">
            Total:$ <span id="totalAmount"><%Response.Write(Session["grandTotalPrice"]); %></span>
        </asp:LinkButton>
                        </td>
                        <td></td>
                    </tr>



                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </section>



</asp:Content>
