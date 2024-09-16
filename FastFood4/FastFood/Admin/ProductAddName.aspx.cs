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
    public partial class ProductAddName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {

                BusinessProducts business= new BusinessProducts();
                Product addProduct = new Product();

                addProduct.Name = txtProductName.Text;

                business.AddWithSP(addProduct);

                string nameRef = txtProductName.Text;
                Response.Redirect("ProductForm.aspx?Name=" + nameRef, false);

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}