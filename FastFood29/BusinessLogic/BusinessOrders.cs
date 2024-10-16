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
                    if (!(data.Read["OrderDate"] is DBNull))
                        auxOrder.OrderDate = DateTime.Parse(data.Read["OrderDate"].ToString());

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
                    if (!(data.Read["Status"] is DBNull))
                        auxOrder.Status = (string)data.Read["Status"];




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

        public bool ListWithSPUpdateStatus(OrdersD order)
        {
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedUpdateStatus");
                data.SetParameter("@OrderDetailsId", order.OrderDetailsId);
                data.SetParameter("@Status", order.Status);
                data.executeAction();
                return true;



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

        public void ListWithSPChangeStatus(OrdersD order)
        {
            try
            {

                data.storedProcedureConsult("storedChangeStatus");
                data.SetParameter("@OrderDetailsId", order.OrderDetailsId);
                data.executeRead();
                while (data.Read.Read())
                {
                   

                    if (!(data.Read["OrderDetailsId"] is DBNull))
                    {
                        order.OrderDetailsId = (int)data.Read["OrderDetailsId"];
                    }            

                    if (!(data.Read["Status"] is DBNull))
                    {
                        order.Status = (string)data.Read["Status"];
                    }

                    
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

        public List<OrdersD> ListWithSPStatus()
        {
            try
            {
                List<OrdersD> listOrder = new List<OrdersD>();
                data.clearParameter();
                data.storedProcedureConsult("storedListStatus");
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();

                    if (!(data.Read["OrderDetailsId"] is DBNull))
                    {
                        auxOrder.OrderDetailsId = (int)data.Read["OrderDetailsId"];
                    }

                    if (!(data.Read["OrderNo"] is DBNull))
                    {
                        auxOrder.OrderNo = (string)data.Read["OrderNo"];
                    }


                    if (!(data.Read["TotalPrice"] is DBNull))
                    {
                        auxOrder.Payment = new PaymentD();
                        auxOrder.TotalPrice = (decimal)data.Read["TotalPrice"];
                    }

                    if (!(data.Read["Status"] is DBNull))
                    {
                        auxOrder.Status = (string)data.Read["Status"];
                    }

                    if (!(data.Read["OrderDate"] is DBNull))
                    {
                        auxOrder.OrderDate = DateTime.Parse(data.Read["OrderDate"].ToString());
                    }

                    if (!(data.Read["PaymentMode"] is DBNull))
                    {
                        auxOrder.PaymentMode = (string)data.Read["PaymentMode"];
                    }

                    if (!(data.Read["Name"] is DBNull))
                    {
                        auxOrder.ProductName = (string)data.Read["Name"];
                    }



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

        public List<OrdersD> ListWithSPPruchaseHistory(UsersD order)
        {
            try
            {
                List<OrdersD> listOrder = new List<OrdersD>();

                data.storedProcedureConsult("storePurchaseHistorty");
                data.SetParameter("@UserId", order.UserId);
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();


                    if (!(data.Read["PaymentMode"] is DBNull))
                    {
                        auxOrder.PaymentMode = (string)data.Read["PaymentMode"];
                    }


                    if (!(data.Read["PaymentId"] is DBNull))
                    {
                        auxOrder.Payment = new PaymentD();
                        auxOrder.Payment.PaymentId = (int)data.Read["PaymentId"];
                    }

                    if (!(data.Read["CardNo"] is DBNull))
                    {
                        auxOrder.CardNo = (string)data.Read["CardNo"];
                    }



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
