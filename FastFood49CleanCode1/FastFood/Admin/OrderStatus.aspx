<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="FastFood.Admin.OrderStatus" %>

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
            table = document.getElementById('<%= dgvOrderStatus.ClientID %>');
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

        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            width: 100%;
            color: white;
        }

        .grid-wrapper {
            width: 100%;
            overflow: auto;
        }
    </style>
    <%--Style section End--%>


    <%--OrderStatus section--%>
    <div class="pcoded-inner-content pt-0" style="margin-top: 0;">
        <div class="main-body">
            <div class="heading_container">
                <div class="align-self-end centered-container">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="mensaje-label" />
                </div>
            </div>
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="col-12 mobil-inputs">
                        <h4 class="sub-title text-white">Update Status</h4>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="centered-container">
                                <asp:TextBox ID="txtFastFilter" placeholder="Category quick search..."
                                    CssClass="form-control" Style="background: rgba(256, 256, 256, 0.5); color: black; margin: 20px" runat="server"
                                    onkeyup="filterGridView()" />
                            </div>
                            <div class="grid-wrapper">
                                <asp:GridView ID="dgvOrderStatus" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="dgvOrderStatus_SelectedIndexChanged" DataKeyNames="OrderDetailsId"
                                    OnSorting="dgvOrderStatus_Sorting" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField HeaderText="OrderNo ↑↓" DataField="OrderNo" SortExpression="OrderNo">
                                            <HeaderStyle ForeColor="White" BackColor="Black" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="OrderDate ↑↓" DataField="OrderDate" SortExpression="OrderDate">
                                            <HeaderStyle ForeColor="White" BackColor="Black" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Status ↑↓" SortExpression="Status">
                                            <ItemTemplate>
                                                <span class='<%# GetBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                    </span>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" BackColor="Black" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Product ↑↓" DataField="ProductName" SortExpression="ProductName">
                                            <HeaderStyle ForeColor="White" BackColor="Black" />
                                        </asp:BoundField>
                                        <asp:CommandField HeaderText="Action" ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/signo-de-mas.png">
                                            <ControlStyle Height="20px" Width="20px" />
                                            <HeaderStyle ForeColor="White" BackColor="Black" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <%--OrderStatus section End--%>
</asp:Content>
