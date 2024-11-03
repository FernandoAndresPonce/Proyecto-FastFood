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

        public List<OrdersD> ShowOrderStatus(int selectedOrderStatus)
        {
            try
            {
                List<OrdersD> listOrder = new List<OrdersD>();

                data.clearParameter();
                data.SetParameter("@OrderDetailsId", selectedOrderStatus);
                data.storedProcedureConsult("storedShowChangeStatus");
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();

                    if (!(data.Read["OrderDetailsId"] is DBNull))
                        auxOrder.OrderDetailsId = (int)data.Read["OrderDetailsId"];
                    if (!(data.Read["OrderNo"] is DBNull))
                        auxOrder.OrderNo = (string)data.Read["OrderNo"];
                    if (!(data.Read["TotalPrice"] is DBNull))
                    {
                        auxOrder.Payment = new PaymentD();
                        auxOrder.TotalPrice = (decimal)data.Read["TotalPrice"];
                    }
                    if (!(data.Read["Status"] is DBNull))
                        auxOrder.Status = (string)data.Read["Status"];
                    if (!(data.Read["OrderDate"] is DBNull))
                        auxOrder.OrderDate = DateTime.Parse(data.Read["OrderDate"].ToString());
                    if (!(data.Read["PaymentMode"] is DBNull))
                        auxOrder.PaymentMode = (string)data.Read["PaymentMode"];
                    if (!(data.Read["Name"] is DBNull))
                        auxOrder.ProductName = (string)data.Read["Name"];
                    if (!(data.Read["Quantity"] is DBNull))
                        auxOrder.Quantity = (int)data.Read["Quantity"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxOrder.ProductImageUrl = (string)data.Read["ImageUrl"];

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

        public int TotalOrdersDelivered()
        {
            int totalOrdersDelivered = 0;
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalDelivered");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalOrdersDelivered = (int)data.Read["Total"];
                }

                return totalOrdersDelivered;
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

        public decimal TotalAmount()
        {
            decimal totalTotalAmount = 0;
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalAmount");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalTotalAmount = (decimal)data.Read["Total"];
                }
                return totalTotalAmount;
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

        public int TotalOrdersPending()
        {
            int totalOrdersPending = 0;
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalPending");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalOrdersPending = (int)data.Read["Total"];
                }
                return totalOrdersPending;
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

        public int TotalOrders()
        {
            int totalOrders = 0;
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalOrders");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalOrders = (int)data.Read["Total"];
                }
                return totalOrders;
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

        public List<OrdersD> ListWithSDSellingReport(DateTime fromDate, DateTime toDate)
        {
            try
            {
                List<OrdersD> listOrder = new List<OrdersD>();

                data.storedProcedureConsult("storedSellingReport");

                data.SetParameter("@FromDate", fromDate);
                data.SetParameter("@ToDate", toDate);
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();

                    if (!(data.Read["SrNo"] is DBNull))
                        auxOrder.SrNo = int.Parse(data.Read["SrNo"].ToString());
                    if (!(data.Read["Email"] is DBNull))
                        auxOrder.UserEmail = (string)data.Read["Email"];
                    if (!(data.Read["Name"] is DBNull))
                        auxOrder.UserName = (string)data.Read["Name"];
                    if (!(data.Read["TotalOrders"] is DBNull))
                        auxOrder.Quantity = int.Parse(data.Read["TotalOrders"].ToString());
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
                        auxOrder.ProductName = (string)data.Read["Name"];
                    if (!(data.Read["Price"] is DBNull))
                        auxOrder.ProductPrice = decimal.Parse(data.Read["Price"].ToString());
                    if (!(data.Read["Quantity"] is DBNull))
                        auxOrder.Quantity = int.Parse(data.Read["Quantity"].ToString());
                    if (!(data.Read["TotalPrice"] is DBNull))
                        auxOrder.TotalPrice = decimal.Parse(data.Read["TotalPrice"].ToString());
                    if (!(data.Read["Status"] is DBNull))
                        auxOrder.Status = (string)data.Read["Status"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxOrder.ProductImageUrl = (string)data.Read["ImageUrl"];

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
                        order.OrderDetailsId = (int)data.Read["OrderDetailsId"];
                    if (!(data.Read["Status"] is DBNull))
                        order.Status = (string)data.Read["Status"];
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
                        auxOrder.OrderDetailsId = (int)data.Read["OrderDetailsId"];
                    if (!(data.Read["OrderNo"] is DBNull))
                        auxOrder.OrderNo = (string)data.Read["OrderNo"];
                    if (!(data.Read["TotalPrice"] is DBNull))
                    {
                        auxOrder.Payment = new PaymentD();
                        auxOrder.TotalPrice = (decimal)data.Read["TotalPrice"];
                    }
                    if (!(data.Read["Status"] is DBNull))
                        auxOrder.Status = (string)data.Read["Status"];
                    if (!(data.Read["OrderDate"] is DBNull))
                        auxOrder.OrderDate = DateTime.Parse(data.Read["OrderDate"].ToString());
                    if (!(data.Read["PaymentMode"] is DBNull))
                        auxOrder.PaymentMode = (string)data.Read["PaymentMode"];
                    if (!(data.Read["Name"] is DBNull))
                        auxOrder.ProductName = (string)data.Read["Name"];

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
                data.clearParameter();
                data.storedProcedureConsult("storePurchaseHistorty");

                data.SetParameter("@UserId", order.UserId);
                data.executeRead();
                while (data.Read.Read())
                {
                    OrdersD auxOrder = new OrdersD();

                    if (!(data.Read["PaymentMode"] is DBNull))
                        auxOrder.PaymentMode = (string)data.Read["PaymentMode"];
                    if (!(data.Read["PaymentId"] is DBNull))
                    {
                        auxOrder.Payment = new PaymentD();
                        auxOrder.Payment.PaymentId = (int)data.Read["PaymentId"];
                    }
                    if (!(data.Read["CardNo"] is DBNull))
                        auxOrder.CardNo = (string)data.Read["CardNo"];

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
