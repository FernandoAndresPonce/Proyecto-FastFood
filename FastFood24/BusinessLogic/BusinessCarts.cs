﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DataAccess;

namespace BusinessLogic
{
    public class BusinessCarts
    {
        private Connection data;

        public BusinessCarts()
        {
            this.data = new Connection();
        }


        //ojo toda esta parte .
        public List<CartD> ListCart(UsersD userId)
        {
            List<CartD> listCart = new List<CartD>();
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedListCart");
                data.SetParameter("@UserId", userId.UserId);
                data.executeRead();

                while (data.Read.Read())
                {
                    CartD auxCart = new CartD();

                    auxCart.CartId = (int)data.Read["CartId"];

                    if (!(data.Read["ProductId"] is DBNull))
                    {

                        auxCart.ProductId = new ProductD();
                        auxCart.ProductId.ProductId = (int)data.Read["ProductId"];

                    }


                    if (!(data.Read["Name"] is DBNull))
                    {

                        auxCart.ProductName = (string)data.Read["Name"];
                    }
                    if (!(data.Read["ImageUrl"] is DBNull))
                    {

                        auxCart.ProductImageUrl = (string)data.Read["ImageUrl"];
                    }

                    if (!(data.Read["PrdQty"] is DBNull))
                    {
                        auxCart.ProductQuantity = (int)data.Read["PrdQty"];
                    }
                    if (!(data.Read["Price"] is DBNull))
                    {

                        auxCart.ProductPrice = (decimal)data.Read["Price"];
                    }
                    if (!(data.Read["Qty"] is DBNull))
                        auxCart.Quantity = (int)data.Read["Qty"];


                    listCart.Add(auxCart);
                }


                return listCart;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }

        }

        //cart5
        public void isItemExistInCart(CartD userId)
        {


            try
            {
                data.storedProcedureConsult("storedGetByIdCart");
                data.SetParameter("@ProdcutId", userId.ProductId.ProductId);
                data.SetParameter("@UserId", userId.User.UserId);
                data.executeRead();
                while (data.Read.Read())
                {


                    userId.CartId = (int)data.Read["CartId"];
                    userId.ProductId = new ProductD();
                    userId.ProductId.ProductId = (int)data.Read["ProductId"];
                    userId.User = new UsersD();
                    userId.User.UserId = (int)data.Read["UserId"];
                    if (!(data.Read["Quantity"] is DBNull))
                        userId.Quantity = (int)data.Read["Quantity"];

                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }

        }

        public void cartCount(CartD deletedProductCard)
        {
            try
            {
                data.storedProcedureConsult("storedCartCountItems");
                data.SetParameter("@UserId", deletedProductCard.User.UserId);
                data.executeRead();
                while (data.Read.Read())
                {

                    if (!(data.Read["Quantity"] is DBNull))
                        deletedProductCard.Quantity = (int)data.Read["Quantity"];

                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        //cart6
        public void AddProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedAddProductCart");
                data.SetParameter("@ProductId", ProductCart.ProductId.ProductId);
                data.SetParameter("@Quantity", ProductCart.Quantity);
                data.SetParameter("@UserId", ProductCart.User.UserId);
                data.executeAction();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        //cart8
        public void UpdateProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedUpdateProductCart");
                data.SetParameter("@ProductId", ProductCart.ProductId.ProductId);
                data.SetParameter("@Quantity", ProductCart.Quantity);
                data.SetParameter("@UserId", ProductCart.User.UserId);
                data.executeAction();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        public void DeleteProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedDeleteProductCart");
                data.SetParameter("@ProductId", ProductCart.ProductId.ProductId);
                data.SetParameter("@UserId", ProductCart.User.UserId);
                data.executeAction();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        public void DeleteProductCartAll(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedDeleteProductCartAll");
                data.SetParameter("@UserId", ProductCart.User.UserId);
                data.executeAction();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }
    }
}


