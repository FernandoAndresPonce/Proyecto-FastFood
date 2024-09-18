<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductForm.aspx.cs" Inherits="FastFood.Admin.ProductForm" %>

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
                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>

                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Description" runat="server" CssClass="form-label" />
                                <asp:RegularExpressionValidator ControlToValidate="txtDescription" ValidationExpression=".{0,300}" ErrorMessage="Only allow 300 caracters max." runat="server" CssClass="validacion" Display="Dynamic" SetFocusOnError="true"> </asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control" MaxLength="301" ></asp:TextBox>
                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <label for="ddlCategory" class="form-label">Product Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Price ($)" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage=" (Required Price)" CssClass="validacion" ControlToValidate="TxtPrice" runat="server" ID="RequiredFieldValidator1" SetFocusOnError="true" Display="Dynamic" />
                                <asp:RegularExpressionValidator ErrorMessage="(must be a positive decimal number - 0.00)" CssClass="validacion" ControlToValidate="TxtPrice" SetFocusOnError="true" ValidationExpression="^\d{0,8}(\.\d{1,2})?$" runat="server" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>


                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Quantity" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Quantity)" CssClass="validacion" ControlToValidate="txtQuantity" runat="server" ID="RequiredFieldValidator2" Display="Dynamic" SetFocusOnError="true" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtQuantity" runat="server" ErrorMessage="(Does not allow negative numbers)" CssClass="validacion" ValidationExpression="^([1-9]\d*|0)$" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ErrorMessage="(Allowed range 0-999)" ControlToValidate="txtQuantity" Type="Currency" MinimumValue="-999" MaximumValue="999" runat="server" CssClass="validacion" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>





                            <%--DEBERIA PODER INGRESAR UNA IMAGEN, QUE SE RENDERICE EN EL MOMENTO.--%>

                            <%-------------------------------%>
                            <div class="mb-3" style="margin: 0px 25%">
                                <asp:Label Text="Product Image" runat="server" CssClass="form-label" />

                                <input type="file" id="txtImage" class="form-control" runat="server" />
                            </div>


                            <div>
                                <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                            </div>


                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                        <asp:CheckBox ID="cbActivo" runat="server" Checked="true" OnCheckedChanged="cbActivo_CheckedChanged" AutoPostBack="true" />
                                    </div>
                                    <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                                        <%if (cbActivo.Checked)
                                            { %>
                                        <asp:Label Text="Active" ID="lblActive" CssClass="badge badge-success" runat="server" />
                                        <%}
                                            else
                                            { %>
                                        <asp:Label Text="Inactive" ID="lblInactive" CssClass="badge badge-danger" runat="server" />
                                        <%} %>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

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


</asp:Content>
