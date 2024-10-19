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

                    btnAccept.Text = "Update";

                    selectedCategory.CategoryId = int.Parse(CategoryId);
                    business.ShowCategory(selectedCategory);

                    txtCategoryId.Text = selectedCategory.CategoryId.ToString();
                    txtName.Text = selectedCategory.Name;
                    txtCreatedDate.Text = selectedCategory.CreatedDate.ToString();
                    cbActivo.Checked = selectedCategory.IsActive;
                    cbOffert.Checked = selectedCategory.IsOffert;
                    if (!string.IsNullOrEmpty(selectedCategory.ImageUrl))
                        imgForm.ImageUrl = "./Image/Categories/" + selectedCategory.ImageUrl;

                    //Session.Add("Category", selectedCategory);
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
                CategoryD addCategory = new CategoryD();


                addCategory.Name = txtName.Text;
                addCategory.IsActive = cbActivo.Checked;
                addCategory.IsOffert = cbOffert.Checked;



                if (Request.QueryString["Id"] != null)
                {
                    addCategory.CategoryId = int.Parse(txtCategoryId.Text.ToString());
                    addCategory.ImageUrl = "Category-" + addCategory.CategoryId + ".jpg";

                    if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Image/Categories/");
                        txtImage.PostedFile.SaveAs(route + "Category-" + addCategory.CategoryId + ".jpg");
                        addCategory.ImageUrl = "Category-" + addCategory.CategoryId + ".jpg";
                    }


                    business.UpdateWithSp(addCategory);
                    string script = @"<script type='text/javascript'>alert('Category has been successfully UPDATE !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else
                {
                    int id = business.AddWithSP(addCategory);

                    addCategory.CategoryId = id;

                    if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Image/Categories/");
                        txtImage.PostedFile.SaveAs(route + "Category-" + addCategory.CategoryId + ".jpg");
                        addCategory.ImageUrl = "Category-" + addCategory.CategoryId + ".jpg";
                    }
                    business.AddImageWithSP(addCategory);

                    Session["Mensaje"] = "Mensaje desde el formulario Category, Categoria Creada " + txtName.Text.Trim();

                    string script = @"<script type='text/javascript'>alert('Category has been successfully CREATED !'); window.location.href='http://localhost:52000/Admin/Category.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);



                }


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

        protected void cbActivo_CheckedChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    if (cbActivo.Checked)
            //    {
            //        lblActive.Text = "Active";
            //        lblActive.CssClass = "form-label badge badge-success";
            //    }
            //    else
            //    {
            //        lblActive.Text = "Inactive";
            //        lblActive.CssClass = "form-label badge badge-danger";
            //    }

            //}
            //catch (Exception ex)
            //{
            //    Session.Add("Error", ex.ToString());
            //    Response.Redirect("Error.aspx", false);
            //}
        }

        protected void cbOffert_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}

