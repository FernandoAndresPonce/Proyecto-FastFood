<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FastFood.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <style>
        .grid {
            text-align: center;
            background-position: center;
            background-size: cover;
        }
    </style>

    <div class="pcoded-inner-content pt-0" style="margin-top: 0px">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <%--Problema de busqueda, cuando intento buscar ejecutando el boton enter, se buggea y no me deja realizar dicha busqueda.--%>

                            <div>
                                <asp:TextBox ID="txtFastFilter" placeholder="Product quick search..." AutoPostBack="true" OnTextChanged="txtFastFilter_TextChanged" CssClass="form-control" runat="server" />
                                <br />
                                <label for="cbAdvancedFilter" class="form-label">Advanced Filter</label>
                                <asp:CheckBox ID="cbAdvancedFilter" runat="server" OnCheckedChanged="cbAdvancedFilter_CheckedChanged" AutoPostBack="true" />
                            </div>

                            <%-----------------------------------%>


                     <%--       <%if (FilterAdvanced)
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


                            <%} %>--%>


                            <asp:GridView ID="dgvProducts" CssClass="table grid" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvProducts_SelectedIndexChanged" DataKeyNames="ProductId"
                                OnPageIndexChanging="dgvProducts_PageIndexChanging" AllowPaging="True">

                                <Columns>
                                    <asp:BoundField HeaderText="Name" DataField="Name" />
                                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImageUrl" DataImageUrlFormatString="./Image/{0}">
                                        <ControlStyle Height="40px" Width="40px" />
                                    </asp:ImageField>
                                    <asp:BoundField HeaderText="Price" DataField="Price" />
                                    <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                                    <asp:BoundField HeaderText="Category" DataField="Category" />
                                    <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive"></asp:CheckBoxField>
                                    <asp:BoundField HeaderText="CreatedDate" DataField="CreatedDate" />
                                    <asp:CommandField ShowSelectButton="true" HeaderText="Edit" SelectText="" ButtonType="Image" SelectImageUrl="~/Admin/Image/writing_4055704 (1).png">

                                        <ControlStyle Height="20px" Width="20px" />

                                    </asp:CommandField>

                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Add" ID="btnAdd" CssClass="btn btn-primary" OnClick="btnAdd_Click" runat="server" />
                    </div>         
                </div>
            </div>
        </div>
    </div>



</asp:Content>
