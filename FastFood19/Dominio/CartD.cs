using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CartD
    {
        public int CartId { get; set; }
        public ProductD ProductId { get; set; }
        public ProductD Name { get; set; }
        public ProductD Price { get; set; }
        public ProductD ImageUrl { get; set; }
        public ProductD PrdQty { get; set; }
        public int Quantity { get; set; }
        public UsersD User { get; set; }

     
    }
}
