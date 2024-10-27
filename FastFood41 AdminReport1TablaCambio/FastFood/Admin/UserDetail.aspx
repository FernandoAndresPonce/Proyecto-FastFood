<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="FastFood.Admin.UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <%--NameProduct--%>
                            <%--    <div style="margin: 5% 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:Label Text="" runat="server" />
                                <asp:Label Text="" ID="lblNameUser" runat="server" Style="font-weight: bolder; font-size: 1.5em" />
                            </div>--%>


                            <%----------------------------------------------------------------------%>

                            <div class="container  ">

                                <div class="row">
                                    <div class="col-md-6 ">

                                        <%--image--%>

                                        <div class="img-box">
                                            <asp:Image ImageUrl="~/Admin/Image/placeholder/placeholder.jpg" ID="imgUser" CssClass="rounded mx-auto d-block" Style="width: 400px; height: 300px; background-size: contain; background-position: center; margin: 20px" runat="server" />
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="detail-box" style="margin-left: 40px">

                                            <div style="margin: 10% 0px 0px">
                                                <asp:Label Text="Full Name: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblNameUser" runat="server" />
                                            </div>
                                            <div style="margin: 5% 0px 0px">
                                                <asp:Label Text="User Name: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblUsernameUser" runat="server" />
                                            </div>
                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Email: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblEmailUser" runat="server" />
                                            </div>
                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Mobile: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblMobileUser" runat="server" />
                                            </div>

                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="Address: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblAddressUser" runat="server" />
                                            </div>

                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="PostCode: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblPostCodeUser" runat="server" />
                                            </div>

                                            <div class="mb-3" style="margin: 10px 0px 0px">
                                                <asp:Label Text="CreatedDate: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblCreatedDateUser" runat="server" />
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--card--%>
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button Text="Return" ID="btnReturn" CssClass="btn btn-primary" OnClick="btnReturn_Click" runat="server" />
                        
                    </div>

                     <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <%if (Request.QueryString["Id"] != null)
                                    { %>
                                <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 15px">
                                    <asp:Button Text="Delete" ID="btnDelete" CssClass="btn btn-danger" OnClick="btnDelete_Click" runat="server" />
                                </div>
                                <%} %>
                                <%if (ConfirmDeleted)
                                    { %>
                                <div class="mb-3" style="margin: 10px 25%; text-align: center">
                                    <label for="cbConfirmDeletion" class="badge badge-dark" >Confirm Deletion</label>
                                    <asp:CheckBox ID="cbConfirmDeletion" runat="server" />
                                </div>
                                <div>
                                    <asp:Button Text="Confirm Delete" ID="btnConfirmDeletion" CssClass="btn btn-outline-danger" OnClick="btnConfirmDeletion_Click" runat="server" />
                                </div>
                                </div>
                        <%} %>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>


</asp:Content>
