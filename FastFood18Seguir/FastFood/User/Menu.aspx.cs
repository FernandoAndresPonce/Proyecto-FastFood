using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using Helper;

namespace FastFood.User
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    BusinessProducts businessProduct = new BusinessProducts();
                    BusinessCategories businessCategory = new BusinessCategories();

                    List<ProductD> listProduct = businessProduct.ListProductsActive();
                    List<CategoryD> listCategory = businessCategory.ListCategoryActive();

                    rCategory.DataSource = listCategory;
                    rCategory.DataBind();
                    rProducts.DataSource = listProduct;
                    rProducts.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        public string LowerCase(object obj)
        {
            return obj.ToString().ToLower();
        }

        //cart3
        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Segurity.activeSession(Session["User"]))
            {

            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        //cart4
        //int isItemExistInCart(int productId)
        //{

        //}


    }

}