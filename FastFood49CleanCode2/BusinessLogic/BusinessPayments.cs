using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DataAccess;

namespace BusinessLogic
{
    public class BusinessPayments
    {
        private Connection data;
        public BusinessPayments()
        {
            this.data = new Connection();
        }
        public int AddWithSP(PaymentD payment)
        {
            try
            {
                data.storedProcedureConsult("storedAddPayment");

                data.SetParameter("@Name", payment.Name);
                data.SetParameter("@CardNo", payment.CardNo);
                data.SetParameter("@ExpiryDate", payment.ExpireDate);
                data.SetParameter("@CvvNo", payment.CvvNo);
                data.SetParameter("@Address", payment.Address);
                data.SetParameter("@PaymentMode", payment.PaymentMode);

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

        public int AddWithSPCash(PaymentD payment)
        {
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedAddPaymentDelivery");

                data.SetParameter("@Name", payment.Name);
                data.SetParameter("@Address", payment.Address);
                data.SetParameter("@PaymentMode", payment.PaymentMode);

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
    }
}
