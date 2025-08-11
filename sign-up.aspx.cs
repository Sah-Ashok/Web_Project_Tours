using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Web_Project_Tours
{
	public partial class sign_up : System.Web.UI.Page
	{
		
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Users (FullName, Email, Phone, Password, Countries) VALUES (@FullName, @Email, @Phone, @Password, @Countries)",
                    con
                );

                cmd.Parameters.AddWithValue("@FullName", FullName.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                cmd.Parameters.AddWithValue("@Phone", Phone.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@Countries", Countries.SelectedValue);

                cmd.ExecuteNonQuery();
            }

        }
    }
}