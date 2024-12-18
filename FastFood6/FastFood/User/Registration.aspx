﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FastFood.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <%--  <script>
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
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
                <asp:Label ID="lblHeaderMsg" Text="<h2>User Registration" runat="server" />
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                  <%--      <div>
                            <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" ErrorMessage="Name must be in character only" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name" runat="server" />
                        </div>--%>

                      <%--  <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" ErrorMessage="Username is required" ControlToValidate="txtUserName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter Username" ToolTip="Username" runat="server" />
                        </div>--%>
                        
                      <%--  <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" ErrorMessage="Email is required" ControlToValidate="txtEmail" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" placeholder="Enter Email xxxxx@xxxxx.com" ToolTip="Email" runat="server" />
                        </div>--%>

                     <%--   <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" runat="server" />
                        </div>--%>


                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

                        <%--image registration--%>
                     <%--   <div class="img-box">
                            <asp:Image ImageUrl="" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                        </div>--%>

                    </div>
                </div>

                <div class="row pl-4">
                    <%--<div class="btn-box">
                        <asp:Button ID="btnRegister" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" runat="server" />
                        <asp:Label ID="lblAlreadyUser" CssClass="pl-3 text-black-100" Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here...</a>" runat="server" />
                    </div>--%>
                    <asp:Button Text="text" OnClick="Unnamed_Click" runat="server" />
                </div>

            </div>
        </div>
    </section>

</asp:Content>
