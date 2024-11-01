<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FastFood.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Script section --%>
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

    <%--Dashboard section --%>
    <div class="pcoded-inner-content">


        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="heading_container">
                        <div class="align-self-end" style="text-align: center; width: 100%; margin-bottom: 30px">
                            <asp:Label ID="lblMsg" runat="server" Visible="false" />
                        </div>
                        <asp:Label ID="lblHeaderMsg" Style="color: white" Text="<h2>User Login" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="Category.aspx"><i class="icofont icofont-muffin bg-danger card1-icon"></i></a>
                                    <span class="text-danger f-w-600">Categories</span>
                                    <h4>
                                        <asp:Label ID="lbltotalCategories" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Category.aspx" style="text-decoration: none; color: white;"><i class="text-danger f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="Products.aspx"><i class="icofont icofont-fast-food bg-c-pink card1-icon"></i></a>
                                    <span class="text-c-pink f-w-600">Products</span>
                                    <h4>
                                        <asp:Label ID="lblTotalProducts" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Products.aspx" style="text-decoration: none; color: white;"><i class="text-c-pink f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="OrderStatus.aspx"><i class="icofont icofont-spoon-and-fork bg-c-blue card1-icon"></i></a>
                                    <span class="text-c-green f-w-600">Total Orders</span>
                                    <h4>
                                        <asp:Label ID="lblTotalOrders" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="OrderStatus.aspx" style="text-decoration: none; color: white;"><i class="text-c-green f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="OrderStatus.aspx"><i class="icofont icofont-fast-delivery bg-c-pink card1-icon"></i></a>
                                    <span class="text-c-yellow f-w-600">Delivered Items</span>
                                    <h4>
                                        <asp:Label ID="lblOrdersDelivered" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="OrderStatus.aspx" style="text-decoration: none; color: white;"><i class="text-c-yellow f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="OrderStatus.aspx"><i class="icofont icofont-delivery-time bg-c-pink card1-icon"></i></a>
                                    <span class="text-c-blue f-w-600">Pending Items</span>
                                    <h4>
                                        <asp:Label ID="lblOrdersPending" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="OrderStatus.aspx" style="text-decoration: none; color: white;"><i class="text-c-blue f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="User.aspx"><i class="icofont icofont-users-social bg-c-blue card1-icon"></i></a>
                                    <span class="text-c-pink f-w-600">Users</span>
                                    <h4>
                                        <asp:Label ID="lblTotalUsers" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="User.aspx" style="text-decoration: none; color: white;"><i class="text-c-pink f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="Report.aspx"><i class="icofont icofont-money-bag bg-c-pink card1-icon"></i></a>
                                    <span class="text-c-green f-w-600">Sold Amount</span>
                                    <h4>$
                                        <asp:Label ID="lblTotalAmount" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Report.aspx" style="text-decoration: none; color: white;"><i class="text-c-green f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card widget-card-1" style="background-color: rgb(256,256,256,0.2); color: white">
                                <div class="card-block-small">
                                    <a href="Contact.aspx"><i class="icofont icofont-support-faq bg-c-yellow card1-icon"></i></a>
                                    <span class="text-c-yellow f-w-600">Feedbacks</span>
                                    <h4>
                                        <asp:Label ID="lblTotalFeedbacks" runat="server" /></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Contact.aspx" style="text-decoration: none; color: white;"><i class="text-c-yellow f-16 icofont icofont-eye-alt m-r-10"></i>View Details</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Dashboard section End--%>
</asp:Content>
