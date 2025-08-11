using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Project_Tours
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["isAuth"] != null)
            {
                string isAuthValue = Request.QueryString["isAuth"];
                if(isAuthValue == "false")
                {
                    lblMessage.Text = "You have been logged out successfully.";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string Email = txtEmail.Text.Trim();
            string Password = txtPassword.Text.Trim();
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Id, FullName, Email FROM Users WHERE Email = '"+Email+"' AND Password = '"+Password+"'",
                    con
                );

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read()) 
                {
                    Session["UserID"] = dr["Id"].ToString();
                    Session["FullName"] = dr["FullName"].ToString();
                    Session["UserEmail"] = dr["Email"].ToString();
                    Session["isLogin"] = true;

                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password!";
                }
            }
        }
    }
}