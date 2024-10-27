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
                totalPriceLabel.innerText = newTotalPrice.toFixed(2);

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
                background-color: white; /* Color de fondo negro */
                color: black; /* Texto blanco */
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
            background: url(../TemplateFiles/images/fondomenu4.png) no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }

        .center-button {
            display: flex;
            justify-content: center;
            margin: 20px 0; /* Espaciado superior e inferior */
        }

        .btn-red {
            background-color: red; /* Color de fondo rojo */
            color: white; /* Texto blanco */
            border: none; /* Sin borde */
            border-radius: 100px; /* Bordes redondeados */
            padding: 10px 20px; /* Espaciado interno */
            font-size: 16px; /* Tamaño de la fuente */
            width: 50%; /* Ancho del botón */
            cursor: pointer; /* Cambia el cursor al pasar */
            text-align: center; /* Centrar el texto */
            transition: background-color 0.3s; /* Transición suave */
        }

            .btn-red:hover {
                background-color: darkred; /* Color al pasar el mouse */
                color: white;
            }

        .table, .table td, .table th {
            color: white; /* Cambia el color del texto a blanco */
        }

        .btn-continue {
            color: #007bff; /* Color del texto inicial */

            font-size: 16px; /* Tamaño de la fuente */
            cursor: pointer; /* Cambia el cursor al pasar */
            transition: background-color 0.3s, color 0.3s; /* Transición suave */
        }

            .btn-continue:hover {
                color: white; /* Cambia el color del texto al pasar el cursor */
            }

        /* Para navegadores WebKit (Chrome, Safari) */
        .product__details__option .pro-qty input[type=number]::-webkit-inner-spin-button,
        .product__details__option .pro-qty input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none; /* Eliminar apariencia */
            margin: 0; /* Margen 0 */
        }

        /* Para navegadores Firefox */
        .product__details__option .pro-qty input[type=number] {
            -moz-appearance: textfield; /* Eliminar apariencia */
        }

        @media (max-width: 450px) {


            .book_section {
                min-height: auto; /* Permite que la sección se ajuste automáticamente */
                overflow: hidden; /* Previene el overflow de la sección */
                height: 100%; /* O cualquier valor que desees */
                width: 100%;
            }

            .table td, .table th {
                font-size: 14px; /* Reduce el tamaño de fuente */
            }

            .product__details__option .pro-qty .qtybtn {
                font-size: 14px; /* Reduce el tamaño de la fuente */
                height: 30px; /* Ajusta la altura de los botones */
                width: 30px; /* Ajusta el ancho de los botones */
                cursor: pointer;
            }

            .product__details__option .pro-qty input {
                height: 30px; /* Ajusta la altura del textbox */
                width: 30px; /* Ajusta el ancho del textbox */
                font-size: 14px; /* Reduce el tamaño de la fuente */
                text-align: center; /* Alinea el texto al centro */
            }

            .product__details__option .pro-qty {
                display: flex;
                align-items: center; /* Alinea verticalmente */
            }

                .product__details__option .pro-qty .qtybtn {
                    margin: 0; /* Elimina márgenes */
                }

                .product__details__option .pro-qty input {
                    margin: 0; /* Elimina márgenes */
                    padding: 5px; /* Ajusta el espaciado interno si es necesario */
                }

            .btn-red {
                padding: 5px 10px; /* Espaciado interno */

                width: 90%; /* Ancho del botón */
            }
        }
    </style>

    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>

                <h2 style="color: white">Your Shopping Cart</h2>
            </div>
        </div>

        <div class="container">
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
                            <asp:Label ID="lblTotalPrice" runat="server" CssClass="lblTotalPrice"></asp:Label></td>
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

                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                    </table>

                   

                    <div class="center-button">
                        <asp:LinkButton ID="lbTotal" runat="server" CssClass="btn-red" CommandName="updateCart">
                                    View my Order $ <span id="totalAmount"><%Response.Write(Session["grandTotalPrice"]); %></span>
                                </asp:LinkButton>
                    </div>


                    <div colspan="2" class="continue_btn">
                        <asp:LinkButton ID="lbContinueShopping" runat="server" OnClick="lbContinueShopping_Click" CssClass="btn-continue">
                                <i class="fa fa-arrow-circle-left mr-2"></i>Continue Shopping
                            </asp:LinkButton>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </section>

</asp:Content>
