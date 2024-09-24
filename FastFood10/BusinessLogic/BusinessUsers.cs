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

        //retorna el id del usuario.
        public int AddWithSP(Users newUser)
        {

            try
            {
                data.storedProcedureConsult("storedAddUser");

                data.SetParameter("@Name", newUser.Name);
                data.SetParameter("@UserName", newUser.Username);
                data.SetParameter("@Password", newUser.Password);
                data.SetParameter("@Email", newUser.Email);
                data.SetParameter("@Mobile", newUser.Mobile);
                data.SetParameter("@Address", newUser.Address);
                data.SetParameter("@PostCode", newUser.PostCode);
                data.SetParameter("@ImageUrl", (object)newUser.ImageUrl ?? DBNull.Value);

                return data.executeActionScalar();
                
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

        public int confirmLogin(Users loginUser)
        {
            try
            {
                return 5;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
