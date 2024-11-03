<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="FastFood.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <%--Scripts section End--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Style section--%>
    <style>
        .grid {
            text-align: center;
            background-position: center;
            background-size: cover;
        }

        .transparent-grid {
            background-color: transparent !important;
            border: 1px solid white !important;
            border-radius: 10px;
            overflow: hidden;
        }

            .transparent-grid td, .transparent-grid th {
                background-color: rgba(256, 256, 256, 0.2);
                border: none;
                color: whitesmoke;
                font-size: 16px;
            }
    </style>
    <%--Style section End--%>

    <%--User section--%>
    <div class="pcoded-inner-content pt-0" style="margin-top: 0px">
        <div class="main-body">
            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%;">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"
                        CssClass="mensaje-label" />
                </div>
            </div>
            <div class="page-wrapper" style="margin: 0px 2%">
                <div class="page-body">
                    <div class="col-12 mobil-inputs">
                        <h4 class="sub-title text-white" style="margin-bottom: 40px;">Users</h4>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="dgvUsers" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvUsers_SelectedIndexChanged" DataKeyNames="UserId"
                                OnPageIndexChanging="dgvUsers_PageIndexChanging" AllowPaging="True"
                                OnSorting="dgvUsers_Sorting" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField HeaderText="Id ↑↓" DataField="UserId" SortExpression="UserId">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Full Name ↑↓" DataField="Name" SortExpression="Name">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="User Name ↑↓" DataField="UserName" SortExpression="Username">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Email ↑↓" DataField="Email" SortExpression="Email">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Joined Date ↑↓" DataField="CreatedDate" SortExpression="CreatedDate">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/icons8-visible-50.png" HeaderText="Action">
                                        <ControlStyle Height="20px" Width="20px" />
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>
    <%--User section End--%>
</asp:Content>
