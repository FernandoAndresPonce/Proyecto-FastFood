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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessUsers business = new BusinessUsers();
                Users loginUser = new Users();

                loginUser.Username = txtUserName.Text;
                loginUser.Password = txtPassword.Text;

                int Id = business.confirmLogin(loginUser);

                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error de usuario o contrana incorrectos" + ex.ToString();
            }
        }
    }
}