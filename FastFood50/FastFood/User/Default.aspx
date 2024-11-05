<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FastFood.User.Default" %>

<%@ Import Namespace="Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Style section--%>
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

        @media (max-width: 768px) {
            .box {
                flex: 1 1 100%;
                max-width: 100%;
            }

            .offer_section {
                min-height: auto;
                overflow: hidden;
                height: 100%;
            }
        }
    </style>
    <%--Style section End--%>

    <!-- Offer Section -->
    <section class="offer_section layout_padding-bottom allhome ">
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box" style="background: linear-gradient(150deg, rgb(1, 1, 1) 50%, rgb(256, 256, 256, 0.5));">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# Utils.GetImageUrlCategory(Eval("ImageUrl"))%>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5><%# Eval("Name") %></h5>
                                        <h6><span><%# Eval("OfferPercentage") %>%</span> Off</h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Order Now
                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                                <g>
                                                    <g>
                                                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                                    </g>
                                                </g>
                                                <g>
                                                    <g>
                                                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                                    </g>
                                                </g>
                                                <g>
                                                    <g>
                                                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                                    </g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                                <g>
                                                </g>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
    <!-- Offer Section End-->

    <!-- About section -->
    <section class="about_section layout_padding_bottom  allhome">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ">
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Feane</h2>
                        </div>
                        <p>
                            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration
              in some form, by injected humour, or randomised words which don't look even slightly believable. If you
              are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in
              the middle of text. All
                        </p>
                        <a href="About.aspx">About Us</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About section End-->

    <!-- Client section -->
    <section class="client_section layout_padding-bottom pt-5 allhome">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2 style="color: white">What Says Our Customers</h2>
            </div>
            <div class="carousel-wrap row ">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box" style="background-color: rgba(1, 1, 1, 0.5)">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
                                <h6>Moana Michell</h6>
                                <p>magna aliqua</p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client1.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box" style="background-color: rgba(1, 1, 1, 0.5)">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
                                <h6>Mike Hamell</h6>
                                <p>magna aliqua</p>
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
    <!-- Client section End-->

</asp:Content>
