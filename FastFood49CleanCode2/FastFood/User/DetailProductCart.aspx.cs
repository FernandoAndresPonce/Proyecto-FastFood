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
    public partial class DetailProductCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]) && Request.QueryString["Id"] != null)
                    {
                        BusinessCarts business = new BusinessCarts();
                        int userId = int.Parse(Request.QueryString["Id"]);

                        List<CartD> listProductCart = business.ListDetailProductCart(userId);
                        Session.Add("listProductCart", listProductCart);

                        decimal grandtotal = 0;
                        foreach (var listProduct in listProductCart)
                        {
                            grandtotal += listProduct.Total;
                        }
                        Session["grandTotalPrice"] = grandtotal;

                        rOrderItems.DataSource = listProductCart;
                        rOrderItems.DataBind();
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
        protected void lbReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx", false);
        }
        protected void lbConfirmOrder_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(Request.QueryString["Id"]);
            Response.Redirect("Payment.aspx?id=" + userId, false);
        }
    }
}