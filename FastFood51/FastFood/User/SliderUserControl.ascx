<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderUserControl.ascx.cs" Inherits="FastFood.User.SliderUserControl" %>
<%@ Import Namespace="Helper" %>


<%--Style section--%>
<style>
    .slider_section {
        position: relative;
        z-index: 2;
    }

        .slider_section .img-box {
            width: 90%;
            height: 90%;
            overflow: hidden;
        }

            .slider_section .img-box img {
                margin-top: 20px;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

    .carousel-indicators-container {
        position: absolute;
        top: 50%;
        right: 20px;
        transform: translateY(-50%);
        z-index: 2;
    }

    .carousel-indicators {
        display: flex;
        flex-direction: column;
    }

    @media (max-width: 768px) {
        .box {
            flex: 1 1 100%;
            max-width: 100%;
        }

        .slider_section {
            min-height: auto;
            overflow: hidden;
            height: 100%;
        }

            .slider_section .img-box {
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

        .box2 {
            margin-top: 50px;
        }
    }
</style>
<%--Style section End--%>

<%--Slider section--%>
<section class="slider_section ">
    <div class="carousel-indicators-container">
        <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
            <li data-target="#customCarousel1" data-slide-to="3"></li>
        </ol>
    </div>
    <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container ">
                    <div class="row">
                        <div class="col-md-7 col-lg-6 ">
                            <div class="detail-box">
                                <h1>Fast Food Restaurant</h1>
                                <p>Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.</p>
                                <div class="btn-box">
                                    <a href="Menu.aspx" class="btn1">Our menu</a>
                                </div>
                                <div class="img-box">
                                    <img src="../TemplateFiles/images/princiOfert.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand">
                <ItemTemplate>
                    <div class="carousel-item box2 ">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-7 col-lg-6 ">
                                    <div class="detail-box">
                                        <h1><%# Eval("Name") %></h1>
                                        <p><%# Eval("Description") %></p>
                                        <div class="btn-box">
                                            <asp:LinkButton CssClass="" ID="lbAddToCart" runat="server" CommandName="addToCart"
                                                CommandArgument='<%# Eval("ProductId")%>'>Order Now!
                                            </asp:LinkButton>
                                        </div>
                                        <div class="img-box ">
                                            <img src="<%# Utils.GetImageUrlProduct(Eval("ImageUrl"))%>" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</section>
<%--Slider section End--%>

<%--Script section--%>
<script>
    $(document).ready(function () {
        $('#customCarousel1').carousel();

        $('#customCarousel1').on('slide.bs.carousel', function (e) {
            var $nextIndicator = $('.carousel-indicators li');
            $nextIndicator.removeClass('active');
            $nextIndicator.eq(e.to).addClass('active');
        });
    });
</script>
<%--Script section End--%>


