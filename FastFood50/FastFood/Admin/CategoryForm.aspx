<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryForm.aspx.cs" Inherits="FastFood.Admin.CategoryForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        function mostrarImagen(input) {
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

    <%--CategoryFrom section--%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card" style="background-color: rgb(256,256,256,0.2); color: whitesmoke; border: 1px solid white;">
                            <div style="margin: 30px 40px;">
                                <asp:Label ID="lblCategoryTitle" Text="Add Category" CssClass="sub-title" Style="font-size: 25px; color: white" runat="server"></asp:Label>
                            </div>
                            <%if (Request.QueryString["Id"] != null)
                                { %>
                            <div class="mb-3" style="margin: 20px 25%">
                                <asp:Label Text="Category Id" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtCategoryId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <%} %>
                            <div class="mb-3" style="margin: 20px 25% 0px">
                                <asp:Label Text="Category Name" runat="server" CssClass="form-label" />
                                <asp:RequiredFieldValidator ErrorMessage="(Required Category Name)" CssClass="validacion" Display="Dynamic" ControlToValidate="txtName" runat="server" ID="rfValidator" SetFocusOnError="true" />
                                <asp:RegularExpressionValidator ID="revName" ErrorMessage="(Name must be in character only)" CssClass="validacion" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName" runat="server"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ToolTip="Category Name" MaxLength="50"></asp:TextBox>
                            </div>
                            <div class="mb-3" style="margin: 0px 25%">
                                <asp:Label Text="Category Image" runat="server" CssClass="form-label" />
                                <input type="file" id="txtImage" class="form-control" runat="server" onchange="mostrarImagen(this);" />
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
                                            <div class="mb-3" style="margin: 10px 5% 0px">
                                                <asp:Label Text="Offer Percentage" runat="server" CssClass="form-label" />
                                                <asp:RequiredFieldValidator ErrorMessage="(Required Offer Percentage)" CssClass="validacion" ControlToValidate="txtofferPercentage" runat="server" ID="rfvofferPercentage" Display="Dynamic" SetFocusOnError="true" />
                                                <asp:RegularExpressionValidator ID="revOfferPercentage" ControlToValidate="txtofferPercentage" runat="server" ErrorMessage="(Does not allow negative numbers)" CssClass="validacion" ValidationExpression="^([1-9]\d*|0)$" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                                <asp:RangeValidator ErrorMessage="(Allowed range 0-100)" ControlToValidate="txtofferPercentage" Type="Currency" MinimumValue="-999" MaximumValue="100" runat="server" CssClass="validacion" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                                                <asp:TextBox ID="txtofferPercentage" runat="server" TextMode="Number" CssClass="form-control" Visible="false"></asp:TextBox>
                                            </div>
                                            <%}
                                                else
                                                { %>
                                            <asp:Label Text="No Offer" ID="Label2" CssClass="badge badge-danger" runat="server" />
                                            <%} %>
                                        </div>
                                        <%}
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
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <asp:Button Text="Add" ID="btnAccept" CssClass="btn btn-secondary" OnClick="btnAccept_Click" runat="server" />
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 10px">
                            <a class="btn btn-light" href="Category.aspx">Cancel</a>
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
        </div>
    </div>
    <%--CategoryFrom section--%>
</asp:Content>
