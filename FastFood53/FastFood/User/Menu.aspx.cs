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

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (Segurity.activeSession(Session["User"]))
                {
                    BusinessCarts business = new BusinessCarts();
                    CartD cartProduct = new CartD();
                    var userId = Session["User"] as UsersD;

                    int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));

                    if (i == 0)
                    {
                        cartProduct.Quantity = 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        int cartId = business.AddProductCart(cartProduct);
                        cartProduct.CartId = cartId;

                        business.ShowCategoryIdProduct(cartProduct);
                        Response.Redirect("Cart.aspx?id=" + cartProduct.ProductCategoryId, false);
                        Session["selectionQuantity"] = "Select the Quantity 🍔 !, Please 😊 ";
                    }
                    else
                    {
                        cartProduct.Quantity = i + 1;
                        cartProduct.User = new UsersD();
                        cartProduct.User.UserId = userId.UserId;
                        cartProduct.ProductId = new ProductD();
                        cartProduct.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                        int cartId = business.UpdateProductCart(cartProduct);
                        cartProduct.CartId = cartId;

                        business.ShowCategoryIdProduct(cartProduct);
                        Response.Redirect("Cart.aspx?id=" + cartProduct.ProductCategoryId, false);
                        Session["selectionQuantity"] = "the same product has been added again, Update the Quantity 🍔 !, Please 😊 ";
                    }
                    CartD countProductCard = new CartD();
                    countProductCard.User = new UsersD();
                    countProductCard.User.UserId = userId.UserId;
                    business.cartCount(countProductCard);
                    Session.Add("cartCount", countProductCard.Quantity);

                    if (e.CommandName == "addToCart")
                    {
                        foreach (RepeaterItem item in rProducts.Items)
                        {
                            var lblMsg = (Label)item.FindControl("lblMsg");
                            if (lblMsg != null)
                            {
                                lblMsg.Text = "";
                                lblMsg.Visible = false;
                            }
                        }
                        var currentLblMsg = (Label)e.Item.FindControl("lblMsg");
                        if (currentLblMsg != null)
                        {
                            currentLblMsg.Text = "Add Product!";
                            currentLblMsg.Visible = true;
                            currentLblMsg.CssClass = "alert alert-success";

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