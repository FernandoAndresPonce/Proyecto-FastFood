<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FastFood.User.Login" %>

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

    <%--Style section--%>
    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }

        .allhome {
            height: 70vh;
            width: 100%;
            background: url(../TemplateFiles/images/login2.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <%--Style section End--%>

    <%--Login section--%>
    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="row" style="display: flex; justify-content: center; align-items: center;">
                <div class="col-md-6">
                    <div class="form_container">
                        <div class="heading_container">
                            <div class="align-self-end" style="text-align: center; width: 100%; margin-bottom: 30px">
                                <asp:Label ID="lblMsg" runat="server" Visible="false" />
                            </div>
                            <asp:Label ID="lblHeaderMsg" Style="color: white" Text="<h2>User Login" runat="server" />
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" ErrorMessage="Username is required" ControlToValidate="txtUserName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="User: Usuario o Admin" ToolTip="Username" runat="server" />
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password: 1234" ToolTip="Password" runat="server" />
                        </div>
                        <div class="btn-box">
                            <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click" runat="server" />
                            <asp:Label ID="lblNewUser" CssClass="pl-3 text-black-100" Style="color: white" Text="New User? <a href='Registration.aspx' class='badge badge-info' style='padding: 6px'>Register here...</a>" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--Login section End--%>
</asp:Content>
