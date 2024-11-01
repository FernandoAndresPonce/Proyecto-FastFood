using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using Helper;
using System.IO;

namespace FastFood.User
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]))
                    {
                        lblHeaderMsg.Text = "<h2> Edit User";
                        btnRegister.Text = "Update";
                        txtPassword.Enabled = false;
                        txtEmail.Enabled = false;
                        txtUserName.Enabled = false;
                        lblAlreadyUser.Visible = false;
                        btnReturn.Visible = true;

                        UsersD user = (UsersD)Session["User"];
                        txtUserName.Text = user.Username;
                        txtName.Text = user.Name;
                        txtEmail.Text = user.Email;
                        txtPassword.Text = user.Password;
                        txtAddress.Text = user.Address;
                        txtMobile.Text = user.Mobile;
                        txtPostCode.Text = user.PostCode;
                        if (!string.IsNullOrEmpty(user.ImageUrl))
                        {
                            imgUser.ImageUrl = "./Image/Users/" + user.ImageUrl;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                BusinessUsers business = new BusinessUsers();
                UsersD user = new UsersD();

                user.Name = txtName.Text;
                user.Username = txtUserName.Text;
                user.Email = txtEmail.Text;
                user.Password = txtPassword.Text;
                user.Mobile = txtMobile.Text;
                user.Address = txtAddress.Text;
                user.PostCode = txtPostCode.Text;

                if (Segurity.activeSession(Session["User"]))
                {
                    var userSession = Session["User"] as UsersD;
                    user.UserId = userSession.UserId;
                    user.ImageUrl = "User-" + user.UserId + ".jpg";

                    if (fuUserImage.HasFile)
                    {
                        fuUserImage.PostedFile.SaveAs(Server.MapPath("./Image/Users/") + "User-" + user.UserId + ".jpg");
                        user.ImageUrl = "User-" + user.UserId + ".jpg";
                    }

                    business.UpdateUser(user);
                    Session.Add("User", user);

                    Session["MsgUpdatePositive"] = user.Name + " has successfully UPDATE ! 😊";
                    Response.Redirect("MyProfile.aspx", false);
                }
                else
                {
                    int userId = business.AddWithSP(user);

                    if (fuUserImage.HasFile)
                    {
                        user.UserId = userId;

                        fuUserImage.PostedFile.SaveAs(Server.MapPath("./Image/Users/") + "User-" + user.UserId + ".jpg");
                        user.ImageUrl = "User-" + user.UserId + ".jpg";
                    }
                    else
                    {
                        string route = Server.MapPath("./Image/Users/");
                        File.Copy(Server.MapPath("~/TemplateFiles/images/perfil.png"), route + "User-" + userId + ".jpg", true);
                        user.ImageUrl = "User-" + user.UserId + ".jpg";
                    }
                    business.AddImageWithSP(user);

                    Response.Redirect("Login.aspx", false);
                    Session["MsgRegisteredPositive"] = user.Name + " has successfully REGISTERED ! 😊";
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_UserName'"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> Username Already Exists, try new one... !";
                    lblMsg.CssClass = "alert alert-danger";
                    txtUserName.Text = string.Empty;
                }
                else if (ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_Email'"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtEmail.Text.Trim() + "</b> Email Already Exists, try new one... !";
                    lblMsg.CssClass = "alert alert-danger";
                    txtEmail.Text = string.Empty;
                }
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx", false);
        }
    }
}