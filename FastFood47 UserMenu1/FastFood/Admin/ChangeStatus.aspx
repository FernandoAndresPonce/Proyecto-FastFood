<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ChangeStatus.aspx.cs" Inherits="FastFood.Admin.ChangeStatus" %>

<%@ Import Namespace="Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .transparent-card {
            border-radius: 10px;
            background-color: rgba(256, 256, 256, 0.2);
        }

        .text-white {
            color: white !important;
        }

        .center-button {
            display: flex;
            justify-content: center;
            margin: 20px 0; /* Espaciado superior e inferior */
        }


        .grid-item {
            margin-bottom: 20px; /* Espaciado entre filas */
        }

        .item-label {
            margin: 0; /* Eliminar margen del párrafo */
        }

        .dropdown-container {
            display: flex;
            justify-content: center; /* Centra el dropdown */
            margin: 30px 0; /* Espaciado superior e inferior */
        }

        .table-row {
            display: flex; /* Usar flexbox para alinear elementos */
            justify-content: center; /* Centrar elementos en la fila */
            align-items: center; /* Alinear verticalmente */
            border: 1px solid white; /* Borde de cada fila */
            border-radius: 10px; /* Bordes redondeados */
            margin-bottom: 10px; /* Espaciado entre filas */
            padding: 10px; /* Espaciado interno */
        }

        @media (max-width: 450px) {
            .btn-red {
                padding: 5px 10px; /* Espaciado interno */
                width: 90%; /* Ancho del botón */
            }
        }
    </style>

    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="col-sm-12">
                        <div class="card transparent-card">

                            <div style="margin: 30px 40px;">
                                <asp:Label Text="Update Status Order" CssClass="sub-title" Style="font-size: 18px; color: white" runat="server"></asp:Label>
                            </div>
                            <div class="container py-5 h-100">
                                <asp:Repeater ID="dgvOrderStatus" runat="server">
                                    <ItemTemplate>
                                        <div class="table-row">
                                            <div class="col-md-2 text-center">
                                                <img src="<%# Utils.GetImageUrlProduct(Eval("ProductImageUrl")) %>" alt="" width="60" />
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <p class="item-label text-white"><%# Eval("OrderNo") %></p>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <p class="item-label text-white"><%# Eval("ProductName") %></p>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <p class="item-label text-white"><%# Eval("Quantity") %> u.</p>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <p class="item-label text-white"><%# Eval("OrderDate") %></p>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <span class='<%# GetBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <div class="dropdown-container">
                                    <div class="col-sm-6 col-md-4 col-lg-4 mobile-inputs">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control" Style="background: rgb(256,256,256, 0.5); color: black">
                                                <asp:ListItem Value="0">Select Status</asp:ListItem>
                                                <asp:ListItem>Pending</asp:ListItem>
                                                <asp:ListItem>Dispatched</asp:ListItem>
                                                <asp:ListItem>Delivered</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvDdlOrderStatus" ForeColor="Red" ControlToValidate="ddlOrderStatus" ErrorMessage="Order status is required" SetFocusOnError="true" Display="Dynamic" InitialValue="0" runat="server"></asp:RequiredFieldValidator>
                                            <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                        </div>
                                    </div>
                                </div>

                                <div style="text-align: center">
                                    <asp:Button ID="btnUpdate" Text="Confirm Status" runat="server" CssClass="btn btn-dark" Style="border-radius: 20px; width: 30%;"  OnClick="btnUpdate_Click" />
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
