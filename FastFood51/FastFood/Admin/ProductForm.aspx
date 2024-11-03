<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductForm.aspx.cs" Inherits="FastFood.Admin.ProductForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        function ImagePreview(input) {
            var imgElement = $('#<%=imgForm.ClientID%>');

            if (input.files && input.files[0]) {
                if (input.files[0].size > 5242880) {
                    alert("The file size exceeds the allowed limit of 5 MB.");
                    $(input).val('');
                    imgElement.prop('src', '../TemplateFiles/images/placeholder.jpg');
                    return;

                }
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgElement.prop('src', e.target.result)
                        .width(400)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                imgElement.prop('src', '../TemplateFiles/images/perfil.png');
            }
        }
</script>
    <%--Scripts section End--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Style section--%>
    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>
    <%--Style section End--%>

    <%--ProductForm section--%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card" style="background-color: rgb(256,256,256,0.2); color: whitesmoke; border: 1px solid white;">

                            <div style="margin: 30px 40px;">
                                <asp:Label ID="lblProductTitle" Text="Add Product" CssClass="sub-title" Style="font-size: 25px; color: white" runat="server"></asp:Label>
                            </div>
                            <%if (Request.QueryString["Id"] != null || Request.QueryString["Name"] != null)
                                { %>
                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Id" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtProductId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Name" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Product Name)" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductName" runat="server" ID="rfValidator" />
                                <asp:RegularExpressionValidator ID="revName" ErrorMessage="(Name must be in character only)" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtProductName" runat="server"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                            </div>
                            <div class="mb-3" style="margin: 10px 25% 0px">
                                <asp:Label Text="Product Description" runat="server" CssClass="form-label" />
                                <asp:RegularExpressionValidator ControlToValidate="txtDescription" ValidationExpression=".{0,160}" ErrorMessage="Only allow 160 caracters max." runat="server" CssClass="validacion" Display="Dynamic" SetFocusOnError="true"> </asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control" MaxLength="161"></asp:TextBox>
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
                            <div class="mb-3" style="margin: 0px 25%">
                                <asp:Label Text="Product Image" runat="server" CssClass="form-label" />
                                <input type="file" id="txtImage" class="form-control" runat="server" onchange="ImagePreview(this);" />
                            </div>
                            <div>
                                <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                            </div>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                        <asp:CheckBox ID="cbActivo" runat="server" Checked="true" AutoPostBack="true" />
                                    </div>
                                    <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                                        <%if (cbActivo.Checked)
                                            { %>
                                        <asp:Label Text="Active" ID="lblActive" CssClass="badge badge-success" runat="server" />
                                        <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                            <asp:CheckBox ID="cbOffert" runat="server" Checked="false" AutoPostBack="true" />
                                        </div>
                                        <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                                            <%if (cbOffert.Checked)
                                                { %>
                                            <asp:Label Text="Offer" ID="Label1" CssClass="badge badge-success" runat="server" />
                                            <%}
                                                else
                                                { %>
                                            <asp:Label Text="No Offer" ID="Label2" CssClass="badge badge-danger" runat="server" />

                                            <%}%>
                                        </div>
                                        <%
                                            }
                                            else
                                            { %>
                                        <asp:Label Text="Inactive" ID="lblInactive" CssClass="badge badge-danger" runat="server" />
                                        <%} %>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                    <asp:Button Text="Add" ID="btnAdd" CssClass="btn btn-secondary" OnClick="btnAdd_Click" runat="server" />
                </div>
                <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 10px">
                    <a class="btn btn-light" href="Products.aspx">Cancel</a>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <%if (Request.QueryString["Id"] != null)
                            { %>
                        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 30px">
                            <asp:Button Text="Delete" ID="btnDelete" CssClass="btn btn-danger" OnClick="btnDelete_Click" runat="server" />
                        </div>
                        <%} %>
                        <%if (ConfirmDeleted)
                            { %>
                        <div class="mb-3" style="margin: 10px 25%; text-align: center">
                            <label for="cbConfirmDeletion" class="badge badge-dark">Confirm Deletion</label>
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
    <%--ProductForm section End--%>
</asp:Content>
