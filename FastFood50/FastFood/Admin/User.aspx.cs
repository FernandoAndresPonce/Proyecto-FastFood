using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using BusinessLogic;

namespace FastFood.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Users";

                    if (Session["deleteUser"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["deleteUser"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["deleteUser"] = null;
                    }
                    BusinessUsers business = new BusinessUsers();

                    Session.Add("listUsers", business.ListWithSP());
                    dgvUsers.DataSource = Session["listUsers"];
                    dgvUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string UserId = dgvUsers.SelectedDataKey.Value.ToString();
            Response.Redirect("UserDetail.aspx?Id=" + UserId, false);
        }
        protected void dgvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvUsers.PageIndex = e.NewPageIndex;
            dgvUsers.DataSource = Session["listUsers"]; ;
            dgvUsers.DataBind();
        }
        protected void dgvUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<UsersD> list = (List<UsersD>)Session["listUsers"];
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

                dgvUsers.DataSource = sortedList;
                dgvUsers.DataBind();
            }
        }
    }
}