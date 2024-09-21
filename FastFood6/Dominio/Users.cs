using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Users
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public int Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public int PostCode { get; set; }
        public string Password { get; set; }
        public string ImageUrl { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Admin { get; set; }
    }
}
