<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="FastFood.User.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Script section--%>
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <%--Script section End--%>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Style section --%>
    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }

        .allhome {
            width: 100%;
            background: url(../TemplateFiles/images/myprogile1.png) no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }
    </style>
    <%--Style section End--%>


    <%--MyProfile section --%>
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
                    <div class="card" style="background-color: transparent; color: white;">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <asp:Image ImageUrl="~/TemplateFiles/images/perfil.png" ID="imgUser" runat="server" CssClass="rounded mx-auto d-block" Style="width: 150px; height: 150px;" />
                                    </div>
                                    <div class="userData ml-3">
                                        <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);">
                                            <asp:Label ID="lblFullNameUser1" runat="server" ToolTip="User Full Name" Style="color: white" /></a></h2>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblUserName1" runat="server" ToolTip="Unique UserName" Style="color: white" /></a></h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblEmail1" runat="server" ToolTip="User Email" Style="color: white" /></a>
                                        </h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblLastUpdate1" runat="server" ToolTip="Last Update" Style="color: white" /></a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active text-danger" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false"><i class="fa fa-id-badge mr-2"></i><b>Basic Info</b></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-danger" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                                aria-controls="connectedServices" aria-selected="true">
                                                <i class="fa fa-clock-o mr-2"></i><b>Purchased History</b></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content ml-1" id="myTabContent">
                                        <%--Basic Info, --%>
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
                                        <%--info basica, final--%>

                                        <%--History Order--%>
                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                            <h3>Order History</h3>
                                            <asp:Repeater ID="rPurchaseHistorty" runat="server" OnItemDataBound="rPurchaseHistorty_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="container">
                                                        <div class="row pt-1 pb-1" style="background-color: lightgray">
                                                            <div class="col-4" style="color: black">
                                                                <span class="badge badge-pill badge-dark text-black"><%# Container.ItemIndex + 1 %></span>
                                                                Payment Mode: <%# Eval("PaymentMode").ToString() == "cod" ? "Cash On Delivery" : Eval("PaymentMode").ToString().ToUpper()%>
                                                            </div>
                                                            <div class="col-6" style="color: black">
                                                                <%# Eval("CardNo") != null && !string.IsNullOrEmpty(Eval("CardNo").ToString()) ? "Card No: " + Eval("CardNo") : string.Empty %>
                                                            </div>
                                                            <div class="col-2" style="text-align: end">
                                                                <a href="Invoice.aspx?Id=<%# Eval("Payment") %>" class="btn btn-info btn-sm"><i class="fa fa-download mr-2"></i>Invoice</a>
                                                            </div>
                                                        </div>
                                                        <asp:HiddenField ID="hdnPaymentId" runat="server" Value='<%# Eval("Payment") %>' />
                                                        <asp:Repeater ID="rOrders" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table data-table-export table-responsive-sm table-bordered table-hover" style="color: white">
                                                                    <thead class="bg-dark text-white">
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
                                                                <tr>
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
                                                                    <td colspan="3" class="pl-lg-5"><b>Grand Total: -</b> </td>
                                                                    <td>$ <b><%# Session["grandTotalPrice"] != null ?  Session["grandTotalPrice"] : "0" %></b>
                                                                    </td>
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
                    <div class="middle pt-2 justify-content-end">
                        <a href="Registration.aspx" class="badge badge-success badge-pill shadow-sm" style="font-size: 1rem; padding: 15px"><i class="fa fa-pencil mr-2"></i>Edit Details</>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--MyProfile section End--%>
</asp:Content>
