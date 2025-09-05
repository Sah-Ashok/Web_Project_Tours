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
        private static readonly string s = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"E:\\C# practice\\Web_Project_Tours\\App_Data\\ToursTravels.mdf\";Integrated Security=True;Connect Timeout=30";
        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(s);
            con.Open();
            return con;
        }
    }
}