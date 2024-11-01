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
    public partial class SliderUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    BusinessProducts business = new BusinessProducts();

                    List<ProductD> listProducts = business.ListProductActiveOffert();

                    rProduct.DataSource = listProducts;
                    rProduct.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
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

                    Response.Redirect("Cart.aspx", false);
                    Session["selectionQuantity"] = "Select the Quantity 🍔 !, Please 😊 ";

                    if (e.CommandName == "addToCart")
                    {
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