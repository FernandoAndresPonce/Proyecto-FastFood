using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class OrdersD
    {
        public int OrderDetailsId { get; set; }
        public string OrderNo { get; set; }
        public ProductD ProductId { get; set; }
        public int Quantity { get; set; }
        public UsersD UserId { get; set; }
        public string Status { get; set; }
        public PaymentD PaymentId { get; set; }
        public DateTime OrderDate { get; set; }
    }
}
