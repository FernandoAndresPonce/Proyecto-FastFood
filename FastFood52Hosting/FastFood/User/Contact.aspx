<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FastFood.User.Contact" %>

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

    <%--Style section--%>
    <style>
        .allhome {
            height: 100vh;
            width: 100%;
            background: url(../TemplateFiles/images/fondomenu4.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
        }

         @media (max-width: 768px) {
             
            .book_section {
                min-height: auto; 
                overflow: hidden; 
                height: 100%; 
            }
        }
    </style>
    <%--Style section End--%>

    <!-- Book section -->
    <section class="book_section layout_padding  pt-5 allhome">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end" style="text-align: center; width: 100%; margin-bottom: 30px">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" />
                </div>
                <h2 style="color:white">Send Your Query</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" SetFocusOnError="true" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtEmail" runat="server" ErrorMessage="Email is required" SetFocusOnError="true" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is required" SetFocusOnError="true" ControlToValidate="txtSubject" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Enter your Query/Feedback" TextMode="MultiLine" style=" resize: none;
    height: 140px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is required" SetFocusOnError="true" ControlToValidate="txtMessage" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="btn_box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="map_container ">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Book section End-->

</asp:Content>
