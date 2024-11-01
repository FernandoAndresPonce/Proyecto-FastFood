using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using BusinessLogic;
using System.IO;


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
                if (cbOffert.Checked && cbActivo.Checked)
                {
                    txtofferPercentage.Visible = true;
                }
                string CategoryId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (CategoryId != string.Empty && !IsPostBack)
                {
                    lblCategoryTitle.Text = "Edit Category";

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

                    if (cbOffert.Checked && cbActivo.Checked)
                    {
                        txtofferPercentage.Visible = true;
                    }
                    if (!string.IsNullOrEmpty(selectedCategory.ImageUrl))
                        imgForm.ImageUrl = "./Image/Categories/" + selectedCategory.ImageUrl;
                    txtofferPercentage.Text = selectedCategory.OfferPercentage.ToString();
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
                //Page.Validate();
                //if (!Page.IsValid)
                //    return;

                BusinessCategories business = new BusinessCategories();
                CategoryD addCategory = new CategoryD();

                addCategory.Name = txtName.Text;
                addCategory.IsActive = cbActivo.Checked;
                addCategory.IsOffert = cbOffert.Checked;

                if (cbOffert.Checked && cbActivo.Checked)
                {
                    addCategory.OfferPercentage = int.Parse(txtofferPercentage.Text.ToString());

                }
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

                    Session["UpdateCategory"] = "Category has been successfully UPDATE ! > " + txtName.Text.Trim() + " <";
                    Response.Redirect("Category.aspx", false);
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
                    else
                    {
                        string route = Server.MapPath("./Image/Categories/");
                        File.Copy(Server.MapPath("~/Admin/Image/placeholder/placeholder.jpg"), route + "Category-" + addCategory.CategoryId + ".jpg", true);
                        addCategory.ImageUrl = "Category-" + addCategory.CategoryId + ".jpg";
                    }
                    business.AddImageWithSP(addCategory);

                    Session["CreateCategory"] = "Category has been successfully CREATED ! > " + txtName.Text.Trim() + " <";
                    Response.Redirect("Category.aspx", false);
                }
            }
            catch (Exception ex)
            {
                //lblMsg.Text = "No add" + ex.Message;
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

                if (cbConfirmDeletion.Checked)
                {
                    business.DeleteWithSP(int.Parse(txtCategoryId.Text));

                    Session["DeleteCategory"] = "Category has been successfully DELETE ! > " + txtName.Text.Trim() + " <";
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

