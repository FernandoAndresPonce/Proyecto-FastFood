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
    public partial class Cart : System.Web.UI.Page
    {
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //<%--6 itemsCart--%>
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]))
                    {
                        BusinessCarts business = new BusinessCarts();
                        CartD cartProduct = new CartD();

                        var userId = Session["User"] as UsersD;

                        //cartProduct.User = new UsersD();
                        //cartProduct.User.UserId = userId.UserId;

                        List<CartD> listProductCart = business.ListCart(userId);

                        //Repeater
                        rCartItem.DataSource = listProductCart;

                        //ver esta parte super importante.
                        //if (listProductCart)
                        //{
                        //    rCartItem.FooterTemplate = null;
                        //    rCartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
                        //}
                        rCartItem.DataBind();



                    }
                    else
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }

        }

        protected void rCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "remove")
                {
                    BusinessCarts business = new BusinessCarts();
                    CartD deletedProductCard = new CartD();

                    var userId = Session["User"] as UsersD;

                    deletedProductCard.User = new UsersD();
                    deletedProductCard.User.UserId = userId.UserId;

                    deletedProductCard.ProductId = new ProductD();
                    deletedProductCard.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                    business.DeleteProductCart(deletedProductCard);
                    List<CartD> listProductCart = business.ListCart(userId);

                    rCartItem.DataSource = listProductCart;
                    rCartItem.DataBind();
         

                }


            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void rCartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                //importante Cart para tomar control de las label, y poder multiplcar columnas diferentesy sumar.
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                    Label productPrice = e.Item.FindControl("lblPrice") as Label;
                    TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;


                    decimal productPriceValue;
                    if (!decimal.TryParse(productPrice.Text.Replace("$", "").Trim(), out productPriceValue))
                    {

                        totalPrice.Text = "0.00";
                        return;
                    }

                    decimal quantityValue;
                    if (!decimal.TryParse(quantity.Text, out quantityValue) || quantityValue < 1)
                    {

                        totalPrice.Text = "0.00";
                        return;
                    }

                    decimal calTotalPrice = productPriceValue * quantityValue;
                    totalPrice.Text = calTotalPrice.ToString();
                    grandTotal += calTotalPrice;
                }

                Session["grandTotalPrice"] = grandTotal;
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


        }

        protected void lbDelete_Click(object sender, EventArgs e)
        {

        }

        //<%--5 itemsCart--%>

        private sealed class CustomTemplate : ITemplate
        {
            private ListItemType ListItemType { get; set; }

            public CustomTemplate(ListItemType type)
            {
                ListItemType = type;
            }

            public void InstantiateIn(Control container)
            {
                if (ListItemType == ListItemType.Footer)
                {
                    var footer = new LiteralControl("<tr><td colspan='5'><b>Your Cart is empty.</b><a href='Menu.aspx' class='badge badge-info ml-2'>Continue Shopping</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
    }
}