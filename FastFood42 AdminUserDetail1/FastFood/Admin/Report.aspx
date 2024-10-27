<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="FastFood.Admin.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
        </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .table {
            background-color: #f0f0f0 !important; /* Color gris claro */
        }
    </style>

    <div class="pcoded-inner-content pt-0">
        <%--  <div class="align-self-end" style="text-align: center; width: 100%;">
            <asp:Label ID="lblMsg" runat="server" Visible="false"
                CssClass="mensaje-label" />
        </div>--%>


        <%---------------------%>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card" style="background: black; color: white">
                                <div class="card-header">
                                    <%--Report--%>
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
                                                <%-- <label>From Date</label>--%>
                                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary mt-md-4" OnClick="btnSearch_Click" />
                                            </div>
                                            <%--Report--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">




                                    <div class="row">
                                        <%--//cantidad de columnas abajo--%>
                                        <div class="col-12 mobil-inputs">
                                            <h4 class="sub-title text-white">Selling Report</h4>

                                            <div class="card-block table-border-style">
                                                <div class="table-responsive" style="background-color: transparent">

                                                    <asp:Repeater ID="rReport" runat="server">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap table-gray">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Order No.</th>
                                                                        <th>Name</th>
                                                                        <th>Email</th>
                                                                        <th>Item Orders</th>
                                                                        <th>Total Cost</th>
                                                                        <%--                   <th>Product Mode</th>--%>
                                                                        <%--    <th class="datatable-nosort">Edit</th>--%>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <%-- //OJOOOO ACA--%>
                                                                <td class="table-plus">
                                                                    <%# Eval("SrNo")%>

                                                                </td>
                                                                <td>
                                                                    <%# Eval("UserName")%>
                                                                  
                                                                </td>
                                                                <%-- <td>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                        CssClass='<%# Eval("Status").ToString() %>'></asp:Label>
                                                                </td>--%>
                                                                <td>
                                                                    <%# Eval("UserEmail") %>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("Quantity") %>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("TotalPrice") %>
                                                                </td>
                                                                <%--                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("OrderDetailsId") %>' CommandName="edit"> <i class="ti-pencil"></i>

                                                                    </asp:LinkButton>

                                                                </td>--%>
                                                                <%--                  <td>--%>
                                                                <%--ico para eliminar una categoria--%>
                                                                <%--                       <asp:LinkButton ID="lnkDelete" Text="delete" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("OrderDetailsId") %>' CommandName="delete" OnClientClick="return confirm('Do you want delete this category?');"><i class="ti-trash"></i></asp:LinkButton>

                                                            </td>--%>
                                                            </tr>

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pl-4">
                                        <asp:Label runat="server" ID="lblTotal" Font-Bold="true" Font-Size="Small"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
