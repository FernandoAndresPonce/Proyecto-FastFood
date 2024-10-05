using System;
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
        public CartD ListCart(CartD userId)
        {
            CartD listCart = new CartD();

            try
            {
                data.storedProcedureConsult("storedListCart");
                data.SetParameter("@UserId", userId.User);
                data.executeRead();
                while (data.Read.Read())
                {
                    CartD auxCart = new CartD();

                    auxCart.CartId = (int)data.Read["C.CartId"];


                    if (!(data.Read["C.ProductId"] is DBNull))
                    {
                        auxCart.Product = new ProductD();
                        auxCart.Product.ProductId = (int)data.Read["C.ProductId"];
                    }
                    if (!(data.Read["P.Name"] is DBNull))
                    {
                        auxCart.Product = new ProductD();
                        auxCart.Product.Name = (string)data.Read["P.Name"];
                    }
                    if (!(data.Read["P.ImageUrl"] is DBNull))
                    {
                        auxCart.Product = new ProductD();
                        auxCart.Product.ImageUrl = (string)data.Read["P.ImageUrl"];
                    }
                    if (!(data.Read["P.ImageUrl"] is DBNull))
                    {
                        auxCart.Product = new ProductD();
                        auxCart.Product.Price = (decimal)data.Read["P.Price"];
                    }
                    if (!(data.Read["Quantity"] is DBNull))
                        auxCart.Quantity = (int)data.Read["Quantity"];


                    listCart = auxCart;
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
                data.SetParameter("@ProdcutId", userId.Product.ProductId);
                data.SetParameter("@UserId", userId.User.UserId);
                data.executeRead();
                while (data.Read.Read())
                {


                    userId.CartId = (int)data.Read["CartId"];
                    userId.Product = new ProductD();
                    userId.Product.ProductId = (int)data.Read["ProductId"];
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

        //cart6
        public void AddProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedAddProductCart");
                data.SetParameter("@ProductId", ProductCart.Product.ProductId);
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
                data.SetParameter("@ProductId", ProductCart.Product.ProductId);
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
                data.SetParameter("@ProductId", ProductCart.Product.ProductId);
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


