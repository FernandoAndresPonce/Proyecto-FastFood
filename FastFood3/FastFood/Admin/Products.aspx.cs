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
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
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
            Response.Redirect("ProductForm.aspx?Id=" + ProductId, false);
        }

        protected void dgvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProducts.PageIndex = e.NewPageIndex;
            dgvProducts.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ProductAddName.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void txtFastFilter_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cbAdvancedFilter_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}