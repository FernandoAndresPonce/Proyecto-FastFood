<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FastFood.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <script>
        function ImagePreview(input) {
            var imgElement = $('#<%=imgUser.ClientID%>'); 

            if (input.files && input.files[0]) {
                if (input.files[0].size > 5242880) { 
                    alert("The file size exceeds the allowed limit of 5 MB.");
                    $(input).val(''); 
                    imgElement.prop('src', '../TemplateFiles/images/perfil.png'); 
                    return;
                }

                var reader = new FileReader();
                reader.onload = function (e) {
                    imgElement.prop('src', e.target.result)
                        .width(400)
                        .height(400);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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

    <%--Registration section--%>
    <section class="book_section layout_padding allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
                <asp:Label ID="lblHeaderMsg" Style="color: white" Text="<h2> User Registration" runat="server" />
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" ErrorMessage="Name must be in character only" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name" runat="server" />
                        </div>
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
                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvMobile" ErrorMessage="Mobile number is required" ControlToValidate="txtMobile" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" ErrorMessage="Mobile No must have 10 digits" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtMobile" TextMode="Number" CssClass="form-control" placeholder="Enter Mobile Number" ToolTip="Mobile Number" runat="server" />
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvAddress" ErrorMessage="Address is required" ControlToValidate="txtAddress" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Address" ToolTip="Address" runat="server" />
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPostCode" ErrorMessage="Username is PostCode" ControlToValidate="txtPostCode" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostCode" ErrorMessage="PostCode must be of 4 digits" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{4}$" ControlToValidate="txtPostCode" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtPostCode" TextMode="Number" CssClass="form-control" placeholder="Enter PostCode" ToolTip="PostCode" runat="server" />
                        </div>
                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" onchange="ImagePreview(this)" />
                        </div>
                    </div>
                </div>
                <div class="row pl-4">
                    <div class="btn-box">
                        <asp:Button ID="btnRegister" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" runat="server" />
                        <asp:Label ID="lblAlreadyUser" CssClass="pl-3" Style="color: white" Text="Already registered? <a href='Login.aspx' class='badge badge-info' style='padding: 7px'>Login here...</a>" runat="server" />
                        <asp:Button ID="btnReturn" Text="Return" CssClass="btn btn-info rounded-pill pl-4 pr-4 text-white" Visible="false" OnClick="btnReturn_Click" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row p-5 justify-content-center">
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Image ID="imgUser" ImageUrl="../TemplateFiles/images/perfil.png" runat="server" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 400px; background-size: contain; background-position: center" />
                </div>
            </div>
        </div>
    </section>
    <%--Registration section End--%>
</asp:Content>
