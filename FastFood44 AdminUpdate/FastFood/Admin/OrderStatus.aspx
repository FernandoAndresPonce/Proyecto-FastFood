<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="FastFood.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <style>
        .grid {
            text-align: center;
            background-position: center;
            background-size: cover;
        }
    </style>

    <%--<div class="pcoded-inner-content pt-0" style="margin-top: 0px">--%>

    <%---------------------%>

    <div class="heading_container">
        <div class="align-self-end" style="text-align: center; width: 100%;">
            <asp:Label ID="lblMsg" runat="server" Visible="false"
                CssClass="mensaje-label" />
        </div>
    </div>

    <%---------------------%>

    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" style="background: black; color: white">
                            <div class="card-header">
                            </div>
                            <div class="card-block">

                                <div class="row">
                                    <%--//cantidad de columnas abajo--%>
                                    <div class="col-sm-6 col-md-8 col-lg-8">
                                        <h4 class="sub-title" style="font-size: 20px; color: white">Order List</h4>

                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">

                                                <asp:Repeater ID="rOrderStatus" runat="server" OnItemCommand="rOrderStatus_ItemCommand">
                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">Order No.</th>
                                                                    <th>Order Date</th>
                                                                    <th>Status</th>
                                                                    <th>Product Name</th>
                                                                    <th>Total Price</th>
                                                                    <th>Product Mode</th>
                                                                    <th class="datatable-nosort">Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus"><%# Eval("OrderNo")%></td>
                                                            <td><%# Eval("OrderDate")%>
                                                                <%-- <img alt="" width="40" src="" />--%>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                    CssClass='<%# GetBadgeClass(Eval("Status").ToString()) %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <%# Eval("ProductName") %>
                                                            </td>
                                                            <td>
                                                                <%# Eval("TotalPrice") %>
                                                            </td>
                                                            <td>
                                                                <%# Eval("PaymentMode") %>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("OrderDetailsId") %>' CommandName="edit"> <i class="ti-pencil"></i>

                                                                </asp:LinkButton>

                                                            </td>
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




                                    <div class="col-sm-6 col-md-4 col-lg-4 mobile-inputs">
                                        <%--//cantidad de columnas abajo--%>
                                        <asp:Panel ID="pUpdateOrderStatus" runat="server">

                                            <h4 class="sub-title" style="font-size: 18px; color: white">Update Status</h4>

                                            <div>
                                                <div class="form-group">
                                                    <label>Order Status</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0">Select Status</asp:ListItem>
                                                            <asp:ListItem>Pending</asp:ListItem>
                                                            <asp:ListItem>Dispatched</asp:ListItem>
                                                            <asp:ListItem>Delivered</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <%--initialValue excluye el valor "Select Status" Value 0 de la ddl--%>
                                                        <asp:RequiredFieldValidator ID="rfvDdlOrderStatus" ForeColor="Red" ControlToValidate="ddlOrderStatus" ErrorMessage="Order status is required" SetFocusOnError="true" Display="Dynamic" InitialValue="0" runat="server"></asp:RequiredFieldValidator>

                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>


                                                <div class="pb-5">
                                                    <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                                    &nbsp;
                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn btn-primary" OnClick="btnCancel_Click" />
                                                </div>

                                            </div>
                                        </asp:Panel>
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
