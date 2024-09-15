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
        public bool ConfirmAddCancel { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtCategoryId.Enabled = false;
            txtCreatedDate.Enabled = false;

            ConfirmDeleted = false;
            ConfirmAddCancel = false;

            try
            {

                string Name = Request.QueryString["Name"] != null ? Request.QueryString["Name"] : string.Empty;

                string CategoryId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;


                if (CategoryId != string.Empty && !IsPostBack)
                {
                    CategoryD selectedCategory = new CategoryD();
                    BusinessCategories business = new BusinessCategories();

                    btnAccept.Text = "Update";

                    selectedCategory.CategoryId = int.Parse(CategoryId);
                    business.ShowCategory(selectedCategory);

                    txtCategoryId.Text = selectedCategory.CategoryId.ToString();
                    txtName.Text = selectedCategory.Name;
                    txtCreatedDate.Text = selectedCategory.CreatedDate.ToString("yyyy-MM-dd");
                    cbActivo.Checked = selectedCategory.IsActive;
                    if (!string.IsNullOrEmpty(selectedCategory.ImageUrl))
                        imgForm.ImageUrl = "./Image/" + selectedCategory.ImageUrl;

                    Session.Add("Category", selectedCategory);
                }
                else if (Name != string.Empty && !IsPostBack)
                {
                    txtName.Enabled = false;

                    CategoryD selectedCategory = new CategoryD();
                    BusinessCategories business = new BusinessCategories();

                    selectedCategory.Name = Name;
                    business.ShowCategoryName(selectedCategory);

                    txtCategoryId.Text = selectedCategory.CategoryId.ToString();
                    txtName.Text = selectedCategory.Name;

                    Session.Add("Category", selectedCategory);
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
                Page.Validate();
                if (!Page.IsValid)
                    return;


                BusinessCategories business = new BusinessCategories();
                CategoryD addCategory = (CategoryD)Session["Category"];

                if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Image/");
                    txtImage.PostedFile.SaveAs(route + "Category-" + addCategory.Name + ".jpg");
                    addCategory.ImageUrl = "Category-" + addCategory.Name + ".jpg";
                }


                addCategory.Name = txtName.Text;
                addCategory.IsActive = cbActivo.Checked;

                business.UpdateWithSp(addCategory);

                if (Request.QueryString["Name"] != null)
                {
                    string script = @"<script type='text/javascript'>alert('Category has been successfully CREATED !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else
                {
                    string script = @"<script type='text/javascript'>alert('Category has been successfully UPDATE !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }

                //Response.Write("<script>alert('Se ha agregado o actualizado exitosamente')</script>");

            }
            catch (Exception ex)
            {
                //lblMsg.Text = "No se pudo agregar dicha categoria" + ex.Message;
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

                    string script = @"<script type='text/javascript'>alert('Category has been successfully DELETED !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            ConfirmAddCancel = true;
        }

        protected void btnConfirmAddCancel_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessCategories business = new BusinessCategories();
                CategoryD deleteCategory = new CategoryD();

                deleteCategory.CategoryId = int.Parse(txtCategoryId.Text);

                if (cbConfirmAddCancel.Checked)
                {
                    business.DeleteWithSP(deleteCategory);

                    string script = @"<script type='text/javascript'>alert('Category has been successfully CANCELED !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
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

