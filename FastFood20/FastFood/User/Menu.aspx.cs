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
           


                    lblMsg.Visible = true;
                    lblMsg.Text = "Item added successfully in your Cart!";
                    lblMsg.CssClass = "alert alert-success";


                }
                else
                {
                    Response.Redirect("Login.aspx", false);
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