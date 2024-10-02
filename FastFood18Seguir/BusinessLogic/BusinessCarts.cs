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
        //public CartD ListCart(CartD userId)
        //{
        //    CartD listCart = new CartD();

        //    try
        //    {
        //        data.storedProcedureConsult("storedListCart");
        //        data.SetParameter("@UserId", userId.User);
        //        data.executeRead();
        //        while (data.Read.Read())
        //        {
        //            CartD auxCart = new CartD();

        //            auxCart.CartId = (int)data.Read["C.CartId"];

                    
        //            if (!(data.Read["C.ProductId"] is DBNull))
        //            {
        //                auxCart.Product = new ProductD();
        //                auxCart.Product.ProductId = (int)data.Read["C.ProductId"];
        //            }
        //            if (!(data.Read["P.Name"] is DBNull))
        //            {
        //                auxCart.Product = new ProductD();
        //                auxCart.Product.Name = (string)data.Read["P.Name"];
        //            }
        //            if (!(data.Read["P.ImageUrl"] is DBNull))
        //            {
        //                auxCart.Product = new ProductD();
        //                auxCart.Product.ImageUrl = (string)data.Read["P.ImageUrl"];
        //            }
        //            if (!(data.Read["P.ImageUrl"] is DBNull))
        //            {
        //                auxCart.Product = new ProductD();
        //                auxCart.Product.Price = (decimal)data.Read["P.Price"];
        //            }
        //            if (!(data.Read["Quantity"] is DBNull))
        //                auxCart.Quantity = (int)data.Read["Quantity"];


        //            listCart = auxCart;
        //        }


        //        return listCart;

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //    finally
        //    {
        //        data.closeConection();
        //    }

        //}

        public void AddProductCart(CartD addProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedProductCart");
                data.SetParameter("@ProductId", addProductCart.Product.ProductId);
                data.SetParameter("@Quantity", addProductCart.Quantity);
                data.SetParameter("@UserId", addProductCart.User.UserId);
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
