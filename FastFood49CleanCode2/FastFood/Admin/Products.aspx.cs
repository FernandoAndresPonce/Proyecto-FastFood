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
    public partial class Products : System.Web.UI.Page
    {

        public bool FilterAdvanced { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FilterAdvanced = cbAdvancedFilter.Checked;

            try
            {
                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Products";

                    if (Session["createProduct"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["createProduct"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["createProduct"] = null;
                    }
                    else if (Session["updateProduct"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["updateProduct"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["updateProduct"] = null;

                    }
                    else if (Session["deleteProduct"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["deleteProduct"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["deleteProduct"] = null;
                    }
                    BusinessProducts listProducts = new BusinessProducts();

                    Session.Add("listProducts", listProducts.ListWithSP());
                    dgvProducts.DataSource = Session["listProducts"];
                    dgvProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ProductId = dgvProducts.SelectedDataKey.Value.ToString();
            Response.Redirect("ProductDetail.aspx?Id=" + ProductId, false);
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ProductForm.aspx", false);
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
                    txtAdvancedFilter.TextMode = TextBoxMode.Search;
                    txtAdvancedFilter.Text = string.Empty;
                }
                else if (ddlField.SelectedValue.ToString() == "Description")
                {
                    ddlCriterion.Items.Add("Contains");
                    ddlCriterion.Items.Add("Starts with");
                    ddlCriterion.Items.Add("Ends with");
                    txtAdvancedFilter.TextMode = TextBoxMode.Search;
                    txtAdvancedFilter.Text = string.Empty;
                }
                else
                {
                    ddlCriterion.Items.Add("Equal to");
                    ddlCriterion.Items.Add("Greater than");
                    ddlCriterion.Items.Add("Less than");
                    txtAdvancedFilter.TextMode = TextBoxMode.Number;
                    txtAdvancedFilter.Text = "0";
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
                BusinessProducts business = new BusinessProducts();

                dgvProducts.DataSource = business.AdvancedFilter(ddlField.SelectedItem.ToString(),
                    ddlCriterion.SelectedItem.ToString(),
                    txtAdvancedFilter.Text,
                    ddlState.SelectedItem.ToString());

                dgvProducts.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void dgvProducts_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<ProductD> list = (List<ProductD>)Session["listProducts"];
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

                dgvProducts.DataSource = sortedList;
                dgvProducts.DataBind();
            }
        }
    }
}