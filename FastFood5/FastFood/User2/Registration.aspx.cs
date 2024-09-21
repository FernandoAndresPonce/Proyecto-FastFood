using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.User
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                //Users newUser = new Users();
                BusinessUsers business = new BusinessUsers();
                //EmailService servicio = new EmailService();

                //newUser.Email = txtEmail.Text;
                //newUser.Password = txtPassword.Text;

                //business.AddWithSP(newUser);

                //Response.Redirect("MyProfile.aspx", false);

                //string script = @"<script type='text/javascript'>alert('Successful registration!'); window.location.href='http://localhost:52000/User/MyProfile.aspx'</script>";
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);


                //insert into Users(email, password, admin, CreatedDate) output inserted.UserId values(@Email, @Password, 0, getdate())
                //haber hecho anteriormente eso, he obtenido el id y he traido

                //usuario.Id = negocio.InsertarNuevo(usuario);
                //ver OJOOOOO
                //Session.Add("Usuario", usuario);

                //<%-- [8.Registro Trainee - output SQL - MailTrap]--%
                //servicio.ArmarCorreo(usuario.Email, "Bienvenido Trainer", "Hola te damos la bienvenida a la App.");
                //servicio.enviarEmail();
                //Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

       
        
    }
}