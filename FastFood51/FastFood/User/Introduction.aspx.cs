using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FastFood.User
{
    public partial class Introduction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lbHome_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}