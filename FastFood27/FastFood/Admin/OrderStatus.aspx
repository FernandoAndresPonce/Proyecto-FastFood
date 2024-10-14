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


            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-block">
                                <div class="row">

                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <h4 class="sub-title">Category</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Category Name</label>
                                    </div>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Enter Category Name" required></asp:TextBox>
                                    <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Category Image</label>
                            </div>
                            <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                        </div>
                    </div>
                    <div class="form-check pl-4">
                        <asp:CheckBox Text="&nbsp; IsActive" ID="csIsActive" CssClass="form-check-input" runat="server" />
                    </div>

                    <div class="pb-5">
                        <asp:Button ID="btnAddOrUpdate" Text="Add" runat="server" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                        &nbsp;
                        <asp:Button ID="btnClear" Text="CLear" runat="server" CssClass="btn btn-primary" CausesValidation="false" />
                    </div>
                    <div>
                        <asp:Image ID="imgCategory" CssClass="img-thumbnail" runat="server" />
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
