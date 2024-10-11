using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using Dominio;

namespace BusinessLogic
{
    public class BusinessOrders
    {

        private Connection data;

        public BusinessOrders()
        {
            this.data = new Connection();
        }

        public void AddWithSP(OrdersD order)
        {

            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedAddOrder");

                data.SetParameter("@PaymentId", order.Payment.PaymentId);
                data.SetParameter("@ProductId", order.Product.ProductId);
                data.SetParameter("@OrderNo", order.OrderNo);
                data.SetParameter("@Quantity", order.Quantity);
                data.SetParameter("@UserId", order.User.UserId);
                data.SetParameter("@Status", order.Status);
                data.SetParameter("@OrderDate", order.OrderDate);

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

        public List<OrdersD> ListWithSPOrder(OrdersD order)
        {
            try
            {
                List<OrdersD> listOrder = new List<OrdersD>();

                data.storedProcedureConsult("storedListOrder");
                data.SetParameter("@UserId", order.User.UserId);
                data.SetParameter("@PaymentId", order.Payment.PaymentId);
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();

                    auxOrder.OrderDetailsId = (int)data.Read["OrderDetailsId"];

                    if (!(data.Read["OrderNo"] is DBNull))
                        auxOrder.OrderNo = (string)data.Read["OrderNo"];

                    if (!(data.Read["Name"] is DBNull))
                    {                       
                        auxOrder.ProductName = (string)data.Read["Name"];
                    }
                    if (!(data.Read["Price"] is DBNull))
                    {
                        auxOrder.ProductPrice = decimal.Parse(data.Read["Price"].ToString());
                    }
                    if (!(data.Read["Quantity"] is DBNull))
                        auxOrder.Quantity = int.Parse(data.Read["Quantity"].ToString());
                    if (!(data.Read["TotalPrice"] is DBNull))
                        auxOrder.TotalPrice = decimal.Parse(data.Read["TotalPrice"].ToString());




                    listOrder.Add(auxOrder);
                }


                return listOrder;

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
