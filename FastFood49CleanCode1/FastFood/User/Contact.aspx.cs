using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.User
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessContacts business = new BusinessContacts();
                ContactD newMessage = new ContactD();

                newMessage.Name = txtName.Text;
                newMessage.Email = txtEmail.Text;
                newMessage.Subject = txtSubject.Text;
                newMessage.Message = txtMessage.Text;

                if (business.AddWithSDNewMessage(newMessage))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thanks for reaching out will look into your query!";
                    lblMsg.CssClass = "alert alert-success";
                }
                clear();

            }
            catch (Exception ex)
            {
                Response.Write("<script>altert('" + ex.Message + "');</script>");
            }     
        }

        private void clear()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }

    }
}