using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;

namespace FastFood.User
{
    public partial class Registration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                Users newUser = new Users();
                BusinessUsers business = new BusinessUsers();              

                newUser.Name = txtName.Text;
                newUser.Username = txtUserName.Text;
                newUser.Email = txtEmail.Text;
                newUser.Password = txtPassword.Text;
                newUser.Mobile = txtMobile.Text;
                newUser.Address = txtAddress.Text;
                newUser.PostCode = txtPostCode.Text;


                //vAMOS HACER LO MISMO QUE EN CATEGORY Y PRODUCTS CON LA IMAGEN
                //Alternativa de guardar imagen en la carpeta, por si acaso.
                if (fuUserImage.HasFile)
                {

                    //Guid obj = Guid.NewGuid();
                    string fileExtension = Path.GetExtension(fuUserImage.FileName);
                    //string route = "Image/" + newUser.Username + ".png";
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("./Image/Users/") +  newUser.Username + fileExtension);
                    newUser.ImageUrl =  newUser.Username + fileExtension;

                }


                int userId = business.AddWithSP(newUser);

                string script = @"<script type='text/javascript'>alert('USER has successfully REGISTERED !'); window.location.href='http://localhost:52000/User/Login.aspx'</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);

            }
            catch (Exception ex)
            { 
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_UserName'"))
                {                 
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>"+ txtUserName.Text.Trim() + "</b> Username Already Exists, try new one... !";
                    lblMsg.CssClass = "alert alert-danger";
                    txtUserName.Text = string.Empty;
                    
                }
                else if(ex.Message.Contains("Violation of UNIQUE KEY constraint 'UQ_Users_Email'"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtEmail.Text.Trim() + "</b> Email Already Exists, try new one... !";
                    lblMsg.CssClass = "alert alert-danger";
                    txtEmail.Text = string.Empty;

                }

            }
        }

    }
}