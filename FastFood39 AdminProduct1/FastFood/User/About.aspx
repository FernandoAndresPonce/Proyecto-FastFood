﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FastFood.User.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .allhome {
            height: 100vh;
            width: 100%;
            background: url(../TemplateFiles/images/about3.png);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        @media (max-width: 768px) {


            .about_section {
                min-height: auto; /* Permite que la sección se ajuste automáticamente */
                overflow: hidden; /* Previene el overflow de la sección */
                height: 100%; /* O cualquier valor que desees */
            }
        }
    </style>
    <!-- about section -->

    <section class="about_section layout_padding pt-5 allhome">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../TemplateFiles/images/about-img.png" alt="">
                    </div>
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
                        <%--  <a href="">Read More
            </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

</asp:Content>
