using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
	public partial class AdminUserManagement : System.Web.UI.Page
	{
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
		{
            getAdminDetails();
            getUsers();

		}
		public void GetCon()
		{
            con = new SqlConnection(s);
            con.Open();
        }
        public void getAdminDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();

                string query = "SELECT SUM(TotalAmount) AS TotalRevenue, COUNT(*) AS TotalBookings FROM Bookings";

                using (SqlCommand cmd = new SqlCommand(query, con))
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        if (dr["TotalRevenue"] != DBNull.Value)
                        {
                            lblTotalRevenue.Text = Convert
                                .ToDecimal(dr["TotalRevenue"])
                                .ToString("C", new System.Globalization.CultureInfo("en-IN"));
                        }
                        else
                        {
                            lblTotalRevenue.Text = "₹0.00";
                        }

                        lblTotalBookings.Text = dr["TotalBookings"].ToString();
                    }
                }
            }
        }

        public void getUsers()
        {
            GetCon();
            string query = "select * from Users ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if(ds.Tables[0].Rows.Count > 0)
            {
                rptUsers.DataSource = ds;
                rptUsers.DataBind();
            } 
        }

    }  
}