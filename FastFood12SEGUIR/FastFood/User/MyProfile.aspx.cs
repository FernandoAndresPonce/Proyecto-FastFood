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
                if (Session["Mensaje"] != null)
                {                    
                    lblMsg.Visible = true;
                    lblMsg.Text = Session["Mensaje"].ToString();
                    lblMsg.CssClass = "alert alert-success";
                    Session["Mensaje"] = null;
                }
                if (Segurity.activeSession(Session["User"]))
                {
                    Users user = (Users)Session["User"];
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Response.Redirect("About.aspx", false);
        }
    }
}