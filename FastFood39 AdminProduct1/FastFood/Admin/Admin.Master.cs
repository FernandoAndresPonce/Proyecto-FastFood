using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using Dominio;


namespace FastFood.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page is ProductDetail)
            {
                if (!(Request.QueryString["Id"] != null))
                {
                    Session.Add("Error", "Entry is not allowed from that origin");
                    Response.Redirect("Products.aspx", false);
                }

            }
            else if (Page is UserDetail)
                if (!(Request.QueryString["Id"] != null))
                {
                    Session.Add("Error", "Entry is not allowed from that origin");
                    Response.Redirect("User.aspx", false);
                }

            if (Page is Dashboard || Page is Category || Page is CategoryForm || Page is Error || Page is Products || Page is ProductDetail || Page is ProductForm || Page is Users || Page is UserDetail || Page is OrderStatus || Page is CategoryDetail || Page is Contact || Page is Report)
            {
                if (!(Segurity.isAdmin(Session["User"])))
                {
                    Session["MsgLoginAdmin"] = "You must be ADMIN to enter, Log in please!";
                    Response.Redirect("../User/Login.aspx", false);
                }

            }



        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
   
                Session.Abandon();
                Response.Redirect("../User/Login.aspx", false);

        }

        protected void lbDefault_Click(object sender, EventArgs e)
        {
            Response.Redirect("../User/Default.aspx", false);
        }
    }
    
}