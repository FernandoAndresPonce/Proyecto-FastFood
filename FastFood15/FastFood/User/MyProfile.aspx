<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="FastFood.User.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">




    <%--   <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>--%>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(150)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>

    <%--    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
                <asp:Label ID="lblHeaderMsg" Text="<h2>My Profile" runat="server" />
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
                            <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" ErrorMessage="Name must be in character only" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name" runat="server" />
                        </div>



                        <div>
                            <asp:RequiredFieldValidator ID="rfvMobile" ErrorMessage="Mobile number is required" ControlToValidate="txtMobile" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" ErrorMessage="Mobile No must have 10 digits" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile" runat="server"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtMobile" TextMode="Number" CssClass="form-control" placeholder="Enter Mobile Number" ToolTip="Mobile Number" runat="server" />
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

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
                            <asp:FileUpload ID="fuUserImage" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" runat="server" />
                        </div>

                    </div>
                </div>

                <div class="row pl-4">
                    <div class="btn-box">
                        <asp:Button ID="btnUpdate" Text="Update" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnUpdate_Click" runat="server" />
                        <asp:Button ID="btnDeleteUser" Text="Delete" CssClass="btn btn-danger rounded-pill pl-4 pr-4 text-white" OnClick="btnDeleteUser_Click" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row p-5 justify-content-center">
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Image ImageUrl="~/User/Image/PerfilImage.jpg" ID="imgUser" runat="server" CssClass="rounded mx-auto d-block" Style="width: 400px;height: 400px; background-size: contain; background-position: center" />
                </div>
            </div>
        </div>
    </section>--%>

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <h2>My Profile </h2>
            </div>


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <asp:Image ImageUrl="~/User/Image/PerfilImage.jpg" ID="imgUser" runat="server" CssClass="rounded mx-auto d-block" Style="width: 150px; height: 150px;" />
                                        <div class="middle pt-2">
                                            <a href="Registration.aspx" class="btn btn-warning"><i class="fa fa-pencil mr-2"></i>Edit Details</>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="userData ml-3">
                                        <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                            <a href="javascript:void(0);">
                                                <asp:Label ID="lblFullNameUser1" runat="server" ToolTip="User Full Name" /></a>

                                        </h2>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblUserName1" runat="server" ToolTip="Unique UserName" />

                                            </a>
                                        </h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblEmail1" runat="server" ToolTip="User Email" />
                                            </a>
                                        </h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblLastUpdate1" runat="server" ToolTip="Last Update" />
                                            </a>
                                        </h6>

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false"><i class="fa fa-id-badge mr-2"></i>Basic Info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                                aria-controls="connectedServices" aria-selected="true">
                                                <i class="fa fa-clock-o mr-2"></i>Purchased History</a>
                                        </li>
                                    </ul>


                                    <div class="tab-content ml-1" id="myTabContent">

                                        <%--info basica, comienzo--%>
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                           <%-- <asp:Repeater ID="rMyProfile" runat="server">
                                                <ItemTemplate>--%>

                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            @<%# Eval("Name") %>
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

                                            <%--    </ItemTemplate>
                                            </asp:Repeater>--%>

                                        </div>
                                        <%--info basica, final--%>

                                        <%--Registro de las compras, comienzo--%>

                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                            <h3>Order History</h3>
                                        </div>
                                        <%--Registro de las compras, final--%>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>


</asp:Content>
