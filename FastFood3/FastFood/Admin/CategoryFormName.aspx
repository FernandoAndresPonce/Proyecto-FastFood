﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryFormName.aspx.cs" Inherits="FastFood.Admin.CategoryFormName" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .validacion {
            color: #ff0000;
            font-size: 10px;
        }
    </style>

    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">

                            <div class="mb-3" style="margin: 20px 25% 0px">
                                <asp:Label Text="Category Name" runat="server" CssClass="form-label" />

                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>


                                <asp:RequiredFieldValidator ErrorMessage="Required Name" CssClass="validacion" ControlToValidate="txtName" runat="server" ID="rfValidator" />

                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <asp:Button Text="Next" ID="btnNext" CssClass="btn btn-primary" OnClick="btnNext_Click" runat="server"  />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>