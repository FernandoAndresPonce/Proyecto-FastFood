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

        public string ProductName { get; set; } // Nombre del producto
        public decimal ProductPrice { get; set; } // Precio del producto
        public decimal TotalPrice { get; set; } // Precio Total * producto
    }
}
