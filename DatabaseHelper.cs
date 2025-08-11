using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Web_Project_Tours
{
	public class DatabaseHelper
	{
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            return con;
        }
    }
}