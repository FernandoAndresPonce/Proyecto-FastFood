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
            Response.Redirect("CategoryForm.aspx?Id=" + CategoryId, false);
        }

        protected void dgvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvCategory.PageIndex = e.NewPageIndex;
            dgvCategory.DataBind();

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryFormName.aspx", false);
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
            txtFastFilter.Enabled = !FilterAdvanced;

            //if (ddlField.SelectedValue.ToString() == "[Selection]")
            //{
            //    ddlCriterion.Enabled = !FilterAdvanced;
            //    txtAdvancedFilter.Enabled = !FilterAdvanced;
            //    ddlState.Enabled = !FilterAdvanced;
            //    btnSearch.Enabled = !FilterAdvanced;
            //}

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

                    //ddlCriterion.Enabled = true;
                    //txtAdvancedFilter.Enabled = true;
                    //ddlState.Enabled = true;
                    //btnSearch.Enabled = true;
                }
                //else
                //{
                //    ddlCriterion.Enabled = false;
                //    txtAdvancedFilter.Enabled = false;
                //    ddlState.Enabled = false;
                //    btnSearch.Enabled = false;
                //}

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

        protected void dgvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}