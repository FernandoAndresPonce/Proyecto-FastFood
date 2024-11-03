<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FastFood.User.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Scripts section--%>
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
    <%--Scripts section End--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Style section--%>
    <style>
        .rounded {
            border-radius: 1rem
        }

        .nav-pills .nav-link {
            color: #555
        }

            .nav-pills .nav-link.active {
                color: white
            }

        .bold {
            font-weight: bold
        }

        .card {
            padding: 40px 50px;
            border-radius: 20px;
            border: none;
            box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
        }

        .allhome {
            width: 100%;
            background: url(../TemplateFiles/images/payment3.png);
            background-size: cover;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
        }

        .btn-red {
            background-color: red;
            color: white;
            border: none;
            border-radius: 100px;
            padding: 10px 20px;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

            .btn-red:hover {
                background-color: darkred;
                color: white;
            }

        .btn-continue:hover {
            color: white;
        }

        @media (max-width: 450px) {

            .btn-red {
                padding: 5px 10px;
                color: white;
                border-radius: 100px;
                font-size: 14px;
                width: 100%;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s;
            }
        }
    </style>
    <%--Style section End--%>

    <%--Payment section--%>
    <section class="book_section allhome">
        <div class="container py-5">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-6" style="color: white">Order Payment</h1>
                </div>
            </div>
            <div class="row pb-5">
                <div class="col-lg-6 mx-auto">
                    <div class="card" style="background-color: rgb(1,1,1, 0.5); color: white">
                        <div class="card-header">
                            <div class="bg-transparent shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                    <li class="nav-item"><a data-toggle="pill" href="#credit-card" class="nav-link active "><i class="fa fa-credit-card mr-2"></i>Credit Card </a></li>
                                    <li class="nav-item"><a data-toggle="pill" href="#paypal" class="nav-link "><i class="fa fa-money mr-2"></i>Cash On Delivery </a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div id="credit-card" class="tab-pane fade show active pt-3">
                                    <div role="form">
                                        <div class="form-group">
                                            <label for="txtName">
                                                <h6>Card Owner</h6>
                                            </label>
                                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required"
                                                ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                ValidationGroup="card">
                                                *</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ErrorMessage="Name must be in characters" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName" ValidationGroup="card">
                                                *
                                            </asp:RegularExpressionValidator>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Card Owner Name"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCardNo">
                                                <h6>Card number</h6>
                                            </label>
                                            <asp:RequiredFieldValidator ID="rfvCardNo" runat="server" ErrorMessage="Card number is required"
                                                ControlToValidate="txtCardNo" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                ValidationGroup="card">
                                                *</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                ErrorMessage="Card Number must be of 16 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                ValidationExpression="[0-9]{16}" ControlToValidate="txtCardNo" ValidationGroup="card">
                                                *
                                            </asp:RegularExpressionValidator>
                                            <div class="input-group">
                                                <asp:TextBox ID="txtCardNo" runat="server" CssClass="form-control" placeholder="Valid card number"
                                                    TextMode="SingleLine" MaxLength="16" onkeypress="return event.charCode >= 48 && event.charCode <= 57;">
                                                </asp:TextBox>
                                                <div class="input-group-append">
                                                    <span class="input-group-text text-muted">
                                                        <i class="fa fa-cc-visa mx-1"></i>
                                                        <i class="fa fa-cc-mastercard mx-1"></i>
                                                        <i class="fa fa-cc-amex mx-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <label>
                                                        <span class="hidden-xs">
                                                            <h6>Expiration Date</h6>
                                                        </span>
                                                    </label>
                                                    <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" ErrorMessage="Expiry month is required"
                                                        ControlToValidate="txtExpMonth" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                        ValidationGroup="card">
                                                        *</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic"
                                                        ErrorMessage="Expiry month must be of 2 digits" ForeColor="Red" SetFocusOnError="true"
                                                        ValidationExpression="[0-9]{2}" ControlToValidate="txtExpMonth" ValidationGroup="card">
                                                        *
                                                    </asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" ErrorMessage="Expiry year is required"
                                                        ControlToValidate="txtExpYear" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                        ValidationGroup="card">
                                                        *</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic"
                                                        ErrorMessage="Expiry year must be of 4 digits" ForeColor="Red" SetFocusOnError="true"
                                                        ValidationExpression="[0-9]{4}" ControlToValidate="txtExpYear" ValidationGroup="card">
                                                        *
                                                    </asp:RegularExpressionValidator>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txtExpMonth" runat="server" CssClass="form-control" placeholder="MM"
                                                           TextMode="SingleLine" MaxLength="2" onkeypress="return event.charCode >= 48 && event.charCode <= 57;">
                                                        </asp:TextBox>
                                                        <asp:TextBox ID="txtExpYear" runat="server" CssClass="form-control" placeholder="YYYY"
                                                           TextMode="SingleLine" MaxLength="4" onkeypress="return event.charCode >= 48 && event.charCode <= 57;">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group mb-4">
                                                    <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                    </label>
                                                    <asp:RequiredFieldValidator ID="rfvCvv" runat="server" ErrorMessage="CVV no. is required"
                                                        ControlToValidate="txtCvv" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                        ValidationGroup="card">
                                                        *</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic"
                                                        ErrorMessage="CVV no. must be of 3 digits" ForeColor="Red" SetFocusOnError="true"
                                                        ValidationExpression="[0-9]{3}" ControlToValidate="txtCvv" ValidationGroup="card">
                                                        *
                                                    </asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control" placeholder="CVV No."
                                                        TextMode="SingleLine" MaxLength="3" onkeypress="return event.charCode >= 48 && event.charCode <= 57;">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAddress">
                                                <h6>Delivery Address</h6>
                                            </label>
                                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red"
                                                ControlToValidate="txtAddress" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">
                                                *
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Delivery Address"
                                                TextMode="MultiLine" ValidationGroup="card">
                                            </asp:TextBox>
                                        </div>
                                        <div class="card-footer">
                                            <asp:LinkButton ID="lbCardSubmit" runat="server" CssClass="subscribe btn btn-red btn-block shadow-sm"
                                                ValidationGroup="card" OnClick="lbCardSubmit_Click">
                                                <i class="fa fa-cart-arrow-down mr-2"></i> Confirm Payment</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div id="paypal" class="tab-pane fade pt-3">
                                    <div class="form-group">
                                        <label for="txtCODAddress">
                                            <h6>Delivery Address</h6>
                                        </label>
                                        <asp:TextBox ID="txtCODAddress" runat="server" CssClass="form-control" placeholder="Delivery Address"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCODAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red"
                                            ControlToValidate="txtCODAddress" Display="Dynamic" SetFocusOnError="true" ValidationGroup="cod"
                                            Font-Names="Segoe Script">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <p>
                                        <asp:LinkButton ID="lbCodSubmit" runat="server" CssClass="subscribe btn btn-red shadow-sm" ValidationGroup="cod" OnClick="lbCodSubmit_Click"><i class="fa fa-cart-arrow-down mr-2"></i> Confirm Order</asp:LinkButton>
                                    </p>
                                    <p class="text-muted">Note: At the of recieving your order, you need to do full payment. After completing the payment process, you can check your updated order status.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer" style="text-align: center">
                            <b class="badge badge-success badge-pill shadow-sm" style="font-size: 1rem">Order Total: $ <% Response.Write(Session["grandTotalPrice"]); %> </b>
                            <div class="pt-1">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="card"
                                    HeaderText="Fix the following errors" Font-Names="Segoe Script" />
                            </div>
                        </div>
                        <div colspan="2" class="continue_btn">
                            <asp:LinkButton ID="lbReturn" runat="server" OnClick="lbReturn_Click" CssClass="btn-continue"><i class="fa fa-arrow-circle-left mr-2"></i>Return</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--Payment section End--%>
</asp:Content>
