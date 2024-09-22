using System;
using System.Collections.Generic;
using System.IO;
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
                Users newUser = new Users();
                BusinessUsers business = new BusinessUsers();
                //EmailService servicio = new EmailService();
               

                newUser.Name = txtName.Text;
                newUser.Username = txtUserName.Text;
                newUser.Email = txtEmail.Text;
                newUser.Password = txtPassword.Text;
                newUser.Mobile = txtMobile.Text;
                newUser.Address = txtAddress.Text;
                newUser.PostCode = txtPostCode.Text;


                //Alternativa de guardar imagen en la carpeta, por si acaso.
                if (fuUserImage.HasFile)
                {

                    //Guid obj = Guid.NewGuid();
                    string fileExtension = Path.GetExtension(fuUserImage.FileName);
                    //string route = "Image/" + newUser.Username + ".png";
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("./Image/") + "User-" + newUser.Username + fileExtension);
                    newUser.ImageUrl = "Users-" + newUser.Username + fileExtension;

                }


                int userId = business.AddWithSP(newUser);

                string script = @"<script type='text/javascript'>alert('USER has successfully REGISTERED !'); window.location.href='http://localhost:52000/User/Login.aspx'</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

            }
            catch (Exception ex)
            {
                //ver esto!!!!!!!!!!!!
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_UserName'"))
                {
                    Session.Add("Error", "Error contasena o password");
                    Response.Redirect("Error.aspx", false);
                }
                else if(ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_Email'"))
                {
                    Response.Redirect("Login.aspx", false);
                }

            }
        }

    }
}