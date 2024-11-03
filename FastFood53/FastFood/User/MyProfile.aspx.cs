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
    public partial class MyProfile : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["MsgUpdatePositive"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["MsgUpdatePositive"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["MsgUpdatePositive"] = null;
                    }
                }
                if (Segurity.activeSession(Session["User"]))
                {
                    UsersD user = (UsersD)Session["User"];

                    lblFullNameUser.Text = user.Name;
                    lblFullNameUser1.Text = user.Name;
                    lblUserName.Text = user.Username;
                    lblUserName1.Text = user.Username;
                    lblEmail.Text = user.Email;
                    lblEmail1.Text = user.Email;
                    lblAccountUpdate.Text = user.CreatedDate.ToString();
                    lblLastUpdate1.Text = user.CreatedDate.ToString();
                    lblAddress.Text = user.Address;
                    lblMobile.Text = user.Mobile;                  
                    lblPostCode.Text = user.PostCode;
                    if (!string.IsNullOrEmpty(user.ImageUrl))
                        imgUser.ImageUrl = "./Image/Users/" + user.ImageUrl;

                    BusinessOrders business = new BusinessOrders();

                    List<OrdersD> listProductCart = business.ListWithSPPruchaseHistory(user);
                    Session.Add("listProductCart", listProductCart);
                    //Repeater
                    if (listProductCart.Count == 0)
                    {
                        rPurchaseHistorty.FooterTemplate = null;
                        rPurchaseHistorty.FooterTemplate = new CustomTemplate(ListItemType.Footer);
                    }
                    rPurchaseHistorty.DataSource = listProductCart;
                    rPurchaseHistorty.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void rPurchaseHistorty_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField paymentId = e.Item.FindControl("hdnPaymentId") as HiddenField;
                Repeater repOrders = e.Item.FindControl("rOrders") as Repeater;

                BusinessOrders business = new BusinessOrders();
                OrdersD order = new OrdersD();

                var userId = Session["User"] as UsersD;
                order.User = new UsersD();
                order.User.UserId = userId.UserId;
                order.Payment = new PaymentD();
                order.Payment.PaymentId = Convert.ToInt32(paymentId.Value);

                List<OrdersD> listOrders = business.ListWithSPOrder(order);
                Session.Add("listOrder", listOrders);
                decimal grandTotal = 0;
                foreach (var listOrder in listOrders)
                {
                    grandTotal += listOrder.TotalPrice;
                }
                Session.Add("grandTotalPrice", grandTotal);

                repOrders.DataSource = listOrders;
                repOrders.DataBind();
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
                    var footer = new LiteralControl("<tr><td><b>Hungry! Why not order food for you.</b><a href='Menu.aspx' class='badge badge-info ml-2'>Click to Order</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
    }
}