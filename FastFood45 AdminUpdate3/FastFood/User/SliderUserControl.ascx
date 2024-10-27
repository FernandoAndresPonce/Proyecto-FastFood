<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderUserControl.ascx.cs" Inherits="FastFood.User.SliderUserControl" %>
<%@ Import Namespace="Helper" %>
<!-- slider section -->


<style>
    .slider_section {
        position: relative;
        z-index: 2; /* Asegura que el slider esté encima de la imagen */
    }

        .slider_section .img-box {
            width: 90%; /* Cambia este valor según lo que necesites */
            height: 90%; /* Cambia este valor según lo que necesites */
            overflow: hidden; /* Oculta cualquier parte de la imagen que sobresalga */
        }

            .slider_section .img-box img {
                margin-top: 20px;
                width: 100%;
                height: 100%; /* Asegúrate de que la imagen cubra todo el box */
                object-fit: cover; /* Mantiene la proporción y cubre el área */
            }

    .carousel-indicators-container {
        position: absolute; /* Para posicionar respecto a su contenedor padre */
        top: 50%; /* Centrar verticalmente */
        right: 20px; /* Espacio desde el borde derecho */
        transform: translateY(-50%); /* Ajustar para centrar exactamente */
        z-index: 2; /* Asegúrate de que esté encima de otros elementos */
    }

    .carousel-indicators {
        display: flex; /* Alinear los indicadores en fila */
        flex-direction: column; /* Apilarlos verticalmente */
    }

    @media (max-width: 768px) {
        .box {
            flex: 1 1 100%; /* Ocupa todo el ancho en pantallas pequeñas */
            max-width: 100%; /* Asegura que no exceda el ancho */
        }

        .slider_section {
            min-height: auto; /* Permite que la sección se ajuste automáticamente */
            overflow: hidden; /* Previene el overflow de la sección */
            height: 100%; /* O cualquier valor que desees */
        }

         .slider_section .img-box {
            width: 100%; /* Cambia este valor según lo que necesites */
            height: 100%; /* Cambia este valor según lo que necesites */
            overflow: hidden; /* Oculta cualquier parte de la imagen que sobresalga */
        }
         .box2{
             margin-top: 50px;
         }


    }
</style>


<section class="slider_section ">

    <div class="carousel-indicators-container">
        <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>

        </ol>
    </div>
    <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">



            <div class="carousel-item active">
                <div class="container ">
                    <div class="row">
                        <div class="col-md-7 col-lg-6 ">
                            <div class="detail-box">
                                <h1>Fast Food Restaurant
                    </h1>
                                <p>
                                    Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.
                   
                                </p>
                                <div class="btn-box">
                                    <a href="Menu.aspx" class="btn1">Order Now
                      </a>
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
                                        <h1><%# Eval("Name") %>
                    </h1>
                                        <p>
                                            <%# Eval("Description") %>
                                        </p>
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

<!-- end slider section -->
