﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastFood.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page is CategoryForm)
            //{
            //    if (!(Request.QueryString["Id"] != null))
            //    {
            //        Session.Add("Error", "Entry is not allowed from that origin");
            //        // Decidir si redirecciono al form error, o directamente que lo dirija a la categoria, pero sin dar detalle de tal motivo.
            //        Response.Redirect("Category.aspx", false);
            //    }

            //}

            if (Page is ProductDetail )
            {
                if (!(Request.QueryString["Id"] != null))
                {
                    Session.Add("Error", "Entry is not allowed from that origin");
                    Response.Redirect("Products.aspx", false);
                }

            }else if(Page is UserDetail)
                if (!(Request.QueryString["Id"] != null))
                {
                    Session.Add("Error", "Entry is not allowed from that origin");
                    Response.Redirect("User.aspx", false);
                }

        }
    }
}