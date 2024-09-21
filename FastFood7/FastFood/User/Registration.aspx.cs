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

                int userId = business.AddWithSP(newUser);

                //string script = @"<script type='text/javascript'>alert('USER has successfully REGISTERED !'); window.location.href='http://localhost:52000/User/Login.aspx'</script>";
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

                string script = @"<script type='text/javascript'>alert('USER has successfully REGISTERED !'); window.location.href='http://localhost:52000/User/Login.aspx'</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

            }
            catch (Exception ex)
            {
                 //ver esto!!!!!!!!!!!!
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    Session.Add("Error", "Error contasena o password");
                    Response.Redirect("Error.aspx", false);
                }
                
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx", false);
        }
    }
}