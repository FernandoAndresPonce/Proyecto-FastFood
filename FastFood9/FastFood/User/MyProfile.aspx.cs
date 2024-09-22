using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastFood.User
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Enabled = false;
            txtEmail.Enabled = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Response.Redirect("About.aspx", false);
        }
    }
}