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
                    LoadCategories();

                    string id = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(id))
                    {
                        LoadProducts(Convert.ToInt32(id)); // Carga productos de la categoría seleccionada
                    }
                    else
                    {
                        LoadProducts(0); // Carga todos al inicio
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        private void LoadProducts(int categoryId)
        {
            BusinessProducts businessProduct = new BusinessProducts();
            List<ProductD> listProduct;

            if (categoryId > 0)
            {
                listProduct = businessProduct.ListProductsActiveCAtegory(categoryId); // Método que debe existir
            }
            else
            {
                listProduct = businessProduct.ListProductsActive();
            }

            rProducts.DataSource = listProduct;
            rProducts.DataBind();
        }

        private void LoadCategories()
        {
            BusinessCategories businessCategory = new BusinessCategories();
            List<CategoryD> listCategory = businessCategory.ListCategoryActive();
            rCategory.DataSource = listCategory;
            rCategory.DataBind();
        }

        public string LowerCase(object obj)
        {
            return obj.ToString().ToLower();
        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                int categoryId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Menu.aspx?id=" + categoryId, false); // Redirige con el ID de la categoría
            }
        }


        //cart3
        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //cart7
            try
            {
                if (Segurity.activeSession(Session["User"]))
                {
                    BusinessCarts business = new BusinessCarts();
                    CartD cartProduct = new CartD();
                    var userId = Session["User"] as UsersD;

                    //cart9
                    //bool isCartItemUpdate = false;

                    int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));

                    if (i == 0)
                    {
                        cartProduct.Quantity = 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        business.AddProductCart(cartProduct);





                    }
                    else
                    {
                        cartProduct.Quantity = i + 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        business.UpdateProductCart(cartProduct);

                    }

                    CartD countProductCard = new CartD();

                    countProductCard.User = new UsersD();
                    countProductCard.User.UserId = userId.UserId;

                    business.cartCount(countProductCard);
                    Session.Add("cartCount", countProductCard.Quantity);




                    if (e.CommandName == "addToCart")
                    {
                        // Limpiar mensajes de todos los productos
                        foreach (RepeaterItem item in rProducts.Items)
                        {
                            var lblMsg = (Label)item.FindControl("lblMsg");
                            if (lblMsg != null)
                            {
                                lblMsg.Text = ""; // Limpiar el texto
                                lblMsg.Visible = false; // Ocultar el label
                            }
                        }

                        // Establecer el mensaje para la fila actual
                        var currentLblMsg = (Label)e.Item.FindControl("lblMsg");
                        if (currentLblMsg != null)
                        {
                            currentLblMsg.Text = "Producto agregado!";
                            currentLblMsg.Visible = true;
                            currentLblMsg.CssClass = "alert alert-success";

                            // Script para ocultar el mensaje después de 3 segundos
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideLabel" + e.Item.ItemIndex,
                                "setTimeout(function(){ document.getElementById('" + currentLblMsg.ClientID + "').style.display='none'; }, 3000);", true);

                        }
                        else
                        {
                            throw new Exception("lblMsg no encontrado en la fila actual.");
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx", false);

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                    Session["MenuMsg"] = "Please log in, if you want to buy";

                }
            }


            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


        }

        //cart4
        int isItemExistInCart(int productId)
        {

            BusinessCarts business = new BusinessCarts();
            CartD cardProduct = new CartD();
            var userId = Session["User"] as UsersD;


            cardProduct.User = new UsersD();
            cardProduct.User.UserId = userId.UserId;
            cardProduct.ProductId = new ProductD();
            cardProduct.ProductId.ProductId = productId;

            business.isItemExistInCart(cardProduct);



            int quantity = 0;
            if (cardProduct.Quantity != 0)
            {
                quantity = cardProduct.Quantity;
            }

            return quantity;




        }


    }

}