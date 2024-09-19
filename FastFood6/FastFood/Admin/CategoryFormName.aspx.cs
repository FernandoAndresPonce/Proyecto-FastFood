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
    public partial class CategoryFormName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {


                BusinessCategories business = new BusinessCategories();
                CategoryD addCategory = new CategoryD();

                addCategory.Name = txtName.Text;

                business.AddWithSP(addCategory);

                string nameRef = txtName.Text;
                Response.Redirect("CategoryForm.aspx?Name=" + nameRef, false);


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}