using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using BusinessLogic;
using Dominio;

namespace FastFood.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Segurity.isAdmin(Session["User"]))
            {
                lbAdmin.Visible = true;
               

            }
            if (Page is MyProfile)
            {
                if (!Segurity.activeSession(Session["User"]))
                {
                    Session["Mensaje"] = "You should log in!";
                    Response.Redirect("Login.aspx");
                }
                else
                {

                }
            }

            if (Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                //Cargamos la pagina de control, para usar el sliderUser.
                Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");
                pnlSliderUC.Controls.Add(sliderUserControl);
                form1.Attributes.Remove("class");
            }
            else
            {
                form1.Attributes.Add("class", "sub_page");

            }

            if (Segurity.activeSession(Session["User"]))
            {
                lbLoginOrLogout.Text = "Logout";
                lbRegisterOrProfile.ToolTip = "My Profile";


                try
                {

                    BusinessCarts business = new BusinessCarts();
                    CartD countProductCard = new CartD();

                    var userId = Session["User"] as UsersD;

                    countProductCard.User = new UsersD();
                    countProductCard.User.UserId = userId.UserId;

                    business.cartCount(countProductCard);
                    Session.Add("cartCount", countProductCard.Quantity);



                    if (Session["cartCount"] != null && (int)Session["cartCount"] == 0)
                    {
                        Session["cartCount"] = ""; 
                    }



                }
                catch (Exception ex)
                {
                    Session.Add("Error", ex.ToString());
                    Response.Redirect("Error.aspx", false);
                }
            }
            else
            {
                lbLoginOrLogout.Text = "Login";
            }


        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (!(Segurity.activeSession(Session["User"])))
            {
                Response.Redirect("Login.aspx", false);
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void lbRegisterOrProfile_Click(object sender, EventArgs e)
        {
            if (Segurity.activeSession(Session["User"]))
            {
                
                Response.Redirect("MyProfile.aspx", false);
            }
            else
            {
               
                Response.Redirect("Registration.aspx", false);
            }
        }

        protected void lbAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Admin/Dashboard.aspx", false);
        }
    }
}