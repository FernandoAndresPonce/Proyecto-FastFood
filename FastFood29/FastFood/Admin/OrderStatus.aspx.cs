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
            try
            {
                if (e.CommandName == "edit")
                {
                    BusinessOrders business = new BusinessOrders();
                    OrdersD order = new OrdersD();

                    order.OrderDetailsId = Convert.ToInt32(e.CommandArgument);

                    business.ListWithSPChangeStatus(order);
                    //Session.Add("listOrders", listOrder);
                    ddlOrderStatus.SelectedValue = order.Status;
                    hdnId.Value = order.OrderDetailsId.ToString();
                    pUpdateOrderStatus.Visible = true;
                    LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                    btn.CssClass = "badge badge-warning";



                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessOrders business = new BusinessOrders();
                OrdersD order = new OrdersD();

                order.Status = ddlOrderStatus.SelectedValue;
                order.OrderDetailsId = int.Parse(hdnId.Value.ToString());

                if (business.ListWithSPUpdateStatus(order))
                {
                    lblMsg.Text = "Order status update successfully";
                    lblMsg.Visible = true;
                    lblMsg.CssClass = "alert alert-success";

                    List<OrdersD> listOrder = business.ListWithSPStatus();
                    rOrderStatus.DataSource = listOrder;
                    rOrderStatus.DataBind();
                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pUpdateOrderStatus.Visible = false;
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
    }
}