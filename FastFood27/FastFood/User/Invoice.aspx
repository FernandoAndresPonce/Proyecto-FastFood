<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="FastFood.User.Invoice" %>

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


    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
            </div>
        </div>
        <div class="container">
            <asp:Repeater ID="rOrderItem" runat="server">
                <HeaderTemplate>
                    <table class="table table-responsive-sm table-bordered table-hover" id="tvlInvoice">
                        <thead class="bg-dark text-white">
                            <tr>
                                <th>Sr.No</th>
                                <th>Order Number</th>
                                <th>Product</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("OrderDetailsId") %>

                        </td>
                        <td>
                            <%# Eval("OrderNo") %>

                        </td>
                        <td>
                            <%# Eval("ProductName") %>

                        </td>
                        <td>
                            <%#string.IsNullOrEmpty(Eval("ProductPrice").ToString()) ? "" : "$" + Eval("ProductPrice") %>

                        </td>
                        <td>
                            <%# Eval("Quantity") %>

                        </td>
                        <td>$<%# Eval("TotalPrice") %>

                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>

                    <%--ver esta parte de la tabla--%>
                     <tr>
                         <td></td>
                        <td colspan="3"></td>
                        <td class="pl-lg-5">
                            <b>Grand Total: -</b>
                        </td>

                        <td>$<%# Session["grandTotalPrice"] != null ?  Session["grandTotalPrice"] : "0" %>
                        </td>
                        <td></td>
                    </tr>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>


            <div class="text-center">
                <asp:LinkButton ID="lbDownloadInvoice" runat="server" CssClass="btn btn-info"
                    OnClick="lbDownloadInvoice_Click">
                 <i class="fa fa-file-pdf-o mr-2"></i>Download Invoice
                </asp:LinkButton>
            </div>
        </div>
    </section>

</asp:Content>
