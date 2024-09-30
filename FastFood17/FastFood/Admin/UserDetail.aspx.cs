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
    public partial class UserDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


           
            try
            {
                string userId = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : string.Empty;

                if (userId != string.Empty && !IsPostBack)
                {
                    BusinessUsers business = new BusinessUsers();
                    UsersD seletedUser = new UsersD();



                    seletedUser.UserId = int.Parse(userId);
                    business.ShowUserDetail(seletedUser);

                    lblNameUser.Text = seletedUser.Name;
                    lblUsernameUser.Text = seletedUser.Username;
                    lblMobileUser.Text = seletedUser.Mobile;
                    lblEmailUser.Text = seletedUser.Email;
                    lblAddressUser.Text = seletedUser.Address;
                    lblPostCodeUser.Text = seletedUser.PostCode;
                    lblCreatedDateUser.Text = seletedUser.CreatedDate.ToString("dd/MM/yyyy");
                    if (!string.IsNullOrEmpty(seletedUser.ImageUrl))
                        imgUser.ImageUrl = "~/User/Image/Users/" + seletedUser.ImageUrl;
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

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx", false);
        }
    }
}