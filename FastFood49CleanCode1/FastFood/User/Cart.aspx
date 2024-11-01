<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FastFood.User.Cart" %>

<%@ Import Namespace="Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>

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

            document.getElementById("totalAmount").innerText = total.toFixed(2);
        }

        function updateTotalPrice(input) {
            var row = input.closest('tr');
            var priceLabel = row.querySelector('.lblPrice');
            var totalPriceLabel = row.querySelector('.lblTotalPrice');

            if (priceLabel && totalPriceLabel) {
                var unitPrice = parseFloat(priceLabel.innerText.replace("$ ", "").replace(",", ""));
                var quantity = parseInt(input.value) || 0;

                if (quantity < 1) {
                    quantity = 1;
                    input.value = quantity;
                }

                var newTotalPrice = unitPrice * quantity;
                totalPriceLabel.innerText = newTotalPrice.toFixed(2);

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

                if (newValue < 1) {
                    newValue = 1;
                }
                quantityInput.value = newValue;
                updateTotalPrice(quantityInput);
            } else {
                console.error("El elemento de cantidad no se encuentra.");
            }
        }
    </script>

    <%--Scripts section End--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Style section--%>

    <style>
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .popup-content {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .popup-buttons {
            margin-top: 20px;
        }

        .product__details__option .pro-qty {
            display: flex;
            align-items: center;
        }

            .product__details__option .pro-qty .qtybtn {
                font-size: 16px;
                height: 50px;
                cursor: pointer;
                border: none;
                background-color: white;
                color: black;
                width: 40px;
            }

            .product__details__option .pro-qty input {
                border: 1px solid #e1e1e1;
                height: 50px;
                width: 70px;
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
            margin: 20px 0;
        }

        .btn-red {
            background-color: red;
            color: white;
            border: none;
            border-radius: 100px;
            padding: 10px 20px;
            font-size: 16px;
            width: 50%;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

            .btn-red:hover {
                background-color: darkred;
                color: white;
            }

        .btn-green {
            background-color: darkgreen;
            color: white;
            border: none;
            border-radius: 100px;
            padding: 10px 20px;
            font-size: 16px;
            width: 50%;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

            .btn-green:hover {
                background-color: darkseagreen;
                color: white;
            }

        .table, .table td, .table th {
            color: white;
        }

        .btn-continue {
            color: #007bff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

            .btn-continue:hover {
                color: white;
            }

        .product__details__option .pro-qty input[type=number]::-webkit-inner-spin-button,
        .product__details__option .pro-qty input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .product__details__option .pro-qty input[type=number] {
            -moz-appearance: textfield;
        }

        @media (max-width: 450px) {
            .book_section {
                min-height: auto;
                overflow: hidden;
                height: 100%;
                width: 100%;
            }

            .table td, .table th {
                font-size: 14px;
            }

            .product__details__option .pro-qty .qtybtn {
                font-size: 14px;
                height: 30px;
                width: 30px;
                cursor: pointer;
            }

            .product__details__option .pro-qty input {
                height: 30px;
                width: 30px;
                font-size: 14px;
                text-align: center;
            }

            .product__details__option .pro-qty {
                display: flex;
                align-items: center;
            }

                .product__details__option .pro-qty .qtybtn {
                    margin: 0;
                }

                .product__details__option .pro-qty input {
                    margin: 0;
                    padding: 5px;
                }

            .btn-red {
                padding: 5px 10px;
                width: 90%;
            }
        }
    </style>

    <%--Style section End--%>

    <%--Cart section--%>

    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-center">
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
        <div id="popup" class="popup" style="<%: PopUp ? "display:flex;" : "display:none;" %>">
            <div class="popup-content">
                <h2>Choose an Option</h2>
                <div class="popup-buttons">
                    <asp:LinkButton ID="lbContinueShoppingPopup" runat="server" CssClass="btn-green" OnClick="lbContinueShoppingPopup_Click">Continue Shopping</asp:LinkButton>
                    <asp:LinkButton ID="lbViewOrder" runat="server" CssClass="btn-red" OnClick="lbViewOrder_Click">View My Order</asp:LinkButton>
                </div>
            </div>
        </div>
    </section>

    <%--Cart section End--%>
</asp:Content>
