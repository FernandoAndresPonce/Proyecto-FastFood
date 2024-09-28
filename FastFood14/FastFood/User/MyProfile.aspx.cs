using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using Helper;

namespace FastFood.User
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Enabled = false;
            txtEmail.Enabled = false;
            if (!IsPostBack)
            {
                if (Segurity.activeSession(Session["User"]))
                {
                    UsersD user = (UsersD)Session["User"];
                    txtName.Text = user.Name;
                    txtUserName.Text = user.Username;
                    txtEmail.Text = user.Email;
                    //txtPassword.Text = user.Password;
                    txtAddress.Text = user.Address;
                    txtMobile.Text = user.Mobile;
                    txtPostCode.Text = user.PostCode;
                    if (!string.IsNullOrEmpty(user.ImageUrl))
                        imgUser.ImageUrl = "./Image/Users/" + user.ImageUrl;
                }

  

            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx", false);
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {

        }
    }
}