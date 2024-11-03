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
                        auxCart.ProductName = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCart.ProductImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["PrdQty"] is DBNull))
                        auxCart.ProductQuantity = (int)data.Read["PrdQty"];
                    if (!(data.Read["Price"] is DBNull))
                        auxCart.ProductPrice = (decimal)data.Read["Price"];
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

        public List<CartD> ListDetailProductCart(int userId)
        {
            List<CartD> listCart = new List<CartD>();
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedListCartSumaProduct");

                data.SetParameter("@UserId", userId);
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
                        auxCart.ProductName = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCart.ProductImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["Total"] is DBNull))
                        auxCart.Total = (decimal)data.Read["Total"];
                    if (!(data.Read["Price"] is DBNull))
                        auxCart.ProductPrice = (decimal)data.Read["Price"];
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

        public void ShowCategoryIdProduct(CartD cartProduct)
        {
            try
            {

                data.clearParameter();
                data.storedProcedureConsult("ShowCategoryIdProduct");

                data.SetParameter("@UserId", cartProduct.User.UserId);
                data.SetParameter("@CartId", cartProduct.CartId);
                data.executeRead();
                while (data.Read.Read())
                {
                    cartProduct.ProductCategoryId = (int)data.Read["CategoryId"];
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

        public void cartCount(CartD countProductCard)
        {
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedCartCountItems");

                data.SetParameter("@UserId", countProductCard.User.UserId);
                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Quantity"] is DBNull))
                        countProductCard.Quantity = (int)data.Read["Quantity"];
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

        public int AddProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedAddProductCart");

                data.SetParameter("@ProductId", ProductCart.ProductId.ProductId);
                data.SetParameter("@Quantity", ProductCart.Quantity);
                data.SetParameter("@UserId", ProductCart.User.UserId);
                return data.executeActionScalar();
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

        public int UpdateProductCart(CartD ProductCart)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedUpdateProductCart");

                data.SetParameter("@ProductId", ProductCart.ProductId.ProductId);
                data.SetParameter("@Quantity", ProductCart.Quantity);
                data.SetParameter("@UserId", ProductCart.User.UserId);
                return data.executeActionScalar();


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


