<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="FastFood.Admin.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <%--NameProduct--%>
                            <div style="margin: 5% 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:Label Text="" runat="server" />
                                <asp:Label Text="" ID="lblNameProduct" runat="server" Style="font-weight: bolder; font-size: 1.5em" />
                            </div>


                            <%----------------------------------------------------------------------%>

                            <div class="container  ">

                                <div class="row">
                                    <div class="col-md-6 ">

                                        <%--image--%>


                                        <div class="img-box">
                                            <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="detail-box" style="margin-left: 40px">


                                            <div style="margin: 20% 0px 0px">
                                                <asp:Label Text="Category: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblCategoryProduct" runat="server" />
                                            </div>
                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Price: $" runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblPriceProduct" runat="server" />
                                            </div>
                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Quantity: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblQuantityProduct" runat="server" />
                                            </div>

                                            <div>
                                                <div class="mb-3" style="margin: 10px 0px 0px 35px">
                                                    <%if (cbActivo.Checked)
                                                        { %>
                                                    <asp:Label Text="Active" ID="Label1" CssClass="badge badge-success" runat="server" />
                                                    <%}
                                                        else
                                                        { %>
                                                    <asp:Label Text="Inactive" ID="Label2" CssClass="badge badge-danger" runat="server" />
                                                    <%} %>
                                                </div>
                                            </div>
                                            <%--  <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Description" runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblDescriptionProduct" runat="server" />
                                            </div>--%>
                                            <%--<a href="">Read More</a>--%>
                                        </div>
                                    </div>






                                </div>
                            </div>

                            <div style="margin: 10px 25% 20px; text-align: center; font-size: 1.1em">
                                <asp:Label Text="Description" runat="server" Style="font-weight: bolder" />
                                <asp:Label Text="" ID="lblDescriptionProduct" runat="server" />
                            </div>

                            <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:CheckBox ID="cbActivo" runat="server" />
                            </div>


                         <%--   <div>
                                <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                                    <%if (cbActivo.Checked)
                                        { %>
                                    <asp:Label Text="Active" ID="lblActive" CssClass="badge badge-success" runat="server" />
                                    <%}
                                        else
                                        { %>
                                    <asp:Label Text="Inactive" ID="lblInactive" CssClass="badge badge-danger" runat="server" />
                                    <%} %>
                                </div>
                            </div>--%>

                            <%----------------------------------------------------------------------%>
                        </div>
                    </div>
                    <%--card--%>
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Edit" ID="btnEdit" CssClass="btn btn-primary" OnClick="btnEdit_Click" runat="server" />
                        <asp:Button Text="Return" ID="btnReturn" CssClass="btn btn-primary" OnClick="btnReturn_Click" runat="server" />

                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
