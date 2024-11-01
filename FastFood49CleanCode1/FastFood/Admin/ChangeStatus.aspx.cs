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
    public partial class ChangeStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string OrderDetailsId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (OrderDetailsId != string.Empty && !IsPostBack)
                {
                    BusinessOrders business = new BusinessOrders();

                    List<OrdersD> listOrderChangeStatus = business.ShowOrderStatus(int.Parse(OrderDetailsId));

                    Session.Add("OrderStatus", listOrderChangeStatus);
                    dgvOrderStatus.DataSource = listOrderChangeStatus;
                    dgvOrderStatus.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected string GetBadgeClass(string status)
        {
            switch (status)
            {
                case "Delivered":
                    return "badge badge-success";
                case "Dispatched":
                    return "badge badge-warning";
                case "Pending":
                    return "badge badge-danger";
                default:
                    return string.Empty; 
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessOrders business = new BusinessOrders();
                OrdersD order = new OrdersD();

                order.Status = ddlOrderStatus.SelectedValue;
                order.OrderDetailsId = int.Parse(Request.QueryString["Id"]);
                business.ListWithSPUpdateStatus(order);

                Session["updateOrder"] = "Order has been successfully UPDATE !";
                Response.Redirect("OrderStatus.aspx", false);             
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }   
    }
}