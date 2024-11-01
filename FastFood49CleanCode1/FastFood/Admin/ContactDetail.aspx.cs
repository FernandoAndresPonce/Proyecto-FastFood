using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.Admin
{
    public partial class ContactDetail : System.Web.UI.Page
    {
        public bool ConfirmDeleted { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ContactId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (ContactId != string.Empty && !IsPostBack)
                {
                    ContactD selectedContact = new ContactD();
                    BusinessContacts business = new BusinessContacts();

                    selectedContact.ContactId = int.Parse(ContactId);
                    business.ShowContactDetail(selectedContact);

                    lblContactSrNo.Text = selectedContact.ContactId.ToString();
                    lblContactEmail.Text = selectedContact.Email;
                    lblSubject.Text = selectedContact.Subject;
                    lblNameContact.Text = selectedContact.Name;
                    lblDescriptionContact.Text = selectedContact.Message;
                    lblCreateDate.Text = selectedContact.CreatedDate.ToString();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ConfirmDeleted = true;
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Contact.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        } 
        protected void btnConfirmDeletion_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessContacts business = new BusinessContacts();

                if (cbConfirmDeletion.Checked)
                {
                    business.DeleteWithSP(int.Parse(Request.QueryString["Id"]));
                    Session["deleteContact"] = "Contact has been successfully DELETE ! > " + lblNameContact.Text.Trim() + " <";
                    Response.Redirect("Contact.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}