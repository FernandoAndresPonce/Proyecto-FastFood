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

      
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .product__details__option .pro-qty {
            display: flex;
            align-items: center; /* Alinea verticalmente */
        }

        /* Otros estilos existentes aquí... */

        .popup {
            position: fixed; /* Fijo para cubrir toda la pantalla */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* Fondo negro con transparencia */
            display: none; /* Inicialmente oculto */
            align-items: center; /* Centrar verticalmente */
            justify-content: center; /* Centrar horizontalmente */
            z-index: 1000; /* Asegúrate de que esté encima de otros elementos */
        }

        .popup-content {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con un poco de transparencia */
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Sombra alrededor de la tarjeta */
        }

        .popup-buttons {
            margin-top: 20px;
        }

        .btn-red {
            background-color: red; /* Color de fondo rojo */
            color: white; /* Texto blanco */
            border: none; /* Sin borde */
            border-radius: 100px; /* Bordes redondeados */
            padding: 10px 20px; /* Espaciado interno */
            font-size: 16px; /* Tamaño de la fuente */
            cursor: pointer; /* Cambia el cursor al pasar */
            transition: background-color 0.3s; /* Transición suave */
        }

            .btn-red:hover {
                background-color: darkred; /* Color al pasar el mouse */
            }

        /* Otros estilos existentes aquí... */
    </style>

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
                        <td>$<asp:Label ID="lblTotalPrice" runat="server" CssClass="lblTotalPrice"></asp:Label></td>
                        <td>
                            <asp:LinkButton ID="lbDelete" runat="server" Text="Remove" CommandName="remove" CommandArgument='<%# Eval("ProductId") %>' OnClientClick="return confirm('Do you want to remove this item from cart?');">                
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
                        <asp:LinkButton ID="lbContinueShopping" runat="server" CssClass="btn-continue" OnClientClick="showPopup(); return false;">
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
                    <asp:LinkButton ID="lbContinueShoppingPopup" runat="server" CssClass="btn-red" OnClick="">Continue Shopping</asp:LinkButton>
                    <asp:LinkButton ID="lbViewOrder" runat="server" CssClass="btn-red" OnClick="">View My Order</asp:LinkButton>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        window.onload = function () {
            <% if (PopUp) { %>
                document.getElementById('popup').style.display = 'flex';
            <% } %>
        };
    </script>


</asp:Content>
