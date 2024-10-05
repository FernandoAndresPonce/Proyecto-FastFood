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
        public ProductD Product { get; set; }
        public int Quantity { get; set; }
        public UsersD User { get; set; }

     
    }
}
