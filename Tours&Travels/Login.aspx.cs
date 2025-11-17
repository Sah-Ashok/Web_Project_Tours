using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Tours_Travels
{
    public partial class Login : System.Web.UI.Page
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
            if (Session["LoginMessage"] != null)
            {
                lblMessage.Text = Session["LoginMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Session.Remove("LoginMessage");
            }
            if (Session["ResetMessage"] != null)
            {
                lblMessage.Text = Session["ResetMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Session.Remove("ResetMessage");
            }

        }
      
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            if(txtEmail.Text == "" || txtPassword.Text == "")
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GetCon();
            string query = "select * from users where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["UserID"] = dr["Id"].ToString();
                Session["FirstName"] = dr["FirstName"].ToString();
                Session["LastName"] = dr["LastName"].ToString();
                Session["Email"] = dr["Email"].ToString();
                Session["Role"] = dr["Role"].ToString();
                Response.Redirect("Home.aspx");

            }
            else
            {
                lblMessage.Text = "Invalid Email or Password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}