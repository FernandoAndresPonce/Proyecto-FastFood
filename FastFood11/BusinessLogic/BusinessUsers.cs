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

        public bool Login(Users loginUser)
        {
            try
            {
                data.storedProcedureConsult("storedLogin");
                data.SetParameter("@UserName", loginUser.Username);
                data.SetParameter("@Password", loginUser.Password);
                data.executeRead();


                while (data.Read.Read())
                {


                    loginUser.UserId = (int)data.Read["UserId"];
                    loginUser.Admin = (bool)data.Read["Admin"];
                    if (!(data.Read["Name"] is DBNull))
                        loginUser.Name = (string)data.Read["Name"];
                    if (!(data.Read["UserName"] is DBNull))
                        loginUser.Username = (string)data.Read["UserName"];
                    if (!(data.Read["Mobile"] is DBNull))
                        loginUser.Mobile = (string)data.Read["Mobile"];
                    if (!(data.Read["Email"] is DBNull))
                        loginUser.Email = (string)data.Read["Email"];
                    if (!(data.Read["Address"] is DBNull))
                        loginUser.Address = (string)data.Read["Address"];
                    if (!(data.Read["PostCode"] is DBNull))
                        loginUser.PostCode = (string)data.Read["PostCode"];
                    if (!(data.Read["Password"] is DBNull))
                        loginUser.Password = (string)data.Read["Password"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        loginUser.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        loginUser.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    return true;
                }
                return false;
            }

            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
