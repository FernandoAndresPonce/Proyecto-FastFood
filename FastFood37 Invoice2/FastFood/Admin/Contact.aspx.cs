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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Session["breadCrum"] = "Contact Users";
                }

                BusinessContacts business = new BusinessContacts();

                Session.Add("listContacts", business.ListWithSPNewContact());
                dgvContact.DataSource = Session["listContacts"];
                dgvContact.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }



        protected void dgvContact_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvContact.PageIndex = e.NewPageIndex;
            dgvContact.DataSource = Session["listContacts"]; ;
            dgvContact.DataBind();
        }

        protected void dgvContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "delete")
                {
                    BusinessContacts business = new BusinessContacts();
                    ContactD messageContactDelete = new ContactD();

                    messageContactDelete.ContactId = Convert.ToInt32(e.CommandArgument);

                    business.deleteWithSDMessageContact(messageContactDelete);

                    Session.Add("listContacts", business.ListWithSPNewContact());
                    dgvContact.DataSource = Session["listContacts"];
                    dgvContact.DataBind();

                    lblMsg.Visible = true;
                    lblMsg.Text = "Message successfully deleted !";
                    lblMsg.CssClass = "alert alert-success";
                }

                if (e.CommandName == "edit")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "redirect", "window.location.href='User.aspx';", true);
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