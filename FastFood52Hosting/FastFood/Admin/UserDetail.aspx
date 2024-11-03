<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="FastFood.Admin.UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Style section--%>
    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }

        .transparent-table {
            background-color: rgba(0, 0, 0, 0) !important;
            color: whitesmoke !important;
        }

        .transparent-row {
            background-color: transparent !important;
            color: whitesmoke !important;
        }

        .transparent-table th,
        .transparent-table td {
            background-color: transparent !important;
            border: none !important;
            color: whitesmoke !important;
        }
    </style>
    <%--Style section End--%>

    <%--UserDetail section--%>
    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
                <h2 style="color: white">My Profile </h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card" style="background-color: transparent; color: white">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <asp:Image ImageUrl="../User/TemplateFiles/images/perfil.png" ID="imgUser" runat="server" CssClass="rounded mx-auto d-block" Style="width: 150px; height: 150px;" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active text-danger" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false"><b>Basic Info</b></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-danger" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                                aria-controls="connectedServices" aria-selected="true">
                                                <b>Purchased History</b></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content ml-1" id="myTabContent">
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Full Name</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblFullNameUser" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">User Name</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblUserName" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Mobile</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblMobile" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Email</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblEmail" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Post Code</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblPostCode" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Address</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblAddress" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Account Update</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <asp:Label Text="" ID="lblAccountUpdate" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                        </div>
                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                            <h3>Order History</h3>
                                            <asp:Repeater ID="rPurchaseHistorty" runat="server" OnItemDataBound="rPurchaseHistorty_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="container">
                                                        <div class="row pt-1 pb-1" style="background-color: lightgray">
                                                            <div class="col-4" style="color: black">
                                                                <span class="badge badge-pill badge-dark text-black">
                                                                    <%# Container.ItemIndex + 1 %>
                                                                </span>
                                                                Payment Mode: <%# Eval("PaymentMode").ToString() == "cod" ? "Cash On Delivery" : Eval("PaymentMode").ToString().ToUpper()%>
                                                            </div>
                                                            <div class="col-6">
                                                                <%# Eval("CardNo") != null && !string.IsNullOrEmpty(Eval("CardNo").ToString()) ? "Card No: " + Eval("CardNo") : string.Empty %>
                                                            </div>
                                                        </div>
                                                        <asp:HiddenField ID="hdnPaymentId" runat="server" Value='<%# Eval("Payment") %>' />
                                                        <asp:Repeater ID="rOrders" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table data-table-export table-responsive-sm table-hover transparent-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Product Name</th>
                                                                            <th>Unit Price</th>
                                                                            <th>Qty</th>
                                                                            <th>Total Price</th>
                                                                            <th>Order Id</th>
                                                                            <th>Status</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr class="transparent-row">
                                                                    <td>
                                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("ProductPrice") != null && !string.IsNullOrEmpty(Eval("ProductPrice").ToString()) ? "$" + Eval("ProductPrice") : string.Empty %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                    </td>
                                                                    <td>$<asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblOrderNo" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                            CssClass='<%# Eval("Status").ToString() == "Delivered" ? "badge badge-success" : "badge badge-warning" %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <tr>
                                                                    <td colspan="3" class="pl-lg-5"><b>Grand Total: -</b></td>
                                                                    <td>$ <b><%# Session["grandTotalPrice"] != null ? Session["grandTotalPrice"] : "0" %></b></td>
                                                                    <td></td>
                                                                </tr>
                                                                </tbody>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-grid gap-2 col-6 mx-auto">
            <asp:Button Text="Return" ID="btnReturn" CssClass="btn btn-light" OnClick="btnReturn_Click" runat="server" />
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <%if (Request.QueryString["Id"] != null)
                    { %>
                <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 15px">
                    <asp:Button Text="Delete" ID="btnDelete" CssClass="btn btn-danger" OnClick="btnDelete_Click" runat="server" />
                </div>
                <%} %>
                <%if (ConfirmDeleted)
                    { %>
                <div class="mb-3" style="margin: 10px 25%; text-align: center">
                    <label for="cbConfirmDeletion" class="badge badge-dark">Confirm Deletion</label>
                    <asp:CheckBox ID="cbConfirmDeletion" runat="server" />
                </div>
                <div>
                    <asp:Button Text="Confirm Delete" ID="btnConfirmDeletion" CssClass="btn btn-outline-danger" OnClick="btnConfirmDeletion_Click" runat="server" />
                </div>
                </div>
                        <%} %>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
    <%--UserDetail section End--%>
</asp:Content>
