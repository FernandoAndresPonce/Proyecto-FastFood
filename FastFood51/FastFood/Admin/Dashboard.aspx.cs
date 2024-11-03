using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                    Session["breadCrum"] = "";

                if (Session["MsgLoginAdminSuccess"] != null)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = Session["MsgLoginAdminSuccess"].ToString();
                    lblMsg.CssClass = "alert alert-success";
                    Session["MsgLoginAdminSuccess"] = null;
                }
                BusinessCategories businessCategories = new BusinessCategories();
                int totalCategories = businessCategories.TotalCategories();
                lbltotalCategories.Text = totalCategories.ToString();

                BusinessProducts businessProducts = new BusinessProducts();
                int totalProducts = businessProducts.TotalProducts();
                lblTotalProducts.Text = totalProducts.ToString();

                BusinessOrders businessOrders = new BusinessOrders();
                int totalOrders = businessOrders.TotalOrders();
                lblTotalOrders.Text = totalOrders.ToString();

                int totalOrdersDelivered = businessOrders.TotalOrdersDelivered();
                lblOrdersDelivered.Text = totalOrdersDelivered.ToString();

                int totalOrdersPending = businessOrders.TotalOrdersPending();
                lblOrdersPending.Text = totalOrdersPending.ToString();

                BusinessUsers businessUsers = new BusinessUsers();
                int totalUsers = businessUsers.TotalUsers();
                lblTotalUsers.Text = totalUsers.ToString();

                decimal totalAmount = businessOrders.TotalAmount();
                lblTotalAmount.Text = totalAmount.ToString();

                BusinessContacts businessContacts = new BusinessContacts();
                int totalContacts = businessContacts.TotalContacts();
                lblTotalFeedbacks.Text = totalContacts.ToString();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}