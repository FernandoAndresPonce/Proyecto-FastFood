using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ProductD
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }
        public CategoryD Category { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool IsOffer { get; set; }

        //producto Category
        public string ProductCategory { get; set; }

        public override string ToString()
        {
            return ProductId.ToString();
        }
    }
}

