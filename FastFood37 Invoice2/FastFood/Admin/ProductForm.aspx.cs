using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using System.IO;

namespace FastFood.Admin
{
    public partial class ProductForm : System.Web.UI.Page
    {
        public bool ConfirmDeleted { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

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


                string ProductId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;


                if (ProductId != string.Empty && !IsPostBack)
                {
                    ProductD selectedProduct = new ProductD();
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
                        imgForm.ImageUrl = "./Image/Products/" + selectedProduct.ImageUrl;

                    //Session.Add("Product", selectedProduct);
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
                ProductD addProduct = new ProductD();




                addProduct.Name = txtProductName.Text;
                addProduct.Description = txtDescription.Text;
                addProduct.Price = decimal.Parse(TxtPrice.Text.ToString());
                addProduct.Quantity = int.Parse(txtQuantity.Text.ToString());
                addProduct.Category = new CategoryD();
                addProduct.Category.CategoryId = int.Parse(ddlCategory.SelectedValue);
                addProduct.IsActive = cbActivo.Checked;


                if (Request.QueryString["Id"] != null)
                {
                    addProduct.ProductId = int.Parse(txtProductId.Text.ToString());
                    addProduct.ImageUrl = "Product-" + addProduct.ProductId + ".jpg";

                    if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Image/Products/");
                        txtImage.PostedFile.SaveAs(route + "Product-" + addProduct.ProductId + ".jpg");
                        addProduct.ImageUrl = "Product-" + addProduct.ProductId + ".jpg";
                    }

                    business.UpdateWithSp(addProduct);

                    string script = @"<script type='text/javascript'>alert('Product has been successfully UPDATE !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else
                {
                    int id = business.AddWithSP(addProduct);
                    addProduct.ProductId = id;
                    if (!string.IsNullOrEmpty(txtImage.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Image/Products/");
                        txtImage.PostedFile.SaveAs(route + "Product-" + addProduct.ProductId + ".jpg");
                        addProduct.ImageUrl = "Product-" + addProduct.ProductId + ".jpg";
                    }
                    else
                    {

                        string route = Server.MapPath("./Image/Products/");
                        File.Copy(Server.MapPath("~/Admin/Image/placeholder/placeholder.jpg"), route + "Product-" + addProduct.ProductId + ".jpg", true);
                        addProduct.ImageUrl = "Product-" + addProduct.ProductId + ".jpg"; // URL del placeholder

                    }

                    business.AddImageWithSP(addProduct);

                    string script = @"<script type='text/javascript'>alert('Product has been successfully CREATED !'); window.location.href='http://localhost:52000/Admin/Products.aspx'</script>";
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


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ConfirmDeleted = true;
        }

        protected void btnConfirmDeletion_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessProducts business = new BusinessProducts();
                ProductD deleteProduct = new ProductD();
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

    }
}
