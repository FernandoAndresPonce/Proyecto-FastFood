﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.Admin
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblMsg.Visible = false;
            pUpdateOrderStatus.Visible = false;

            try
            {

                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Order Status";


                    //podriamos usar tambien esta alternativa para mostrar un mensaje que fue creado exitosamente.
                    if (Session["Mensaje"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["Mensaje"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["Mensaje"] = null;
                    }

              
                }

                BusinessOrders business = new BusinessOrders();
                //OrdersD order = new OrdersD();


                //var userId = Session["User"] as UsersD;
                //order.User = new UsersD();
                //order.User.UserId = userId.UserId;

                List<OrdersD> listOrder = business.ListWithSPStatus();
                //Session.Add("listOrders", listOrder);
                rOrderStatus.DataSource = listOrder;
                rOrderStatus.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    

        protected void rOrderStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
          

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}