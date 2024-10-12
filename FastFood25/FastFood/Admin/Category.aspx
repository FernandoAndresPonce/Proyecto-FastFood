<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FastFood.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>


    <style>
        .grid {
            text-align: center;
            background-position: center;
            background-size: cover;
        }
    </style>

    <div class="pcoded-inner-content pt-0" style="margin-top: 0px">
        <div class="main-body">
            <%---------------------%>

            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%;">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"
                        CssClass="mensaje-label" />
                </div>
            </div>

            <%---------------------%>
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">


                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <%--Problema de busqueda, cuando intento buscar ejecutando el boton enter, se buggea y no me deja realizar dicha busqueda.--%>

                            <div style="text-align: center">
                                <asp:TextBox ID="txtFastFilter" placeholder="Category quick search..." AutoPostBack="true" OnTextChanged="txtFastFilter_TextChanged" CssClass="form-control" runat="server" />
                                <br />
                                <asp:CheckBox ID="cbAdvancedFilter" runat="server" OnCheckedChanged="cbAdvancedFilter_CheckedChanged" AutoPostBack="true" />
                                <label for="cbAdvancedFilter" class="form-label">Advanced Filter</label>
                            </div>

                            <%-----------------------------------%>


                            <%if (FilterAdvanced)
                                { %>
                            <div class="row">
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Field" ID="txtField" runat="server" />

                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlField" OnSelectedIndexChanged="ddlField_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="[Selection]" />
                                            <asp:ListItem Text="Name" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%  if (ddlField.SelectedValue.ToString() != "[Selection]")
                                    {%>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Criterion" runat="server" />
                                        <asp:DropDownList ID="ddlCriterion" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Filter" runat="server" />
                                        <asp:TextBox runat="server" ID="txtAdvancedFilter" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="State" runat="server" />
                                        <asp:DropDownList CssClass="form-control" ID="ddlState" runat="server">
                                            <asp:ListItem Text="All" />
                                            <asp:ListItem Text="Active" />
                                            <asp:ListItem Text="Inactive" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3">

                                    <div class="mb-3">
                                        <asp:Button Text="Search" CssClass="btn btn-primary" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />
                                    </div>
                                    <%} %>
                                </div>
                            </div>


                            <%} %>
                            <asp:GridView ID="dgvCategory" CssClass="table grid" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" DataKeyNames="CategoryId"
                                OnPageIndexChanging="dgvCategory_PageIndexChanging" AllowPaging="True">

                                <Columns>
                                    <asp:BoundField HeaderText="Name" DataField="Name" />
                                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImageUrl" DataImageUrlFormatString="./Image/Categories/{0}">
                                        <ControlStyle Height="40px" Width="40px" />
                                    </asp:ImageField>
                                    <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive"></asp:CheckBoxField>
                                    <%--                                    <asp:BoundField HeaderText="CreatedDate" DataField="CreatedDate" />--%>
                                    <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/find_6217702 (1).png">
                                        <ControlStyle Height="30px" Width="30px" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Add" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" runat="server" />
                    </div>
                    <%--  <div >
                    <asp:Image ImageUrl="https://as2.ftcdn.net/v2/jpg/05/17/53/57/1000_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg" runat="server" />
                </div>--%>

                    <%--<div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-block">
                                <div class="row">

                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <h4 class="sub-title">Category</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Category Name</label>
                                    </div>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Enter Category Name" required></asp:TextBox>
                                    <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Category Image</label>
                            </div>
                            <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                        </div>
                    </div>
                    <div class="form-check pl-4">
                        <asp:CheckBox Text="&nbsp; IsActive" ID="csIsActive" CssClass="form-check-input" runat="server" />
                    </div>

                    <div class="pb-5">
                        <asp:Button ID="btnAddOrUpdate" Text="Add" runat="server" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                        &nbsp;
                        <asp:Button ID="btnClear" Text="CLear" runat="server" CssClass="btn btn-primary" CausesValidation="false" />
                    </div>
                    <div>
                        <asp:Image ID="imgCategory" CssClass="img-thumbnail" runat="server" />
                    </div>
                </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
