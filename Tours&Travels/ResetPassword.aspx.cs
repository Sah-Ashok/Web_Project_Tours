using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ResetEmail"]== null)
            {
                Response.Redirect("Login.aspx");
            }


        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            GetCon();
            string eml = Session["ResetEmail"] as string;

            if (string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtConfirmPassword.Text != txtNewPassword.Text)
            {
                lblMessage.Text = "New Password and Confirm Password do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string query = "update users set Password='" + txtNewPassword.Text + "' where Email='" + eml + "'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            Session["ResetMessage"] = "Password reset successfully. You can now log in with your new password.";
            Response.Redirect("Login.aspx");    
        }
    }
}