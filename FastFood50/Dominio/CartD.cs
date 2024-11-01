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
        public int Quantity { get; set; }
        public UsersD User { get; set; }
        public string ProductName { get; set; } // Nombre del producto
        public decimal ProductPrice { get; set; } // Precio del producto
        public string ProductImageUrl { get; set; } // URL de la imagen del producto
        public int ProductQuantity { get; set; } // Cantidad del producto
        public int ProductCategoryId { get; set; }
        public decimal Total { get; set; }
    }
}
