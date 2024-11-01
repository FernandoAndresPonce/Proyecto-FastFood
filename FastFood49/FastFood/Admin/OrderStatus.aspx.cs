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
            //pUpdateOrderStatus.Visible = false;

            try
            {

                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Order Status";

                    if (Session["updateOrder"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["updateOrder"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["updateOrder"] = null;
                    }

                }

                BusinessOrders business = new BusinessOrders();

                List<OrdersD> listOrder = business.ListWithSPStatus();

                Session.Add("listaOrderStatus", listOrder);
                dgvOrderStatus.DataSource = listOrder;
                dgvOrderStatus.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }


        //protected void rOrderStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName == "edit")
        //        {
        //            BusinessOrders business = new BusinessOrders();
        //            OrdersD order = new OrdersD();

        //            order.OrderDetailsId = Convert.ToInt32(e.CommandArgument);

        //            business.ListWithSPChangeStatus(order);
        //            //Session.Add("listOrders", listOrder);
        //            ddlOrderStatus.SelectedValue = order.Status;
        //            hdnId.Value = order.OrderDetailsId.ToString();
        //            pUpdateOrderStatus.Visible = true;
        //            LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
        //            btn.CssClass = "badge badge-warning";



        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        Session.Add("Error", ex.ToString());
        //        Response.Redirect("Error.aspx", false);
        //    }

        //}

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        BusinessOrders business = new BusinessOrders();
        //        OrdersD order = new OrdersD();

        //        order.Status = ddlOrderStatus.SelectedValue;
        //        order.OrderDetailsId = int.Parse(hdnId.Value.ToString());

        //        if (business.ListWithSPUpdateStatus(order))
        //        {
        //            lblMsg.Text = "Order status update successfully";
        //            lblMsg.Visible = true;
        //            lblMsg.CssClass = "alert alert-success";

        //            List<OrdersD> listOrder = business.ListWithSPStatus();
        //            rOrderStatus.DataSource = listOrder;
        //            rOrderStatus.DataBind();
        //        }

        //    }
        //    catch (Exception ex)
        //    {

        //        Session.Add("Error", ex.ToString());
        //        Response.Redirect("Error.aspx", false);
        //    }

        //}

        //protected void btnCancel_Click(object sender, EventArgs e)
        //{
        //    pUpdateOrderStatus.Visible = false;
        //}

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
                    return string.Empty; // Asegúrate de manejar los estados no conocidos
            }
        }

        protected void dgvOrderStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string OrderDetailsId = dgvOrderStatus.SelectedDataKey.Value.ToString();
            Response.Redirect("ChangeStatus.aspx?Id=" + OrderDetailsId, false);
        }

        protected void dgvOrderStatus_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<OrdersD> list = (List<OrdersD>)Session["listaOrderStatus"];
            if (list != null)
            {
                // Determina el orden
                string sortDirection = "ASC";
                if (ViewState["SortExpression"] != null && ViewState["SortExpression"].ToString() == e.SortExpression)
                {
                    sortDirection = ViewState["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
                }

                ViewState["SortExpression"] = e.SortExpression;
                ViewState["SortDirection"] = sortDirection;

                // Ordena la lista
                var sortedList = sortDirection == "ASC" ?
                    list.OrderBy(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList() :
                    list.OrderByDescending(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList();

                // Reasigna el DataSource
                dgvOrderStatus.DataSource = sortedList;
                dgvOrderStatus.DataBind();
            }
        }
    }
}