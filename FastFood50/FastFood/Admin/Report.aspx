<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="FastFood.Admin.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--SCripts section--%>
    <script type="text/javascript">
        function filterGridView() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById('<%= txtFastFilter.ClientID %>');
            filter = input.value.toUpperCase();
            table = document.getElementById('<%= dgvReport.ClientID %>');
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
    <%--SCripts section End--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Style section--%>
    <style>
        .table {
            background-color: #f0f0f0 !important;
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

        .label-total {
            width: 100%;
            text-align: center;
            color: white;
            margin: 20px 0;
        }
    </style>
    <%--Style section End--%>

    <%--Report section--%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card" style="background: black; color: white">
                                <div class="card-header">
                                    <div class="container">
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label>From Date</label>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvFromDate" ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>To Date</label>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvToDate" ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-secondary mt-md-4" OnClick="btnSearch_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-12 mobil-inputs">
                                            <h4 class="sub-title text-white">Selling Report</h4>
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtFastFilter" placeholder="Report quick search..."
                                                        CssClass="form-control" Style="background: rgba(255, 255, 255, 0.5); margin: 20px auto; width: 80%; color: black"
                                                        runat="server" onkeyup="filterGridView()" />
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label runat="server" ID="lblTotal" CssClass="label-total" Font-Bold="true" Font-Size="Small" Style="width: 100%"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <asp:GridView ID="dgvReport" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                                        OnSorting="dgvReport_Sorting" AllowSorting="True">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Order No. ↑↓" DataField="SrNo" SortExpression="SrNo">
                                                                <HeaderStyle ForeColor="White" BackColor="Black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="User Name ↑↓" DataField="UserName" SortExpression="UserName">
                                                                <HeaderStyle ForeColor="White" BackColor="Black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Email ↑↓" DataField="UserEmail" SortExpression="UserEmail">
                                                                <HeaderStyle ForeColor="White" BackColor="Black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Item Orders ↑↓" DataField="Quantity" SortExpression="Quantity">
                                                                <HeaderStyle ForeColor="White" BackColor="Black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Total Cost ↑↓" DataField="TotalPrice" SortExpression="TotalPrice">
                                                                <HeaderStyle ForeColor="White" BackColor="Black" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Report section End--%>
</asp:Content>
