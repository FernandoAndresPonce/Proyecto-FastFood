<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="FastFood.Admin.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Error section--%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">

                            <h2>Error</h2>
                            <a href="Dashboard.aspx">Returns</a>
                            <asp:Label Text="text" ID="lblError" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Error section End--%>
</asp:Content>
