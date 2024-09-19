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
    public partial class ProductForm : System.Web.UI.Page
    {
        public bool ConfirmAddCancel { get; set; }
        public bool ConfirmDeleted { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            ConfirmAddCancel = false;
            ConfirmDeleted = false;

            try
            {
                txtProductId.Enabled = false;
                txtCreatedDate.Enabled = false;

                if (!IsPostBack)
                {
                    BusinessCategories businessCategory = new BusinessCategories();
                    List<CategoryD> listCategory = businessCategory.ListWithSP();

                    ddlCategory.DataSource = listCategory;
                    ddlCategory.DataValueField = "CategoryId";
                    ddlCategory.DataTextField = "Name";
                    ddlCategory.DataBind();

                }

                string Name = Request.QueryString["Name"] != null ? Request.QueryString["Name"] : string.Empty;


                string ProductId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;


                if (ProductId != string.Empty && !IsPostBack)
                {
                    Product selectedProduct = new Product();
                    BusinessProducts business = new BusinessProducts();

                    btnAdd.Text = "Update";

                    selectedProduct.ProductId = int.Parse(ProductId);
                    business.ShowProduct(selectedProduct);

                    txtProductId.Text = selectedProduct.ProductId.ToString();
                    txtProductName.Text = selectedProduct.Name;
                    txtDescription.Text = selectedProduct.Description;
                    ddlCategory.SelectedValue = selectedProduct.Category.CategoryId.ToString();
                    TxtPrice.Text = selectedProduct.Price.ToString();
                    txtQuantity.Text = selectedProduct.Quantity.ToString();
                    txtCreatedDate.Text = selectedProduct.CreatedDate.ToString();
                    cbActivo.Checked = selectedProduct.IsActive;
                    if (!string.IsNullOrEmpty(selectedProduct.ImageUrl))
                        imgForm.ImageUrl = "./Image/" + selectedProduct.ImageUrl;

                    Session.Add("Product", selectedProduct);
                }
                else if (Name != string.Empty && !IsPostBack)
                {

                    txtProductName.Enabled = false;

                    Product selectedProduct = new Product();
                    BusinessProducts business = new BusinessProducts();

                    selectedProduct.Name = Name;
                    business.ShowProductName(selectedProduct);

                    txtProductId.Text = selectedProduct.ProductId.ToString();
                    txtProductName.Text = selectedProduct.Name;

                    Session.Add("Product", selectedProduct);
                }

            }



            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;


                BusinessProducts business = new BusinessProducts();
                Product addProduct = (Product)Session["Product"];

                if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Image/");
                    txtImage.PostedFile.SaveAs(route + "Product-" + addProduct.Name + ".jpg");
                    addProduct.ImageUrl = "Product-" + addProduct.Name + ".jpg";
                }

                addProduct.Name = txtProductName.Text;
                addProduct.Description = txtDescription.Text;
                addProduct.Price = decimal.Parse(TxtPrice.Text.ToString());
                addProduct.Quantity = int.Parse(txtQuantity.Text.ToString());
                addProduct.Category = new CategoryD();
                addProduct.Category.CategoryId = int.Parse(ddlCategory.SelectedValue);
                addProduct.IsActive = cbActivo.Checked;

                business.UpdateWithSp(addProduct);

                if (Request.QueryString["Name"] != null)
                {
                    string script = @"<script type='text/javascript'>alert('Product has been successfully CREATED !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else
                {

                    string script = @"<script type='text/javascript'>alert('Product has been successfully UPDATE !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

                    //Tener otra alternativa de como puede aparecer el popup de que el producto ha sido actualizado existosamente, con su descripcion.

                    //string script = @"<script type='text/javascript'>alert('Product has been successfully UPDATE ! \NAME: $" + addProduct.Price
                    //    + @"\nProduct PRICE: " + addProduct.Price
                    //    + @"\nQUANTITY: " + addProduct.Quantity
                    //    + @"\nDESCRIPCION: " + addProduct.Description 
                    //    + @"\nCATEGORIA: " + addProduct.Category.Name + "'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
                    //ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

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

        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ConfirmAddCancel = true;
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnConfirmAddCancel_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessProducts business = new BusinessProducts();
                Product cancelProduct = new Product();
                cancelProduct.ProductId = int.Parse(txtProductId.Text.ToString());

                if (cbConfirmAddCancel.Checked)
                {
                    business.DeleteWithSP(cancelProduct);
                    string script = @"<script type='text/javascript'>alert('Product has been successfully CANCELED !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ConfirmDeleted = true;
        }

        protected void btnConfirmDeletion_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessProducts business = new BusinessProducts();
                Product deleteProduct = new Product();
                deleteProduct.ProductId = int.Parse(txtProductId.Text.ToString());

                if (cbConfirmDeletion.Checked)
                {
                    business.DeleteWithSP(deleteProduct);
                    string script = @"<script type='text/javascript'>alert('Product has been successfully DELETED !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
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
            try
            {
                if (cbActivo.Checked)
                {
                    lblActive.Text = "Active";
                    lblActive.CssClass = "form-label badge badge-success";
                }
                else
                {
                    lblActive.Text = "Inactive";
                    lblActive.CssClass = "form-label badge badge-danger";
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnUpdateImage_Click(object sender, EventArgs e)
        {
            

            if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
            {
                string route = Server.MapPath("./Image/");
                txtImage.PostedFile.SaveAs(route + "Product-Preview.jpg");
                imgForm.ImageUrl = "./Image/Product-Preview.jpg";
            }

        } 
    }
}
