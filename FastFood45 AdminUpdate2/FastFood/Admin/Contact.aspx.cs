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



        protected void dgvContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ContactId = dgvContact.SelectedDataKey.Value.ToString();
            Response.Redirect("ContactDetail.aspx?Id=" + ContactId, false);
        }

        protected void dgvContact_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<ContactD> list = (List<ContactD>)Session["listContacts"];
            if (list != null)
            {
                // Determina el orden
                string sortDirection = "ASC";
                if (ViewState["SortExpression"] != null && ViewState["SortExpression"].ToString() == e.SortExpression)
                {
                    sortDirection = ViewState["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
                }

                ViewState["SortExpression"] = e.SortExpression;
                ViewState["SortDirection"] = sortDirection;

                // Ordena la lista
                var sortedList = sortDirection == "ASC" ?
                    list.OrderBy(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList() :
                    list.OrderByDescending(x => x.GetType().GetProperty(e.SortExpression).GetValue(x, null)).ToList();

                // Reasigna el DataSource
                dgvContact.DataSource = sortedList;
                dgvContact.DataBind();
            }
        }
    }

}