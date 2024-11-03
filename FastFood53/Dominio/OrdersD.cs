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
        public ProductD Product { get; set; }
        public int Quantity { get; set; }
        public UsersD User { get; set; }
        public string Status { get; set; } 
        public PaymentD Payment { get; set; }
        public DateTime OrderDate { get; set; }

        //propiedades product
        public string ProductName { get; set; } 
        public decimal ProductPrice { get; set;} 
        public decimal TotalPrice { get; set; }
        public string ProductImageUrl { get; set; }

        //propiedades Payment
        public string PaymentMode { get; set; }
        public string CardNo { get; set; }

        //propiedades User
        public string UserName { get; set; }
        public string UserEmail { get; set; }

        //propiedades SrNo
        public int SrNo { get; set; }
    }
}
