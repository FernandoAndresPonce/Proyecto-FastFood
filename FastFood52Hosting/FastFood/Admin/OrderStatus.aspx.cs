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
                string sortDirection = "ASC";
                if (ViewState["SortExpression"] != null && ViewState["SortExpression"].ToString() == e.SortExpression)
                {
                    sortDirection = ViewState["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
                }
                ViewState["SortExpression"] = e.SortExpression;
                ViewState["SortDirection"] = sortDirection;

                var sortedList = sortDirection == "ASC" ?
                    list.OrderBy(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList() :
                    list.OrderByDescending(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList();

                dgvOrderStatus.DataSource = sortedList;
                dgvOrderStatus.DataBind();
            }
        }
    }
}