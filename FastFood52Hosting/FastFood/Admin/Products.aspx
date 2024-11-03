<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FastFood.Admin.Products" %>

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
    <script type="text/javascript">
        function filterGridView() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById('<%= txtFastFilter.ClientID %>');
            filter = input.value.toUpperCase();
            table = document.getElementById('<%= dgvProducts.ClientID %>');
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        }
                    }
                }
            }
        }
</script>
    <%--Scripts section End--%>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Style section--%>
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

        .transparent-grid {
            background-color: transparent !important;
            border: 1px solid white !important;
            border-radius: 10px;
            overflow: hidden;
        }

            .transparent-grid td, .transparent-grid th {
                background-color: rgba(256, 256, 256, 0.2);
                border: none;
                color: whitesmoke;
                font-size: 16px;
            }
    </style>
    <%--Style section End--%>

    <%--Product section--%>
    <div class="pcoded-inner-content pt-0" style="margin-top: 0px">
        <div class="main-body">
            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%;">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"
                        CssClass="mensaje-label" />
                </div>
            </div>
            <div class="page-wrapper" style="margin: 0px 2%">
                <div class="page-body">
                    <div class="col-12 mobil-inputs">
                        <h4 class="sub-title text-white" style="margin-bottom: 40px;">Products</h4>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="d-grid justify-content-end" style="margin-bottom: 20px">
                                <asp:Button Text="Add Product" ID="btnAdd" CssClass="btn btn-secondary" OnClick="btnAdd_Click" runat="server" />
                            </div>
                            <div style="text-align: center; color: white">
                                <asp:TextBox ID="txtFastFilter" placeholder="Product quick search..."
                                    CssClass="form-control" Style="background: rgb(256, 256, 256, 0.5); color: black" runat="server"
                                    onkeyup="filterGridView()" />
                                <br />
                                <asp:CheckBox ID="cbAdvancedFilter" runat="server" OnCheckedChanged="cbAdvancedFilter_CheckedChanged" AutoPostBack="true" />
                                <label for="cbAdvancedFilter" class="form-label">Advanced Filter</label>
                            </div>
                            <%if (FilterAdvanced)
                                { %>
                            <div class="row">
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Field" Style="color: white" ID="txtField" runat="server" />
                                        <asp:DropDownList CssClass="form-control" Style="background: rgb(256, 256, 256, 0.5)" runat="server" ID="ddlField" OnSelectedIndexChanged="ddlField_SelectedIndexChanged" AutoPostBack="true">
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
                                        <asp:Label Text="Criterion" Style="color: white" runat="server" />
                                        <asp:DropDownList ID="ddlCriterion" Style="background: rgb(256, 256, 256, 0.5)" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Filter" Style="color: white" runat="server" />
                                        <%  if (ddlField.SelectedValue.ToString() == "Price")
                                            {%>
                                        <asp:RequiredFieldValidator ErrorMessage="(Required a Price)" CssClass="validacion" ControlToValidate="txtAdvancedFilter" runat="server" ID="rfValidator" />
                                        <%} %>
                                        <%  if (ddlField.SelectedValue.ToString() == "Quantity")
                                            {%>
                                        <asp:RequiredFieldValidator ErrorMessage="(Required a Quantity)" CssClass="validacion" ControlToValidate="txtAdvancedFilter" runat="server" ID="RequiredFieldValidator1" />
                                        <%} %>
                                        <asp:TextBox runat="server" Style="background: rgb(256, 256, 256, 0.5)" ID="txtAdvancedFilter" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="State" Style="color: white" runat="server" />
                                        <asp:DropDownList CssClass="form-control" Style="background: rgb(256, 256, 256, 0.5)" ID="ddlState" runat="server">
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
                            <asp:GridView ID="dgvProducts" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvProducts_SelectedIndexChanged" DataKeyNames="ProductId"
                                OnSorting="dgvProducts_Sorting" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField HeaderText="Name ↑↓" DataField="Name" SortExpression="Name">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImageUrl" DataImageUrlFormatString="./Image/Products/{0}">
                                        <ControlStyle Height="40px" Width="40px" />
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:ImageField>
                                    <asp:BoundField HeaderText="Price ↑↓" DataField="Price" SortExpression="Price">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Qty ↑↓" DataField="Quantity" ReadOnly="True" SortExpression="Quantity">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Category ↑↓" DataField="ProductCategory" SortExpression="ProductCategory">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="IsActive ↑↓" SortExpression="IsActive">
                                        <ItemTemplate>
                                            <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "badge badge-success" : "badge badge-danger" %>'>
                                                <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                        </ItemTemplate>
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IsOffer↑↓" SortExpression="IsOffer">
                                        <ItemTemplate>
                                            <span class='<%# Convert.ToBoolean(Eval("IsOffer")) ? "badge badge-success" : "badge badge-danger" %>'>
                                                <%# Convert.ToBoolean(Eval("IsOffer")) ? "Offer" : "NoOffer" %>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:TemplateField>
                                    <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/icons8-visible-50.png" HeaderText="Action">
                                        <ControlStyle Height="20px" Width="20px" />
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <%--Product section End--%>
</asp:Content>
