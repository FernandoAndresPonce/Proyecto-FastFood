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

        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>

    <div class="pcoded-inner-content pt-0" style="margin-top: 0px">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <div  style="text-align:center">
                                <asp:TextBox ID="txtFastFilter" placeholder="Product quick search..." AutoPostBack="true" OnTextChanged="txtFastFilter_TextChanged" CssClass="form-control" runat="server" />
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
                                            <asp:ListItem Text="Description" />
                                            <asp:ListItem Text="Price" />
                                            <asp:ListItem Text="Quantity" />
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
                                        <%  if (ddlField.SelectedValue.ToString() == "Price")
                                            {%>
                                        <asp:RequiredFieldValidator ErrorMessage="(Required a Price)" CssClass="validacion" ControlToValidate="txtAdvancedFilter" runat="server" ID="rfValidator" />
                                        <%} %>
                                         <%  if (ddlField.SelectedValue.ToString() == "Quantity")
                                            {%>
                                        <asp:RequiredFieldValidator ErrorMessage="(Required a Quantity)" CssClass="validacion" ControlToValidate="txtAdvancedFilter" runat="server" ID="RequiredFieldValidator1" />
                                        <%} %>
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


                            <asp:GridView ID="dgvProducts" CssClass="table grid" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvProducts_SelectedIndexChanged" DataKeyNames="ProductId"
                                OnPageIndexChanging="dgvProducts_PageIndexChanging" AllowPaging="True">

                                <Columns>
                                    <asp:BoundField HeaderText="Name" DataField="Name" />
                                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImageUrl" DataImageUrlFormatString="./Image/{0}">
                                        <ControlStyle Height="40px" Width="40px" />
                                    </asp:ImageField>
                                    <asp:BoundField HeaderText="Price" DataField="Price" />
                                    <asp:BoundField HeaderText="Qty" DataField="Quantity" />
                                    <asp:BoundField HeaderText="Category" DataField="Category" />
                                    <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive"></asp:CheckBoxField>
                                    <asp:CommandField ShowSelectButton="true" HeaderText="" SelectText="" ButtonType="Image" SelectImageUrl="~/Admin/Image/writing_4055704 (1).png">

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
