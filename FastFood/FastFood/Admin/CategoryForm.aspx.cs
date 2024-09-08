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
    public partial class CategoryForm : System.Web.UI.Page
    {

        public bool ConfirmDeleted { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtCategoryId.Enabled = false;
            txtCreatedDate.Enabled = false;

            ConfirmDeleted = false;

            try
            {

                string CategoryId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (CategoryId != string.Empty && !IsPostBack)
                {
                    CategoryD selectedCategory = new CategoryD();
                    BusinessCategories business = new BusinessCategories();

                    selectedCategory.CategoryId = int.Parse(CategoryId);
                    business.ShowCategory(selectedCategory);

                    txtCategoryId.Text = selectedCategory.CategoryId.ToString();
                    txtName.Text = selectedCategory.Name;
                    txtCreatedDate.Text = selectedCategory.CreatedDate.ToString("yyyy-MM-dd");
                    cbActivo.Checked = selectedCategory.IsActive;
                    if (!string.IsNullOrEmpty(selectedCategory.ImageUrl))
                        imgForm.ImageUrl = "./Image/" + selectedCategory.ImageUrl;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {

            try
            {
                //REALIZAR VALIDACIONES EN LOS CAMPOS REQUERIDOS.

                Page.Validate();
                if (!Page.IsValid)
                    return;

                BusinessCategories business = new BusinessCategories();
                CategoryD addCategory = new CategoryD();

                addCategory.Name = txtName.Text;
                addCategory.IsActive = cbActivo.Checked;


                if (txtImage.PostedFile.FileName != string.Empty)
                {
                    string route = Server.MapPath("./Image/");
                    txtImage.PostedFile.SaveAs(route + "Category-" + addCategory.Name + ".jpg");
                    addCategory.ImageUrl = "Category-" + addCategory.Name + ".jpg";
                    imgForm.ImageUrl = "./Image/" + addCategory.ImageUrl;

                }


                if (Request.QueryString["Id"] != null)
                {
                    addCategory.CategoryId = int.Parse(txtCategoryId.Text);
                    business.UpdateWithSp(addCategory);
                    Response.Redirect("Category.aspx", false);
                }
                else
                {
                    business.AddWithSP(addCategory);
                    Response.Redirect("Category.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx", false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ConfirmDeleted = true;
        }

        protected void btnConfirmDeletion_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessCategories business = new BusinessCategories();
                CategoryD deleteCategory = new CategoryD();

                deleteCategory.CategoryId = int.Parse(txtCategoryId.Text);

                if (cbConfirmDeletion.Checked)
                {
                    business.DeleteWithSP(deleteCategory);
                    Response.Redirect("Category.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }


    }
}
