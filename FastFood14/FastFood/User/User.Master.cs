﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;

namespace FastFood.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page is MyProfile)
            {
                if (!Segurity.activeSession(Session["User"]))
                {
                    Session["Mensaje"] = "You should log in!";
                    Response.Redirect("Login.aspx");
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
    }
}