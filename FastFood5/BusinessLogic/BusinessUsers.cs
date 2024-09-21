using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using Dominio;

namespace BusinessLogic
{
    public class BusinessUsers
    {
        private Connection data;

        public BusinessUsers()
        {
            this.data = new Connection();
        }
        public void AddWithSP(Users newUser)
        {

            try
            {
                data.storedProcedureConsult("storedAddUser");
                data.SetParameter("@Email", newUser.Email);
                data.SetParameter("@Password", newUser.Password);
                data.executeAction();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }
    }
}
