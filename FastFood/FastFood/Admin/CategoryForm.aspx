<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryForm.aspx.cs" Inherits="FastFood.Admin.CategoryForm" %>

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
        .validacion{
            color:#ff0000;
            font-size:10px;
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

                            <%if (Request.QueryString["Id"] != null)
                                { %>
                            <div class="mb-3" style="margin: 20px 25%">
                                <asp:Label Text="Category Id" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtCategoryId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                            <div class="mb-3" style="margin: 20px 25% 0px" >
                                <asp:Label Text="Name" runat="server" CssClass="form-label" />
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Required Name" CssClass="validacion" ControlToValidate="txtName" runat="server" ID="rfValidator"/>
                            </div>
                            <div class="mb-3" style="margin: 0px 25%">
                                <asp:Label Text="ImageUrl" runat="server" CssClass="form-label" />

                                <%--DEBERIA PODER INGRESAR UNA IMAGEN, QUE SE RENDERICE EN EL MOMENTO.--%>

                                <%--corregir--%>

                                <input type="file" id="txtImage" class="form-control" runat="server" onchange="mostrarImagen(this)" />


                            </div>
                            <%--corregir--%>
                            <div>
                                <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                            </div>
                            <div class="mb-3" style="margin: 35px 25%; text-align: center; font-size: 1.1em">
                                <label for="cbActivo" class="form-label">Activo</label>
                                <asp:CheckBox ID="cbActivo" runat="server" Checked="true" />
                            </div>
                            <%if (Request.QueryString["Id"] != null)
                                { %>
                            <div class="mb-3" style="margin: 10px 25%">
                                <asp:Label Text="CreatedDate" runat="server" CssClass="form-label" />
                                <asp:TextBox ID="txtCreatedDate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <asp:Button Text="Add" ID="btnAccept" CssClass="btn btn-primary" OnClick="btnAccept_Click" runat="server" />
                             <%if (Request.QueryString["Id"] != null)
                                { %>
                            <asp:Button Text="Cancel" ID="btnCancel" CssClass="btn btn-primary" OnClick="btnCancel_Click" runat="server" />
                              <%} %>
                        </div>
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
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
