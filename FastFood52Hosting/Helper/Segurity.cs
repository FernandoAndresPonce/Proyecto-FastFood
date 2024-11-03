using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Helper
{
    public static class Segurity
    {
        public static bool activeSession(object user)
        {
            UsersD login = user != null ? (UsersD)user : null;
            if(login != null && login.UserId != 0)
            {
                return true;
            }
            return false;
        }
        public static bool isAdmin(object user)
        {
            UsersD login = user != null ? (UsersD)user : null;
            return login != null ? login.Admin : false;
        }
    }
}
