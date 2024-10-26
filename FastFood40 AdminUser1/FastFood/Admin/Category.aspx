<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FastFood.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
            table = document.getElementById('<%= dgvCategory.ClientID %>');
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none"; // Ocultar todas las filas
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = ""; // Mostrar fila si coincide
                            break;
                        }
                    }
                }
            }
        }
</script>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>






    <style>
        .grid {
            text-align: center;
            background-position: center;
            background-size: cover;
        }

        .allhome {
            height: 100vh;
            width: 100%;
            background: url(../TemplateFiles/images/fondo3.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
        }

        .transparent-grid {
            background-color: transparent !important;
            border: 5px solid white !important;
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

                            <div style="text-align: center; color: white">



                                <asp:TextBox ID="txtFastFilter" placeholder="Category quick search..."
                                    CssClass="form-control" Style="background: rgb(256, 256, 256, 0.5)" runat="server"
                                    onkeyup="filterGridView()" />
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
                                        <asp:Label Text="Field" ID="txtField" Style="color: white" runat="server" />

                                        <asp:DropDownList Style="background: rgb(256, 256, 256, 0.5)" CssClass="form-control" runat="server" ID="ddlField" OnSelectedIndexChanged="ddlField_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="[Selection]" />
                                            <asp:ListItem Text="Name" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%  if (ddlField.SelectedValue.ToString() != "[Selection]")
                                    {%>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Criterion" Style="color: white" runat="server" />
                                        <asp:DropDownList Style="background: rgb(256, 256, 256, 0.5)" ID="ddlCriterion" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Filter" Style="color: white" runat="server" />
                                        <asp:TextBox Style="background: rgb(256, 256, 256, 0.5)" runat="server" ID="txtAdvancedFilter" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="State" Style="color: white" runat="server" />
                                        <asp:DropDownList Style="background: rgb(256, 256, 256, 0.5)" CssClass="form-control" ID="ddlState" runat="server">
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
                            <asp:GridView ID="dgvCategory" CssClass="table grid transparent-grid" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" DataKeyNames="CategoryId"
                                OnPageIndexChanging="dgvCategory_PageIndexChanging" AllowPaging="True"
                                OnSorting="dgvCategory_Sorting" AllowSorting="True">


                                <Columns>
                                    <asp:BoundField HeaderText="Name ↑↓" DataField="Name" SortExpression="Name">
                                        <HeaderStyle ForeColor="Silver" />
                                    </asp:BoundField>
                                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImageUrl" DataImageUrlFormatString="./Image/Categories/{0}">
                                        <ControlStyle Height="40px" Width="40px" />
                                        <HeaderStyle ForeColor="Silver" />
                                    </asp:ImageField>
                                    <asp:TemplateField HeaderText="IsActive↑↓" SortExpression="IsActive">
                                        <ItemTemplate>
                                            <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "badge badge-success" : "badge badge-danger" %>'>
                                                <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle ForeColor="Silver" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="IsOffert↑↓" SortExpression="IsOffert">
                                        <ItemTemplate>
                                            <span class='<%# Convert.ToBoolean(Eval("IsOffert")) ? "badge badge-success" : "badge badge-danger" %>'>
                                                <%# Convert.ToBoolean(Eval("IsOffert")) ? "Offer" : "NoOffert" %>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle ForeColor="Silver" />
                                    </asp:TemplateField>
                                    <%--                                    <asp:BoundField HeaderText="CreatedDate" DataField="CreatedDate" />--%>
                                    <asp:CommandField HeaderText="Action" ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/icons8-visible-50.png">
                                        <ControlStyle Height="20px" Width="20px" />
                                        <HeaderStyle ForeColor="Silver" />
                                    </asp:CommandField>



                                </Columns>

                            </asp:GridView>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dgvCategory" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Add" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" runat="server" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
