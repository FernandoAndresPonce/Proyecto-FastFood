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

        .btn-red {
            background-color: red; /* Color de fondo rojo */
            color: white; /* Texto blanco */
            border: none; /* Sin borde */
            border-radius: 100px; /* Bordes redondeados */
            padding: 10px 20px; /* Espaciado interno */
            font-size: 16px; /* Tamaño de la fuente */
            width: 50%; /* Ancho del botón */
            cursor: pointer; /* Cambia el cursor al pasar */
            text-align: center; /* Centrar el texto */
            transition: background-color 0.3s; /* Transición suave */
        }

            .btn-red:hover {
                background-color: darkred; /* Color al pasar el mouse */
            }

        .grid-item {
            margin-bottom: 20px; /* Espaciado entre filas */
        }

        .item-label {
            margin: 0; /* Eliminar margen del párrafo */
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
                            <div class="container py-5 h-100">
                                <asp:Repeater ID="dgvOrderStatus" runat="server">
                                    <ItemTemplate>
                                        <div class="row grid-item">
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

                                <div Style="text-align:center">
                                    <asp:Button  Text="Confirm Status" ID="btnConfirmOrder" runat="server" CssClass="btn-red"  />


                                </div>

                                <div>
                                    <asp:Button Text="Return " ID="btnReturn" runat="server" OnClick="btnReturn_Click" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
