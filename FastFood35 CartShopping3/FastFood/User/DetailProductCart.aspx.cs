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
                    if (Segurity.activeSession(Session["User"]))
                    {
                        BusinessCarts business = new BusinessCarts();
                        var userId = Session["User"] as UsersD;
                   

                        // Obtener la lista de productos en el carrito
                        List<CartD> listProductCart = business.ListDetailProductCart(userId);
                        Session.Add("listProductCart", listProductCart);

                        //Calcular el total
                        decimal grandtotal = 0;
                        foreach (var listProduct in listProductCart)
                        {
                            grandtotal += listProduct.Total;
                        }

                        //Asignar el total a la sesión
                        Session["grandTotalPrice"] = grandtotal;

                        //Asignar la lista al Repeater
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
    }
}