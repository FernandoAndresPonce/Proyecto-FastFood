<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Introduction.aspx.cs" Inherits="FastFood.User.Introduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .popup {
            position: fixed;
            top: -30px;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .popup-content {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            max-width: 90%; 
        }

        .popup-buttons {
            margin-top: 20px;
        }

        h2 {
            margin-bottom: 10px;
        }

        p {
            text-align: justify; 
            margin: 10px 0;
        }
    </style>

    <div class="popup">
        <div class="popup-content">

            <div style="margin: 10px 25% 0px; text-align: center; font-size: 1.1em">
                <asp:CheckBox ID="cbActivo" runat="server" Checked="true" AutoPostBack="true" />
            </div>
            <div style="margin: 0px 25% 25px; text-align: center; font-size: 1.1em">
                <%if (cbActivo.Checked)
                    { %>
                <asp:Label Text="Spanish" ID="lblActive" CssClass="badge badge-success" runat="server" />

                <%}
                    else
                    { %>
                <asp:Label Text="English" ID="Label2" CssClass="badge badge-danger" runat="server" />
                <%} %>
            </div>

            <%if (cbActivo.Checked)
                { %>
            <h2>Bienvenido a Mi Proyecto</h2>
            <p>
                Bienvenido a mi primer desarrollo web de e-commerce, en el que he estado trabajando durante dos meses y continúo en su mejora. Este proyecto está orientado a la venta de comida rápida.
            </p>
            <p>
                A continuación, se presenta el desarrollo del sitio. Es importante aclarar algunos detalles: esta página web es una versión DEMO que se actualiza y corrige de manera continua, aunque es completamente funcional.
            </p>
            <p>
                Próximamente, se proporcionará una documentación detallada que incluirá todas las funcionalidades y guías de uso tanto para usuarios como para administradores.
            </p>
            <p>
                Puede iniciar sesión como Usuario (Usuario: <b>Usuario</b>, Contraseña: <b>1234</b>) para experimentar el funcionamiento del sitio, o como Administrador (Usuario: <b>Admin</b>, Contraseña: <b>1234</b>). También existe la opción de registrarse de manera independiente, pero solo como Usuario.
            </p>
            <p>
                Cabe destacar que el diseño responsive actualmente se adapta únicamente a desktop con una resolución del 100%. Estoy trabajando para que sea compatible con otros dispositivos.
            </p>
            <p>
                Si desea dejarme algún consejo o sugerencia para mejorar, lo agradecería enormemente. Puede hacerlo a través de la sección de contacto, donde podrá enviar un mensaje que quedará registrado para su revisión.
            </p>
            <p>
                Agradezco sinceramente su visita a mi página web y espero que tenga una experiencia agradable.
       
            </p>
            <%}
                else
                { %>
            <h2>Welcome to My Project</h2>
            <p>
                Welcome to my first e-commerce web development, in which I have been working for two months and I continue to improve it. This project is oriented to the sale of fast food.
            </p>
            <p>
                The following is the development of the site. It is important to clarify some details: this website is a DEMO version that is continuously updated and corrected, although it is fully functional.
            </p>
            <p>
                Detailed documentation including all functionalities and user guides for both users and administrators will be provided soon.
            </p>
            <p>
                You can log in as a User (User: <b>Usuario</b>, Password: <b>1234</b>) to experience the operation of the site, or as an Administrator (User: <b>Admin</b>, Password: <b>1234</b>). There is also the option to register independently, but only as a User.  
            </p>
            <p>
                It should be noted that the responsive design currently adapts only to desktop with a resolution of 100%. I am working to make it compatible with other devices.      
            </p>
            <p>
                If you would like to leave me any advice or suggestions for improvement, I would greatly appreciate it. You can do so through the contact section, where you can send a message that will be recorded for review.    
            </p>
            <p>
                I sincerely appreciate your visit to my website and hope you have a pleasant experience.
      
            </p>

            <%} %>


            <div class="popup-buttons">
                <asp:LinkButton ID="lbHome" runat="server" CssClass="btn-green" OnClick="lbHome_Click">Home</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>
