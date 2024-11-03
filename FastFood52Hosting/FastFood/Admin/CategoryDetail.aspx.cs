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
    public partial class CategoryDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cbActivo.Visible = false;
            cbOffert.Visible = false;

            try
            {
                string CategoryId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (CategoryId != string.Empty && !IsPostBack)
                {
                    CategoryD selectedCategory = new CategoryD();
                    BusinessCategories business = new BusinessCategories();
               
                    selectedCategory.CategoryId = int.Parse(CategoryId);
                    business.ShowCategory(selectedCategory);
                    lblNameCategory.Text = selectedCategory.Name;
                    lblIdCategory.Text = selectedCategory.CategoryId.ToString();
                    lblCreatedDateCategory.Text = selectedCategory.CreatedDate.ToString();
                    cbActivo.Checked = selectedCategory.IsActive;
                    cbOffert.Checked = selectedCategory.IsOffert;
                    lblOfferPercentage.Text = selectedCategory.OfferPercentage.ToString();
                    if (!string.IsNullOrEmpty(selectedCategory.ImageUrl))
                        imgForm.ImageUrl = "./Image/Categories/" + selectedCategory.ImageUrl;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                string CategoryId = Request.QueryString["Id"];
                Response.Redirect("CategoryForm.aspx?Id=" + CategoryId, false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }       
    }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Category.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}