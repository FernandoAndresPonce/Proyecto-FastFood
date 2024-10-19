<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FastFood.User.Default" %>

<%@ Import Namespace="Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .allhome {
            height: 100vh;
            width: 100%;
            background: url(../TemplateFiles/images/fondo3.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
             justify-content: center;
        }
    </style>
    <!-- offer section -->

    <section class="offer_section layout_padding-bottom allhome ">

        <div class="offer_container">
            <div class="container ">
                <div class="row">

                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box" style="background-color: rgba(1, 1, 1, 0.5)">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# Utils.GetImageUrlCategory(Eval("ImageUrl"))%>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">


                                        <h5><%# Eval("Name") %>
                </h5>
                                        <h6>
                                            <span>20%</span> Off
                </h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>" style="background-color: rgba(0, 0, 0); color: white; padding: 15px 20px; text-decoration: none;">Order Now</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>



                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->

    <!-- about section -->
    <%--colocar _botton--%>
    <section class="about_section layout_padding_bottom  allhome">
        <div class="container">

            <div class="row">
                <div class="col-md-6 ">
                   <%-- <div class="img-box">
                        <img src="../TemplateFiles/images/about-img.png" alt="">
                    </div>--%>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Feane
              </h2>
                        </div>
                        <p>
                            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration
              in some form, by injected humour, or randomised words which don't look even slightly believable. If you
              are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in
              the middle of text. All
           
                        </p>
                        <a href="">Read More
            </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

    <!-- client section -->
    <%--agregamos la class pt-5 , para ganar espacio--%>
    <section class="client_section layout_padding-bottom pt-5 allhome">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2 style="color: white">What Says Our Customers
        </h2>
            </div>
            <div class="carousel-wrap row ">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box" style="background-color: rgba(1, 1, 1, 0.5)">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
               
                                </p>
                                <h6>Moana Michell
                </h6>
                                <p>
                                    magna aliqua
               
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client1.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box" style="background-color: rgba(1, 1, 1, 0.5)">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
               
                                </p>
                                <h6>Mike Hamell
                </h6>
                                <p>
                                    magna aliqua
               
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client2.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end client section -->

</asp:Content>
