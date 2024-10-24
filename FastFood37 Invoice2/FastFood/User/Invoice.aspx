<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="FastFood.User.Invoice" %>

<%@ Import Namespace="Helper" %>
<%@ Import Namespace="Dominio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>--%>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .allhome {
            width: 100%;
            height: auto; /* Ajusta la altura según necesites */
            background: url(../TemplateFiles/images/invoice2.png) no-repeat center top; /* Centrado horizontal y alineado arriba */
            background-size: cover;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }
    </style>

    <%--  <section class="book_section layout_padding">
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


           
        </div>
    </section>--%>


    <section class="allhome">
        <div class="container-fluid my-5 d-flex justify-content-center" style="";>
            <div class="card card-1" style="width: 650px; background-color: transparent;  color: white">


                <div class="card-header " style="background: rgba(255, 255, 255, 0.5); color: black" ;>
                    <div class="media flex-sm-row flex-column-reverse justify-content-between">
                        <div class="col my-auto">
                            <h4 class="mb-0">Thanks for your Order,</h4>
                            <div class="text-center">
                                <span class="change-color" style="font-size: 1.5rem"><b><%: ((UsersD)Session["User"]).Name %></b></span>
                            </div>
                        </div>
                        <div class="col-auto text-center my-auto pl-0 pt-sm-4">
                            <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="../TemplateFiles/images/icoInvoice.png" width="80" height="80">
                            <p class="mb-4 pt-0 Glasses">Fast Food</p>
                        </div>
                    </div>
                </div>

                <div class="card-body" >
                    <div class="row justify-content-between mb-3">
                        <div class="col-auto">
                            <h6 class="color-1 mb-0 change-color"><b>Receipt</b> </h6>
                        </div>
                    </div>
                    <div class="row mb-1 justify-content-end">
                        <div class="col-auto text-right"><small>Invoice Number: 1KAU9-84UIL</small></div>
                    </div>
                    <div class="row mb-1 justify-content-end">
                        <div class="col-auto text-right"><small>Invoice Date: <% Response.Write(Session["orderDate"].ToString()); %></small></div>
                    </div>
                    <asp:Repeater ID="rOrderItem" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col">
                                    <div class="card card-2"  style="background-color: transparent; color: white; font-size: 20px">
                                        <div class="card-body">
                                            <div class="media">
                                                <div class="sq align-self-center">
                                                    <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="<%# Utils.GetImageUrlProduct(Eval("ProductImageUrl")) %>" width="70" height="70" />
                                                </div>
                                                <div class="media-body my-auto text-right">
                                                    <div class="row my-auto flex-column flex-md-row">
                                                        <div class="col my-auto">
                                                            <h6 class="mb-0" style="font-size: 14px"><%# Eval("ProductName") %></h6>
                                                        </div>
                                                        <div class="col-auto my-auto"><small><%# string.IsNullOrEmpty(Eval("ProductPrice").ToString()) ? "" : "$ " + Eval("ProductPrice") %></small></div>
                                                        <div class="col my-auto"><small>Qty: <%# Eval("Quantity") %></small></div>

                                                        <div class="col my-auto">
                                                            <h6 class="mb-0">$ <%# Eval("TotalPrice") %></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="row mt-4">
                        <div class="col">
                            <div class="row justify-content-between">
                                <div class="flex-sm-col text-right col">
                                    <p class="mb-1"><b>Total</b></p>
                                </div>
                                <div class="flex-sm-col col-auto">
                                    <p class="mb-1">$ <% Response.Write(Session["grandTotalPrice"]); %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" OnClick="lbDownloadInvoice_Click">
                    <i class="fa fa-file-pdf-o mr-2"></i>Download Invoice
                </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
