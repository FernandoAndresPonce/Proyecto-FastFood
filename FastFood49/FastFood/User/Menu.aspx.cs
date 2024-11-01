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

                    //if (Session["MsgLoginUserSuccess"] != null)
                    //{
                    //    lblMsg.Visible = true;
                    //    lblMsg.Text = Session["MsgLoginUserSuccess"].ToString();
                    //    lblMsg.CssClass = "alert alert-success";
                    //    Session["MsgLoginUserSuccess"] = null;
                    //}

                    //Show Filter Menu - Mostrar Filtro Menu.
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
            //cart7
            try
            {
                if (Segurity.activeSession(Session["User"]))
                {



                    BusinessCarts business = new BusinessCarts();
                    CartD cartProduct = new CartD();
                    var userId = Session["User"] as UsersD;


                    //Código existente para manejar el carrito...
                    int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));

                    if (i == 0)
                    {
                        //Add First Product - Agregar Primer Producto
                        cartProduct.Quantity = 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        //Obtener CartId
                        int cartId = business.AddProductCart(cartProduct);
                        cartProduct.CartId = cartId;

                        //obtener CategoryId del Product
                        business.ShowCategoryIdProduct(cartProduct);
                        Response.Redirect("Cart.aspx?id=" + cartProduct.ProductCategoryId, false);
                        Session["selectionQuantity"] = "Select the Quantity 🍔 !, Please 😊 ";



                    }
                    else
                    {
                        //Update Count Product - Actualizar Cantidad Producto
                        cartProduct.Quantity = i + 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        business.UpdateProductCart(cartProduct);


                    }


                    //Cart Count/ Contador de Carrito
                    CartD countProductCard = new CartD();
                    countProductCard.User = new UsersD();
                    countProductCard.User.UserId = userId.UserId;
                    business.cartCount(countProductCard);
                    Session.Add("cartCount", countProductCard.Quantity);





                    //Add Message "Add Product" - Agregar Mensaje "Producto Agregado"
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
                            currentLblMsg.Text = "Add Product!";
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
                    Session["MenuMsg"] = "Please log in !, if you want to buy 😊";

                }
            }


            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


        }

        //cart4
        //Exist Product or No - Existe el producto o no en la DB.
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