using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CategoryD
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool IsOffert { get; set; }
        public int OfferPercentage { get; set; }
        public override string ToString()
        {
            return Name;
        }
    }   
}
