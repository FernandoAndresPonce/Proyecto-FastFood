﻿using System;
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


                    BusinessCarts businessCart = new BusinessCarts();
                    CartD deletedProductCard = new CartD();
                    var userId = Session["User"] as UsersD;

                    int paymentId = business.AddWithSP(payment);

                    //Session.Add("paymentId", paymentId);

                    BusinessOrders businessOrders = new BusinessOrders();
                    List<CartD> list = (List<CartD>)Session["listProductCart"];
                    List<OrdersD> orders = new List<OrdersD>();

                    foreach (var cartItem in list)
                    {
                        OrdersD order = new OrdersD();

                        order.OrderNo = Utils.GetUniqueId();
                        order.Product = new ProductD();
                        order.Product.ProductId = cartItem.ProductId.ProductId;
                        order.Quantity = cartItem.Quantity;
                        order.User = new UsersD();
                        order.User.UserId = userId.UserId;
                        order.Status = "Pending";
                        order.Payment = new PaymentD();
                        order.Payment.PaymentId = paymentId;
                        order.OrderDate = DateTime.Now;


                        businessOrders.AddWithSP(order);

                    }



                    Response.Redirect("Invoice.aspx?Id=" + paymentId, false);

                    deletedProductCard.User = new UsersD();
                    deletedProductCard.User.UserId = userId.UserId;
                    businessCart.DeleteProductCartAll(deletedProductCard);

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

                //ver medio de paga en efectivo
                BusinessPayments business = new BusinessPayments();
                PaymentD payment = new PaymentD();


                var userId = Session["User"] as UsersD;

                payment.Name = userId.Name;
                payment.Address = txtCODAddress.Text;
                payment.PaymentMode = "cod";
                if (Segurity.activeSession(Session["User"]))
                {             
                  
                    int paymentId = business.AddWithSPCash(payment);

                    //Session.Add("paymentId", paymentId);


                    List<CartD> list = (List<CartD>)Session["listProductCart"];
                    List<OrdersD> orders = new List<OrdersD>();

                    foreach (var cartItem in list)
                    {

                        BusinessOrders businessOrders = new BusinessOrders();
                        OrdersD order = new OrdersD();

                        order.OrderNo = Utils.GetUniqueId();
                        order.Product = new ProductD();
                        order.Product.ProductId = cartItem.ProductId.ProductId;
                        order.Quantity = cartItem.Quantity;
                        order.User = new UsersD();
                        order.User.UserId = userId.UserId;
                        order.Status = "Pending";
                        order.Payment = new PaymentD();
                        order.Payment.PaymentId = paymentId;
                        order.OrderDate = DateTime.Now;


                        businessOrders.AddWithSP(order);

                    }



                    Response.Redirect("Invoice.aspx?Id=" + paymentId, false);

                    CartD deletedProductCard = new CartD();
                    deletedProductCard.User = new UsersD();
                    deletedProductCard.User.UserId = userId.UserId;

                    BusinessCarts businessCart = new BusinessCarts();
                    businessCart.DeleteProductCartAll(deletedProductCard);

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

        protected void lbReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailProductCart.aspx", false);
        }
    }
}