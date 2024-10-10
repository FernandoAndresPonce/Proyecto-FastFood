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
    }
}
