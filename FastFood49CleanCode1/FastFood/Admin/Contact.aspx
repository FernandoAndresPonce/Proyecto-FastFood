<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FastFood.Admin.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
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
    <%--Scripts section End--%>

    <%--Contact section--%>
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
                        <h4 class="sub-title text-white" style="margin-bottom: 40px;">Contacts</h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="dgvContact" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvContact_SelectedIndexChanged" DataKeyNames="ContactId"
                                OnSorting="dgvContact_Sorting" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField HeaderText="SrNo ↑↓" DataField="ContactId" SortExpression="ContactId">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Name ↑↓" DataField="Name" SortExpression="Name">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Email ↑↓" DataField="Email" SortExpression="Email">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Subject ↑↓" DataField="Subject" SortExpression="Subject">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Contact Date ↑↓" DataField="CreatedDate" SortExpression="CreatedDate">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:CommandField HeaderText="Action" ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Admin/Image/icons8-visible-50.png">
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
    <%--Contact section End--%>
</asp:Content>
