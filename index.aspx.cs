using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Project_Tours
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFeatures();
                BindTours();
            }

        }

        public void BindFeatures()
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = "SELECT * FROM features ORDER BY Id";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();

                da.Fill(dt);

                rptFeatures.DataSource = dt;
                rptFeatures.DataBind();

            }
        }

        public void BindTours()
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {

                string query = "SELECT * FROM Tours ORDER BY Id";  
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();

                da.Fill(dt);

                rptTours.DataSource = dt;
                rptTours.DataBind();
            }
        }


        protected string GetHighlightsHtml(object highlightsObj)
        {
            if (highlightsObj == null) return "";
            var highlights = highlightsObj.ToString().Split(',');

            var spans = highlights.Select(h => $"<span>{h.Trim()}</span>");
            return string.Join(" ", spans);
        }

        protected string GetRatingStars(decimal rating)
        {
            int fullStars = (int)Math.Floor(rating);
            bool halfStar = (rating - fullStars) >= 0.5m;
            int emptyStars = 5 - fullStars - (halfStar ? 1 : 0);

            var html = new System.Text.StringBuilder();

            for (int i = 0; i < fullStars; i++)
                html.Append("<i class='bi bi-star-fill'></i>");
            if (halfStar)
                html.Append("<i class='bi bi-star-half'></i>");
            for (int i = 0; i < emptyStars; i++)
                html.Append("<i class='bi bi-star'></i>");

            return html.ToString();
        }
    }
}