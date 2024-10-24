﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductForm.aspx.cs" Inherits="FastFood.Admin.ProductForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Deberia arreglar este dilema para que se pre carge la imagen antes de guardarla--%>
    <%--   <script>
        function mostrarImagen(input) {
            if (input.file && input.file[0]) {
                var leer = new FileReader();
                leer.onload = function (e) {
                    $('#imgForm').prop('src', e.target.result)
                };
                leer.readAsDataURL(input.files[0]);
            }
        }
    </script>--%>

    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>

    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">

                            <%if (Request.QueryString["Id"] != null || Request.QueryString["Name"] != null)
                                { %>
                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Id" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtProductId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Name" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Product Name)" CssClass="validacion" ControlToValidate="txtProductName" runat="server" ID="rfValidator" />
                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Description" runat="server" CssClass="form-label" />

                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <label for="ddlCategory" class="form-label">Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Price" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Price)" CssClass="validacion" ControlToValidate="TxtPrice" runat="server" ID="RequiredFieldValidator1" />
                                <asp:TextBox ID="TxtPrice" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>


                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Quantity" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Quantity)" CssClass="validacion" ControlToValidate="txtQuantity" runat="server" ID="RequiredFieldValidator2" />
                                <asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>





                            <%--DEBERIA PODER INGRESAR UNA IMAGEN, QUE SE RENDERICE EN EL MOMENTO.--%>

                            <%-------------------------------%>
                            <div class="mb-3" style="margin: 0px 25%">
                                <asp:Label Text="ImageUrl" runat="server" CssClass="form-label" />

                                <input type="file" id="txtImage" class="form-control" runat="server" />
                            </div>


                            <div>
                                <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                            </div>


                            <div class="mb-3" style="margin: 35px 25%; text-align: center; font-size: 1.1em">
                                <label for="cbActivo" class="form-label">Activo</label>
                                <asp:CheckBox ID="cbActivo" runat="server" Checked="true" />
                            </div>
                            <%-------------------------------%>
                            <%if (Request.QueryString["Id"] != null)
                                { %>
                            <div class="mb-3" style="margin: 10px 25%">
                                <asp:Label Text="CreatedDate" runat="server" CssClass="form-label" />
                                <asp:TextBox ID="txtCreatedDate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <asp:Button Text="Add" ID="btnAdd" CssClass="btn btn-primary" OnClick="btnAdd_Click" runat="server" />
                    <%if (Request.QueryString["Id"] != null)
                        { %>
                    <asp:Button Text="Cancel" ID="btnCancel" CssClass="btn btn-primary" OnClick="btnCancel_Click" runat="server" />
                    <%} %>
                </div>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>


                        <%if (Request.QueryString["Name"] != null)
                            { %>
                        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 10px">
                            <asp:Button Text="Cancel" ID="btnAddCancel" CssClass="btn btn-dark" OnClick="btnAddCancel_Click" runat="server" />
                        </div>
                        <%} %>


                        <%if (ConfirmAddCancel)
                            { %>
                        <div class="mb-3" style="margin: 10px 25%; text-align: center">
                            <label for="cbConfirmDeletion" class="form-label">Confirm Cancel</label>
                            <asp:CheckBox ID="cbConfirmAddCancel" runat="server" />
                        </div>
                        <div>
                            <asp:Button Text="Confirm Add Cancel" ID="btnConfirmAddCancel" CssClass="btn btn-outline-danger" OnClick="btnConfirmAddCancel_Click" runat="server" />
                        </div>
                        </div>
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>


                <%-------------------------------%>



                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <%if (Request.QueryString["Id"] != null)
                            { %>
                        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 30px">
                            <asp:Button Text="Delete" ID="btnDelete" CssClass="btn btn-dark" OnClick="btnDelete_Click" runat="server" />
                        </div>
                        <%} %>
                        <%if (ConfirmDeleted)
                            { %>
                        <div class="mb-3" style="margin: 10px 25%; text-align: center">
                            <label for="cbConfirmDeletion" class="form-label">Confirm Deletion</label>
                            <asp:CheckBox ID="cbConfirmDeletion" runat="server" />
                        </div>
                        <div>
                            <asp:Button Text="Confirm Delete" ID="btnConfirmDeletion" CssClass="btn btn-outline-danger" OnClick="btnConfirmDeletion_Click" runat="server" />
                        </div>
                        </div>
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div>
                    <asp:Label ID="lblMsg" Text="" runat="server" />
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>


</asp:Content>
