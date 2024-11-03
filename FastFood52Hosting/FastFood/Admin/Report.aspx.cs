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
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Selling Report";
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fromDate = Convert.ToDateTime(txtFromDate.Text);
                DateTime toDate = Convert.ToDateTime(txtToDate.Text);

                if (toDate > DateTime.Now)
                {
                    Response.Write("<script>alert('toDate cannot be greater than current date!'); </script>");
                }

                else if (fromDate > toDate)
                {
                    Response.Write("<script>alert('fromDate cannot be greater than toDate!'); </script>");
                }
                else
                {
                    BusinessOrders business = new BusinessOrders();
                    List<OrdersD> listSellingReport = business.ListWithSDSellingReport(fromDate, toDate);
                    Session.Add("listSellingReport", listSellingReport);

                    decimal grandTotal = 0;
                    if (listSellingReport.Count > 0)
                    {
                        foreach (var sellingReport in listSellingReport)
                        {
                            grandTotal += sellingReport.TotalPrice;
                        }
                    }
                    lblTotal.Text = "Sold Cost: " + grandTotal;
                    lblTotal.CssClass = "badge badge-primary";

                    dgvReport.DataSource = Session["listSellingReport"];
                    dgvReport.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvReport_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<OrdersD> list = (List<OrdersD>)Session["listSellingReport"];
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

                dgvReport.DataSource = sortedList;
                dgvReport.DataBind();
            }
        }
    }
}