<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="DetailProductCart.aspx.cs" Inherits="FastFood.User.DetailProductCart" %>

<%@ Import Namespace="Helper" %>
<%@ Import Namespace="Dominio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Style section--%>
    <style>
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

        .transparent-card {
            border-radius: 10px;
            background-color: transparent;
        }

        .text-white {
            color: white !important;
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

        .btn-continue:hover {
            color: white;
        }

        @media (max-width: 450px) {

            .btn-red {
                padding: 5px 10px;
                width: 90%;
            }
        }
    </style>
    <%--Style section End--%>

    <%--Detail Product Cart section--%>
    <section class="h-100 gradient-custom allhome">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-10 col-xl-8">
                    <div class="card transparent-card" style="border-radius: 10px;">
                        <div class="card-header px-4 py-3">
                            <h5 class="text-muted mb-0">Your Order,  <span style="color: white;"><%: ((UsersD)Session["User"]).Name %></span>!</h5>
                        </div>
                        <div class="card-body p-4">
                            <asp:Repeater ID="rOrderItems" runat="server">
                                <ItemTemplate>
                                    <div class="card shadow-0 border mb-4 transparent-card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="<%# Utils.GetImageUrlProduct(Eval("ProductImageUrl")) %>" alt="" width="60" />
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 text-white"><%# Eval("ProductName") %></p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0  text-white">$ <%# Eval("ProductPrice") %></p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0  text-white"><%# Eval("Quantity")%> u.</p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0  text-white">$ <%# Eval("Total") %></p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="card-footer border-0 px-4 py-3" style="background-color: rgb(255,255,255,0.5); border-bottom-left-radius: 10px; border-bottom-left-radius: 100%;">
                                <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Total price: $ <span class="h2 mb-0 ms-2"><%Response.Write(Session["grandTotalPrice"]); %></span></h5>
                            </div>
                            <div class="center-button">
                                <asp:LinkButton ID="lbConfirmOrder" OnClick="lbConfirmOrder_Click" runat="server" CssClass="btn-red">Confirm Order </asp:LinkButton>
                            </div>
                            <div colspan="2" class="continue_btn">
                                <asp:LinkButton ID="lbReturn" runat="server" OnClick="lbReturn_Click" CssClass="btn-continue">
                                <i class="fa fa-arrow-circle-left mr-2"></i>Return
                            </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--Detail Product Cart section--%>
</asp:Content>
