using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DataAccess;

namespace BusinessLogic
{
    public class BusinessContacts
    {
        private Connection data;

        public BusinessContacts()
        {
            this.data = new Connection();
        }
        public bool AddWithSDNewMessage(ContactD newMessage)
        {
            try
            {
                data.storedProcedureConsult("storedAddNewMessage");

                data.SetParameter("@Name", newMessage.Name);
                data.SetParameter("@Email", newMessage.Email);
                data.SetParameter("@Subject", newMessage.Subject);
                data.SetParameter("@Message", newMessage.Message);

                data.executeAction();
                return true;
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

        public void ShowContactDetail(ContactD contact)
        {
            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedShowMessageContacts");

                data.SetParameter("@ContactId", contact.ContactId);
                data.executeRead();
                while (data.Read.Read())
                {

                    if (!(data.Read["SrNo"] is DBNull))
                        contact.ContactId = (int)data.Read["SrNo"];
                    if (!(data.Read["Name"] is DBNull))
                        contact.Name = (string)data.Read["Name"];
                    if (!(data.Read["Email"] is DBNull))
                        contact.Email = (string)data.Read["Email"];
                    if (!(data.Read["Subject"] is DBNull))
                        contact.Subject = (string)data.Read["Subject"];
                    if (!(data.Read["Message"] is DBNull))
                        contact.Message = (string)data.Read["Message"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        contact.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                }
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

        public void DeleteWithSP(int deleteContact)
        {
            try
            {
                data.storedProcedureConsult("storedDeleteContact");

                data.SetParameter("@ContactId", deleteContact);
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

        public List<ContactD> ListWithSPNewContact()
        {
            List<ContactD> listContacts = new List<ContactD>();

            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedListMessageContacts");

                data.executeRead();
                while (data.Read.Read())
                {
                    ContactD auxContact = new ContactD();

                    if (!(data.Read["ContactId"] is DBNull))
                        auxContact.ContactId = (int)data.Read["ContactId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxContact.Name = (string)data.Read["Name"];
                    if (!(data.Read["Email"] is DBNull))
                        auxContact.Email = (string)data.Read["Email"];
                    if (!(data.Read["Subject"] is DBNull))
                        auxContact.Subject = (string)data.Read["Subject"];
                    if (!(data.Read["Message"] is DBNull))
                        auxContact.Message = (string)data.Read["Message"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxContact.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    listContacts.Add(auxContact);
                }
                return listContacts;
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

        public int TotalContacts()
        {
            int totalContacts = 0;

            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedContacts");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        totalContacts = (int)data.Read["Total"];
                }
                return totalContacts;
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

        public void deleteWithSDMessageContact(ContactD messageContactDelete)
        {
            try
            {
                data.storedProcedureConsult("storedDeleteMessageContacts");

                data.SetParameter("@ContactId", messageContactDelete.ContactId);
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
