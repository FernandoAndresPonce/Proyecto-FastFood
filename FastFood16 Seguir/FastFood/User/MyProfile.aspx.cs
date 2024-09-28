using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using Helper;
using BusinessLogic;

namespace FastFood.User
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtUserName.Enabled = false;
            //txtEmail.Enabled = false;
            if (!IsPostBack)
            {
                if (Segurity.activeSession(Session["User"]))
                {
                    UsersD user = (UsersD)Session["User"];

                    //lblFullNameUser.Text = user.Name;
                    lblFullNameUser1.Text = user.Name;
                    lblUserName.Text = user.Username;
                    lblUserName1.Text = user.Username;
                    lblEmail.Text = user.Email;
                    lblEmail1.Text = user.Email;
                    //txtPassword.Text = user.Password;
                    lblAccountUpdate.Text = user.CreatedDate.ToString();
                    lblLastUpdate1.Text = user.CreatedDate.ToString();
                    lblAddress.Text = user.Address;
                    lblMobile.Text = user.Mobile;
                    lblPostCode.Text = user.PostCode;
                    if (!string.IsNullOrEmpty(user.ImageUrl))
                        imgUser.ImageUrl = "./Image/Users/" + user.ImageUrl;

                    //BusinessUsers business = new BusinessUsers();
                    //rMyProfile.DataSource = business.ListWithSP();
                    //rMyProfile.DataBind();
                }



            }

        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("About.aspx", false);
        //}

        //protected void btnDeleteUser_Click(object sender, EventArgs e)
        //{

        //}
    }
}