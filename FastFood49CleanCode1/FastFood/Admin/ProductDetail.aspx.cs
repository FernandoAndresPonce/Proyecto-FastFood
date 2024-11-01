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
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cbActivo.Visible = false;
            cbOffer.Visible = false;

            try
            {
                string ProductId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (ProductId != string.Empty && !IsPostBack)
                {
                    ProductD selectedProduct = new ProductD();
                    BusinessProducts business = new BusinessProducts();

                    selectedProduct.ProductId = int.Parse(ProductId);
                    business.ShowProductDetail(selectedProduct);

                    lblNameProduct.Text = selectedProduct.Name;
                    lblDescriptionProduct.Text = selectedProduct.Description;
                    lblCategoryProduct.Text = selectedProduct.Category.Name.ToString();
                    lblPriceProduct.Text = selectedProduct.Price.ToString();
                    lblQuantityProduct.Text = selectedProduct.Quantity.ToString();
                    cbActivo.Checked = selectedProduct.IsActive;
                    cbOffer.Checked = selectedProduct.IsOffer;
                    if (!string.IsNullOrEmpty(selectedProduct.ImageUrl))
                        imgForm.ImageUrl = "./Image/Products/" + selectedProduct.ImageUrl;
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
                string ProductId = Request.QueryString["Id"];
                Response.Redirect("ProductForm.aspx?Id=" + ProductId, false);
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
                Response.Redirect("Products.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}