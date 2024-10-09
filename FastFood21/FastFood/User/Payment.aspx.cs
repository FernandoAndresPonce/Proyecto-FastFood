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
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //<%--6 itemsCart--%>
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]))
                    {




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

        protected void lbCardSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessPayments business = new BusinessPayments();
                PaymentD payment = new PaymentD();

                payment.Name = txtName.Text;
                payment.CardNo = txtCardNo.Text;
                payment.CardNo = string.Format("************{0}", txtCardNo.Text.Substring(12, 4));
                payment.ExpireDate = txtExpMonth.Text + "/" + txtExpYear.Text;
                payment.CvvNo = int.Parse(txtCvv.Text.ToString());
                payment.Address = txtAddress.Text;
                payment.PaymentMode = "card";

                if (Segurity.activeSession(Session["User"]))
                {
                    //DEBO SEGUIR POR ACA!!!!!!
                    int paymentId = business.AddWithSP(payment);


                    Response.Redirect("Invoice.aspx?Id=" + paymentId, false);


                    //deberia eleminar todos los productos del carrito.
                    BusinessCarts businessCart = new BusinessCarts();
                    CartD deletedProductCard = new CartD();

                    var userId = Session["User"] as UsersD;

                    deletedProductCard.User = new UsersD();
                    deletedProductCard.User.UserId = userId.UserId;
                    businessCart.DeleteProductCart(deletedProductCard);

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

        protected void lbCodSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                PaymentD payment = new PaymentD();

                payment.Address = txtCODAddress.Text;
                payment.PaymentMode = "cod";

                if (Segurity.activeSession(Session["User"]))
                {




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


    }
}