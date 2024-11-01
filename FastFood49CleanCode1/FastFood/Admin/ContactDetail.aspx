<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ContactDetail.aspx.cs" Inherits="FastFood.Admin.ContactDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--ContactDetail section --%>
    <div class="pcoded-inner-content pt-0">
        <div class="main-body">
            <div class="page-wrapper" style="margin: 0px 10%">
                <div class="page-body">
                    <div class="row">
                    </div>
                    <div class="col-sm-12">
                        <div class="card" style="background-color: rgb(256,256,256,0.2); color: whitesmoke; border: 1px solid white;">
                            <div style="margin: 30px 40px;">
                                <asp:Label ID="lblContactTitle" Text="View Query" CssClass="sub-title" Style="font-size: 25px; color: white" runat="server"></asp:Label>
                            </div>
                            <div style="margin: 0px 25% 0px; text-align: center; font-size: 1.1em">
                                <asp:Label Text="" runat="server" />
                                <asp:Label Text="" ID="lblNameContact" runat="server" Style="font-weight: bolder; font-size: 1.5em" />
                            </div>
                            <div class="container  ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail-box" style="margin-left: 40px">
                                            <div class="mb-3" style="margin-top: 20px;">
                                                <asp:Label Text="SrNo: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblContactSrNo" runat="server" />
                                            </div>
                                            <div class="mb-3">
                                                <asp:Label Text="Email:$" runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblContactEmail" runat="server" />
                                            </div>
                                            <div class="mb-3">
                                                <asp:Label Text="Subject: " runat="server" Style="font-weight: bolder" />
                                                <asp:Label Text="" ID="lblSubject" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin: 10px 25% 20px; text-align: center; font-size: 1.1em">
                                    <asp:Label Text="Description" runat="server" Style="font-weight: bolder" />
                                    <asp:Label Text="" ID="lblDescriptionContact" runat="server" />
                                </div>
                                <div style="margin: 10px 25% 20px; text-align: center; font-size: 1.1em">
                                    <asp:Label Text="Create Date: " runat="server" Style="font-weight: bolder" />
                                    <asp:Label Text="" ID="lblCreateDate" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <asp:Button Text="Return" ID="btnReturn" CssClass="btn btn-light" OnClick="btnReturn_Click" runat="server" />
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
                                    <label for="cbConfirmDeletion" class="badge badge-dark">Confirm Deletion</label>
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
    </div>
    <%--ContactDetail section End--%>
</asp:Content>
