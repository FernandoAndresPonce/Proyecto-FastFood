<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="FastFood.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



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
            <div class="page-wrapper" style="margin: 0px 2%">
                <div class="page-body">
                    <div class="col-12 mobil-inputs">
                        <h4 class="sub-title text-white" style="margin-bottom: 40px;">Users</h4>
                    </div>

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <%--Problema de busqueda, cuando intento buscar ejecutando el boton enter, se buggea y no me deja realizar dicha busqueda.--%>

                            <%--    <div style="text-align: center">
                                <asp:TextBox ID="txtFastFilter" placeholder="Category quick search..." AutoPostBack="true" OnTextChanged="txtFastFilter_TextChanged" CssClass="form-control" runat="server" />
                                <br />
                                <asp:CheckBox ID="cbAdvancedFilter" runat="server" OnCheckedChanged="cbAdvancedFilter_CheckedChanged" AutoPostBack="true" />
                                <label for="cbAdvancedFilter" class="form-label">Advanced Filter</label>
                            </div>--%>

                            <%-----------------------------------%>


                            <%--                            <%if (FilterAdvanced)
                                { %>
                            <div class="row">
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Field" ID="txtField" runat="server" />

                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlField" OnSelectedIndexChanged="ddlField_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="[Selection]" />
                                            <asp:ListItem Text="Name" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%  if (ddlField.SelectedValue.ToString() != "[Selection]")
                                    {%>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Criterion" runat="server" />
                                        <asp:DropDownList ID="ddlCriterion" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Filter" runat="server" />
                                        <asp:TextBox runat="server" ID="txtAdvancedFilter" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="State" runat="server" />
                                        <asp:DropDownList CssClass="form-control" ID="ddlState" runat="server">
                                            <asp:ListItem Text="All" />
                                            <asp:ListItem Text="Active" />
                                            <asp:ListItem Text="Inactive" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3">

                                    <div class="mb-3">
                                        <asp:Button Text="Search" CssClass="btn btn-primary" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />
                                    </div>
                                    <%} %>
                                </div>
                            </div>--%>


                            <%--         <%} %>--%>


                            <asp:GridView ID="dgvUsers" CssClass="table grid transparent-grid dataTable" runat="server" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="dgvUsers_SelectedIndexChanged" DataKeyNames="UserId"
                                OnPageIndexChanging="dgvUsers_PageIndexChanging" AllowPaging="True"
                                OnSorting="dgvUsers_Sorting" AllowSorting="True">

                                <Columns>
                                    <asp:BoundField HeaderText="Id" DataField="UserId" SortExpression="UserId">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Full Name" DataField="Name" SortExpression="Name">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="User Name" DataField="UserName" SortExpression="UserName">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email">
                                        <HeaderStyle ForeColor="White" BackColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Joined Date" DataField="CreatedDate" SortExpression="CreatedDate">
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

</asp:Content>
