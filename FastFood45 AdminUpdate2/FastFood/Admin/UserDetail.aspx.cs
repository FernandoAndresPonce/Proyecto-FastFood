using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.Admin
{
    public partial class UserDetail : System.Web.UI.Page
    {
        public bool ConfirmDeleted { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {


           
            try
            {
                string userId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (userId != string.Empty && !IsPostBack)
                {
                    BusinessUsers business = new BusinessUsers();
                    UsersD seletedUser = new UsersD();



                    seletedUser.UserId = int.Parse(userId);
                    business.ShowUserDetail(seletedUser);

                    //lblNameUser.Text = seletedUser.Name;
                    //lblUsernameUser.Text = seletedUser.Username;
                    //lblMobileUser.Text = seletedUser.Mobile;
                    //lblEmailUser.Text = seletedUser.Email;
                    //lblAddressUser.Text = seletedUser.Address;
                    //lblPostCodeUser.Text = seletedUser.PostCode;
                    //lblCreatedDateUser.Text = seletedUser.CreatedDate.ToString("dd/MM/yyyy");
                    //if (!string.IsNullOrEmpty(seletedUser.ImageUrl))
                    //    imgUser.ImageUrl = "~/User/Image/Users/" + seletedUser.ImageUrl;


                    //------------------------------

                    lblFullNameUser.Text = seletedUser.Name;
                    //lblFullNameUser1.Text = seletedUser.Name;
                    lblUserName.Text = seletedUser.Username;
                    //lblUserName1.Text = seletedUser.Username;
                    lblEmail.Text = seletedUser.Email;
                    //lblEmail1.Text = seletedUser.Email;
                    //txtPassword.Text = user.Password;
                    lblAccountUpdate.Text = seletedUser.CreatedDate.ToString();
                    //lblLastUpdate1.Text = seletedUser.CreatedDate.ToString();
                    lblAddress.Text = seletedUser.Address;
                    lblMobile.Text = seletedUser.Mobile;

                    lblPostCode.Text = seletedUser.PostCode;
                    if (!string.IsNullOrEmpty(seletedUser.ImageUrl))
                        imgUser.ImageUrl = "~/User/Image/Users/" + seletedUser.ImageUrl;

                    BusinessOrders businessOrder = new BusinessOrders();

                    List<OrdersD> listProductCart = businessOrder.ListWithSPPruchaseHistory(seletedUser);
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ConfirmDeleted = true;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx", false);
        }

        protected void btnConfirmDeletion_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessUsers business = new BusinessUsers();

                if (cbConfirmDeletion.Checked)
                {
                    business.DeleteWithSP(int.Parse(Request.QueryString["Id"]));

                    string script = @"<script type='text/javascript'>alert('User has been successfully DELETED !'); window.location.href='http://localhost:52000/Admin/User.aspx'</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
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

                //History purchase
                //tendria que modificar el storedProcedure

                BusinessOrders business = new BusinessOrders();
                OrdersD order = new OrdersD();

                order.User = new UsersD();
                order.User.UserId = int.Parse(Request.QueryString["Id"]);
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

                //Repeater

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