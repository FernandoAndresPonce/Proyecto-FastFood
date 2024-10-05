<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FastFood.User.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>

                <h2>Your Shopping Cart</h2>
            </div>
        </div>

        <div class="container">
            <%--1 itemsCart--%>
            <asp:Repeater ID="rCartItem" runat="server" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table>
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
                            <asp:Label ID="lblNameProductCart" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="imgProductCart" CssClass="rounded mx-auto d-block" Style="width: 40px; height: 40px; background-size: contain; background-position: center" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblPriceProductCart" runat="server" Text='<%# Eval("Price") %>' />
                            <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("ProductId") %>' />
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                            <%--ojo aca--%>
                            <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%# Eval("PrdQuantity") %>' />
                        </td>
                        <%--4 itemsCart--%>
                        <td>
                            <div class="product__details__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revQuantity" ErrorMessage="*" ForeColor="Red" Font-Size="Small" ValidationExpression="[1-9]*" ControlToValidate="txtQuantity" runat="server" Display="Dynamic" SetFocusOnError="true" EnableClientScript="true" />
                                    </div>

                                </div>
                            </div>
                        </td>
                        <td>
                            <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbDelete" Text="Remove" CommandName="remove" CommandArgument='<%# Eval("ProductId") %>'
                                OnClientClick="return confirm('Do you want to remove this item from cart'); lbDelete_Click" runat="server" />
                            <i class="fa fa-close"></i>
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    <tr>
                        <td colspan="3"></td>
                        <td class="pl-lg-5">
                            <button>Grand Total: -</button>
                        </td>
                        <td>$<%Response.Write(Session["grandTotalPrice"]); %>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="continue_btn">
                            <a href="Menu.aspx" class="btn btn-info">
                                <i class="fa fa-arrow-circle-left mr-2">Continue Shopping</i></a>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbUpdateCart" CommandName="updateCart" CssClass="btn btn-warning" runat="server" />
                            <i class="fa fa-refresh mr-2"></i>Update Cart
                        </td>
                    </tr>



                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </section>

</asp:Content>
