<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryDetail.aspx.cs" Inherits="FastFood.Admin.CategoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--CategoryDetail section--%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card" style="background-color: rgb(256,256,256,0.2); color: whitesmoke; border: 1px solid white;">
                            <div style="margin: 30px 40px;">
                                <asp:Label ID="lblCategoryTitle" Text="View Category" CssClass="sub-title" Style="font-size: 25px; color: white" runat="server"></asp:Label>
                            </div>
                            <div style="margin: 0 25% 0; text-align: center; font-size: 1.1em">
                                <asp:Label ID="lblNameCategory" runat="server" Style="font-weight: bolder; font-size: 1.5em" />
                                <div>
                                    <div style="margin: 5% 0px 0px">
                                        <asp:Label Text="Category: " runat="server" Style="font-weight: bolder" />
                                        <asp:Label Text="" ID="lblIdCategory" runat="server" />
                                    </div>
                                    <div>
                                        <div style="margin: 5% 0px 20px">
                                            <asp:Label Text="CreatedDate: " runat="server" Style="font-weight: bolder" />
                                            <asp:Label Text="" ID="lblCreatedDateCategory" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="img-box">
                                    <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgForm" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center" runat="server" />
                                </div>
                            </div>
                            <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:CheckBox ID="cbActivo" runat="server" />
                            </div>
                            <div>
                                <div style="margin: 0px 25% 0px; text-align: center; font-size: 1.1em">
                                    <%if (cbActivo.Checked)
                                        { %>
                                    <asp:Label Text="Active" ID="lblActive" CssClass="badge badge-success" runat="server" />
                                    <%}
                                        else
                                        { %>
                                    <asp:Label Text="Inactive" ID="lblInactive" CssClass="badge badge-danger" runat="server" />
                                    <%} %>
                                </div>
                            </div>
                            <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:CheckBox ID="cbOffert" runat="server" />
                            </div>
                            <div>
                                <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                                    <%if (cbOffert.Checked)
                                        { %>
                                    <asp:Label Text="Offert" ID="lblOffer" CssClass="badge badge-success" runat="server" />
                                    <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                                        <asp:Label Text="" ID="lblOfferPercentage" runat="server" Style="font-weight: bolder" />%
                                    </div>
                                    <%}
                                        else
                                        { %>
                                    <asp:Label Text="No Offert" ID="lblNoOffert" CssClass="badge badge-danger" runat="server" />
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Edit" ID="btnEdit" CssClass="btn btn-secondary" OnClick="btnEdit_Click" runat="server" />
                        <asp:Button Text="Return" ID="btnReturn" CssClass="btn btn-light" OnClick="btnReturn_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--CategoryDetail section End--%>
</asp:Content>
