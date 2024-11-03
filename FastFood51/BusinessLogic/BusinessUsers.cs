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

        public List<UsersD> ListWithSP()
        {
            List<UsersD> listUsers = new List<UsersD>();

            try
            {
                data.storedProcedureConsult("storedListUsers");

                data.executeRead();
                while (data.Read.Read())
                {
                    UsersD auxUser = new UsersD();

                    auxUser.UserId = (int)data.Read["UserId"];
                    auxUser.Admin = (bool)data.Read["Admin"];
                    if (!(data.Read["Name"] is DBNull))
                        auxUser.Name = (string)data.Read["Name"];
                    if (!(data.Read["UserName"] is DBNull))
                        auxUser.Username = (string)data.Read["UserName"];
                    if (!(data.Read["Mobile"] is DBNull))
                        auxUser.Mobile = (string)data.Read["Mobile"];
                    if (!(data.Read["Email"] is DBNull))
                        auxUser.Email = (string)data.Read["Email"];
                    if (!(data.Read["Address"] is DBNull))
                        auxUser.Address = (string)data.Read["Address"];
                    if (!(data.Read["PostCode"] is DBNull))
                        auxUser.PostCode = (string)data.Read["PostCode"];
                    if (!(data.Read["Password"] is DBNull))
                        auxUser.Password = (string)data.Read["Password"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxUser.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxUser.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    listUsers.Add(auxUser);
                }
                return listUsers;
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
        public void DeleteWithSP(int deleteUser)
        {
            try
            {
                data.storedProcedureConsult("storedDeleteUser");

                data.SetParameter("@UserId", deleteUser);
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

        public int TotalUsers()
        {
            int totalUsers = 0;
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalUsers");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalUsers = (int)data.Read["Total"];
                }

                return totalUsers;
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

        public void UpdateUser(UsersD updateUser)
        {
            try
            {
                data.storedProcedureConsult("storedUpdateUser");

                data.SetParameter("@Name", updateUser.Name);
                data.SetParameter("@Password", updateUser.Password);
                data.SetParameter("@Mobile", updateUser.Mobile);
                data.SetParameter("@Address", updateUser.Address);
                data.SetParameter("@PostCode", updateUser.PostCode);
                data.SetParameter("@ImageUrl", (object)updateUser.ImageUrl ?? DBNull.Value);
                data.SetParameter("@UserId", updateUser.UserId);

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

        public UsersD ShowUserDetail(UsersD seletedUser)
        {
            try
            {
                data.storedProcedureConsult("storedShowDetailUser");

                data.SetParameter("@UserId", seletedUser.UserId);
                data.executeRead();

                while (data.Read.Read())
                {
                    seletedUser.UserId = (int)data.Read["UserId"];
                    seletedUser.Admin = (bool)data.Read["Admin"];
                    if (!(data.Read["Name"] is DBNull))
                        seletedUser.Name = (string)data.Read["Name"];
                    if (!(data.Read["UserName"] is DBNull))
                        seletedUser.Username = (string)data.Read["UserName"];
                    if (!(data.Read["Mobile"] is DBNull))
                        seletedUser.Mobile = (string)data.Read["Mobile"];
                    if (!(data.Read["Email"] is DBNull))
                        seletedUser.Email = (string)data.Read["Email"];
                    if (!(data.Read["Address"] is DBNull))
                        seletedUser.Address = (string)data.Read["Address"];
                    if (!(data.Read["PostCode"] is DBNull))
                        seletedUser.PostCode = (string)data.Read["PostCode"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        seletedUser.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        seletedUser.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                }
                return seletedUser;
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

        public int AddWithSP(UsersD newUser)
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

        public bool Login(UsersD loginUser)
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
            finally
            {
                data.closeConection();
            }
        }

        public void AddImageWithSP(UsersD newUser)
        {
            data.clearParameter();
            try
            {
                data.storedProcedureConsult("storedAddImageUser");

                data.SetParameter("@ImageUrl", (object)newUser.ImageUrl ?? DBNull.Value);
                data.SetParameter("@UserId", newUser.UserId);
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
