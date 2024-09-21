<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FastFood.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <asp:Label ID="lblHeaderMsg" Text="<h2>User Login" runat="server" />
            </div>


            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" ErrorMessage="Username is required" ControlToValidate="txtUserName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter Username" ToolTip="Username" runat="server" />
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" ErrorMessage="Email is required" ControlToValidate="txtEmail" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" placeholder="Enter Email xxxxx@xxxxx.com" ToolTip="Email" runat="server" />
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" runat="server" />
                        </div>

                        <div class="row pl-4">
                            <div class="btn-box">
                                <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click" runat="server" />
                                <asp:Label ID="lblNoRegisterUser" CssClass="pl-3 text-black-100" Text="Tou haven't registered yet? <a href='Registration.aspx' class='badge badge-info'>Register here...</a>" runat="server" />
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
