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
        public bool PopUp { get; set; }
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]))
                    {
                        if (Session["selectionQuantity"] != null)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = Session["selectionQuantity"].ToString();
                            lblMsg.CssClass = "alert alert-success";
                            Session["selectionQuantity"] = null;
                        }

                        BusinessCarts business = new BusinessCarts();
                        CartD cartProduct = new CartD();

                        var userId = Session["User"] as UsersD;

                        List<CartD> listProductCart = business.ListCart(userId);
                        Session.Add("listProductCart", listProductCart);

                        rCartItem.DataSource = listProductCart;

                        if (listProductCart.Count == 0)
                        {
                            rCartItem.FooterTemplate = null;
                            rCartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
                        }

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
                    CartD deletedProductCart = new CartD();

                    var userId = Session["User"] as UsersD;

                    deletedProductCart.User = new UsersD();
                    deletedProductCart.User.UserId = userId.UserId;

                    deletedProductCart.ProductId = new ProductD();
                    deletedProductCart.ProductId.ProductId = Convert.ToInt32(e.CommandArgument);

                    business.DeleteProductCart(deletedProductCart);
                    List<CartD> listProductCart = business.ListCart(userId);

                    rCartItem.DataSource = listProductCart;
                    rCartItem.DataBind();

                    lblMsg.Visible = true;
                    lblMsg.CssClass = "alert alert-danger";
                    lblMsg.Text = "Successful Removal ! 😢 ";

                }

                if (e.CommandName == "updateCart")
                {

                    lblMsg.Visible = false;

                    for (int item = 0; item < rCartItem.Items.Count; item++)
                    {
                        if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                        {
                            TextBox quantity = rCartItem.Items[item].FindControl("txtQuantity") as TextBox;
                            HiddenField _productId = rCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                            HiddenField _quantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;

                            int quantityFromCart = Convert.ToInt32(quantity.Text);
                            int productId = Convert.ToInt32(_productId.Value);
                            int quantityFromDB = Convert.ToInt32(_quantity.Value);

                            bool isTrue = false;
                            int updateQuantity = 1;

                            if (quantityFromCart > quantityFromDB)
                            {
                                updateQuantity = quantityFromCart;
                                isTrue = true;

                            }
                            else if (quantityFromCart < quantityFromDB)
                            {
                                updateQuantity = quantityFromCart;
                                isTrue = true;
                            }

                            if (isTrue)
                            {
                                BusinessCarts business = new BusinessCarts();
                                CartD updateProductCard = new CartD();

                                var userId = Session["User"] as UsersD;

                                updateProductCard.User = new UsersD();
                                updateProductCard.User.UserId = userId.UserId;

                                updateProductCard.ProductId = new ProductD();
                                updateProductCard.ProductId.ProductId = productId;
                                updateProductCard.Quantity = updateQuantity;

                                business.UpdateProductCart(updateProductCard);

                            }
                        }
                    }

                    BusinessCarts businessU = new BusinessCarts();

                    var userId2 = Session["User"] as UsersD;

                    List<CartD> listProductCart = businessU.ListCart(userId2);
                    Session.Add("listProductCart", listProductCart);

                    rCartItem.DataSource = listProductCart;
                    rCartItem.DataBind();

                    bool isTrueS = false;
                    string pName = string.Empty;

                    for (int item = 0; item < rCartItem.Items.Count; item++)
                    {
                        if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                        {
                            HiddenField _productId = rCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                            HiddenField _cartQuantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                            HiddenField _prdQuantity = rCartItem.Items[item].FindControl("hdnPrdQuantity") as HiddenField;
                            Label productName = rCartItem.Items[item].FindControl("lblname") as Label;
                            int productId = Convert.ToInt32(_productId.Value);
                            int cartQuantity = Convert.ToInt32(_cartQuantity.Value);
                            int productQuantity = Convert.ToInt32(_prdQuantity.Value);

                            if (productQuantity > cartQuantity && productQuantity > 2)
                            {

                                isTrueS = true;

                            }
                            else
                            {

                                isTrueS = false;
                                pName = productName.Text.ToString();
                                break;

                            }

                        }
                    }
                    if (isTrueS)
                    {
                        var userId = Session["User"] as UsersD;
                        PopUp = true;
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Item <b>'" + pName + "'</b>is out of Stock :(";
                        lblMsg.CssClass = "alert alert-warning";
                    }
                }


                BusinessCarts businessCount = new BusinessCarts();
                CartD countProductCard = new CartD();

                var userIdCount = Session["User"] as UsersD;

                countProductCard.User = new UsersD();
                countProductCard.User.UserId = userIdCount.UserId;

                businessCount.cartCount(countProductCard);
                Session.Add("cartCount", countProductCard.Quantity);

                if (Session["cartCount"] != null && (int)Session["cartCount"] == 0)
                {
                    Session["cartCount"] = "";
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
        protected void lbContinueShopping_Click(object sender, EventArgs e)
        {

            lblMsg.Visible = false;

            for (int item = 0; item < rCartItem.Items.Count; item++)
            {
                if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                {
                    TextBox quantity = rCartItem.Items[item].FindControl("txtQuantity") as TextBox;
                    HiddenField _productId = rCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                    HiddenField _quantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;

                    int quantityFromCart = Convert.ToInt32(quantity.Text);
                    int productId = Convert.ToInt32(_productId.Value);
                    int quantityFromDB = Convert.ToInt32(_quantity.Value);

                    bool isTrue = false;
                    int updateQuantity = 1;

                    if (quantityFromCart >= quantityFromDB)
                    {
                        updateQuantity = quantityFromCart;
                        isTrue = true;

                    }
                    else if (quantityFromCart <= quantityFromDB)
                    {
                        updateQuantity = quantityFromCart;
                        isTrue = true;
                    }

                    if (isTrue)
                    {

                        BusinessCarts business = new BusinessCarts();
                        CartD updateProductCard = new CartD();

                        var userId = Session["User"] as UsersD;

                        updateProductCard.User = new UsersD();
                        updateProductCard.User.UserId = userId.UserId;

                        updateProductCard.ProductId = new ProductD();
                        updateProductCard.ProductId.ProductId = productId;
                        updateProductCard.Quantity = updateQuantity;

                        business.UpdateProductCart(updateProductCard);
                    }
                }
            }

            BusinessCarts businessU = new BusinessCarts();
            var userIdU = Session["User"] as UsersD;
            List<CartD> listProductCart = businessU.ListCart(userIdU);
            Session.Add("listProductCart", listProductCart);
            rCartItem.DataSource = listProductCart;
            rCartItem.DataBind();

            Response.Redirect(Request.QueryString["Id"] != null ? "Menu.aspx?id=" + int.Parse(Request.QueryString["Id"]) : "Menu.aspx", false);

        }

        protected void lbContinueShoppingPopup_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = false;

            for (int item = 0; item < rCartItem.Items.Count; item++)
            {
                if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                {
                    TextBox quantity = rCartItem.Items[item].FindControl("txtQuantity") as TextBox;
                    HiddenField _productId = rCartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                    HiddenField _quantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;

                    int quantityFromCart = Convert.ToInt32(quantity.Text);
                    int productId = Convert.ToInt32(_productId.Value);
                    int quantityFromDB = Convert.ToInt32(_quantity.Value);

                    bool isTrue = false;
                    int updateQuantity = 1;

                    if (quantityFromCart >= quantityFromDB)
                    {
                        updateQuantity = quantityFromCart;
                        isTrue = true;

                    }
                    else if (quantityFromCart <= quantityFromDB)
                    {
                        updateQuantity = quantityFromCart;
                        isTrue = true;
                    }

                    if (isTrue)
                    {
                        BusinessCarts business = new BusinessCarts();
                        CartD updateProductCard = new CartD();

                        var userId = Session["User"] as UsersD;

                        updateProductCard.User = new UsersD();
                        updateProductCard.User.UserId = userId.UserId;

                        updateProductCard.ProductId = new ProductD();
                        updateProductCard.ProductId.ProductId = productId;
                        updateProductCard.Quantity = updateQuantity;

                        business.UpdateProductCart(updateProductCard);

                    }
                }
            }

            BusinessCarts businessU = new BusinessCarts();
            var userIdU = Session["User"] as UsersD;
            List<CartD> listProductCart = businessU.ListCart(userIdU);
            Session.Add("listProductCart", listProductCart);
            rCartItem.DataSource = listProductCart;
            rCartItem.DataBind();

            Response.Redirect(Request.QueryString["Id"] != null ? "Menu.aspx?id=" + int.Parse(Request.QueryString["Id"]) : "Menu.aspx", false);
        }

        protected void lbViewOrder_Click(object sender, EventArgs e)
        {
            try
            {
                var userId = Session["User"] as UsersD;
                Response.Redirect("DetailProductCart.aspx?Id=" + userId.UserId, false);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}