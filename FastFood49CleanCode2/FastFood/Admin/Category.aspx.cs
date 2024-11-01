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
    public partial class Category : System.Web.UI.Page
    {
        public bool FilterAdvanced { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FilterAdvanced = cbAdvancedFilter.Checked;

            try
            {
                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Category";

                    if (Session["CreateCategory"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["CreateCategory"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["CreateCategory"] = null;
                    }
                    else if (Session["UpdateCategory"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["UpdateCategory"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["UpdateCategory"] = null;

                    }
                    else if (Session["DeleteCategory"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["DeleteCategory"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["DeleteCategory"] = null;

                    }
                }
                BusinessCategories listCategories = new BusinessCategories();

                Session.Add("listCategories", listCategories.ListWithSP());
                dgvCategory.DataSource = Session["listCategories"];
                dgvCategory.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CategoryId = dgvCategory.SelectedDataKey.Value.ToString();
            Response.Redirect("CategoryDetail.aspx?Id=" + CategoryId, false);
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryForm.aspx", false);
        }
        protected void txtFastFilter_TextChanged(object sender, EventArgs e)
        {
            try
            {
                List<CategoryD> list = (List<CategoryD>)Session["listCategories"];

                List<CategoryD> filterList = list.FindAll(x => x.Name.ToUpper().Contains(txtFastFilter.Text.ToUpper()));

                dgvCategory.DataSource = filterList;
                dgvCategory.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void cbAdvancedFilter_CheckedChanged(object sender, EventArgs e)
        {
            FilterAdvanced = cbAdvancedFilter.Checked;
        }
        protected void ddlField_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCriterion.Items.Clear();

                if (ddlField.SelectedValue.ToString() == "Name")
                {
                    ddlCriterion.Items.Add("Contains");
                    ddlCriterion.Items.Add("Starts with");
                    ddlCriterion.Items.Add("Ends with");
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
                BusinessCategories business = new BusinessCategories();

                dgvCategory.DataSource = business.AdvancedFilter(ddlField.SelectedItem.ToString(),
                    ddlCriterion.SelectedItem.ToString(),
                    txtAdvancedFilter.Text,
                    ddlState.SelectedItem.ToString());

                dgvCategory.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvCategory_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<CategoryD> list = (List<CategoryD>)Session["listCategories"];
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

                dgvCategory.DataSource = sortedList;
                dgvCategory.DataBind();
            }
        }
    }
}