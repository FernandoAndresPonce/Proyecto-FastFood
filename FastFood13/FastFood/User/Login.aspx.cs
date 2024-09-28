﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.User
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["Mensaje"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["Mensaje"].ToString();
                        lblMsg.CssClass = "alert alert-danger";
                        Session["Mensaje"] = null;
                    }
                    else if (Session["MsgRegisteredPositive"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["MsgRegisteredPositive"].ToString();
                        lblMsg.CssClass = "alert alert-success";
                        Session["MsgRegisteredPositive"] = null;
                    }
                    else if (Session["MsgLoginAdmin"] != null)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = Session["MsgLoginAdmin"].ToString();
                        lblMsg.CssClass = "alert alert-danger";
                        Session["MsgLoginAdmin"] = null;
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                BusinessUsers business = new BusinessUsers();
                UsersD loginUser = new UsersD();

                loginUser.Username = txtUserName.Text;
                loginUser.Password = txtPassword.Text;

                if (business.Login(loginUser))
                {
                    Session.Add("User", loginUser);

                    if (loginUser.Admin == false)
                    {
                        // necesito mandar este msg al default.aspx
                        Session["MsgLoginUserSuccess"] = "Welcome, We hope you have a good experience " + loginUser.Name + " !";
                        Response.Redirect("Default.aspx", false);

                    }else if (loginUser.Admin)
                    {
                        Response.Redirect("../Admin/Dashboard.aspx", false);
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Incorrect UserName or Password !";
                    lblMsg.CssClass = "alert alert-danger";
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