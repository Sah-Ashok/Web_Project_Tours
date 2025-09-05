using System;
using System.Data;
using System.Data.SqlClient;

namespace Web_Project_Tours
{
    public partial class gallery_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int imageId;
                if (int.TryParse(Request.QueryString["ImageId"], out imageId))
                {
                    LoadGalleryDetails(imageId);
                    LoadRelatedImages(imageId);
                }
                else
                {
                    Response.Redirect("gallery.aspx");
                }

            }
        }

        private void LoadGalleryDetails(int imageId)
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = "SELECT TOP 1 * FROM Gallery WHERE ImageId = @ImageId AND IsActive = 1";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ImageId", imageId);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTitle.Text = dr["Title"].ToString();
                    lblCategory.Text = dr["Category"].ToString();
                    lblDate.Text = Convert.ToDateTime(dr["UploadDate"]).ToString("MMMM dd, yyyy");

                    lblDescription1.Text = dr["Description"].ToString();
                    imgMain.ImageUrl = dr["ImagePath"].ToString();
                    lnkViewFull.NavigateUrl = dr["ImagePath"].ToString();
                }
                else
                {
                    Response.Redirect("gallery.aspx");
                }
            }
        }

        private void LoadRelatedImages(int imageId)
        {
            string category = "";

  
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string catQuery = "SELECT Category FROM Gallery WHERE ImageId = @ImageId";
                SqlCommand catCmd = new SqlCommand(catQuery, con);
                catCmd.Parameters.AddWithValue("@ImageId", imageId);

                object result = catCmd.ExecuteScalar();
                if (result != null)
                {
                    category = result.ToString();
                }
            }

      
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = @"SELECT TOP 6 ImageId, Title, Description, ImagePath, Category 
                         FROM Gallery 
                         WHERE IsActive = 1 AND ImageId <> @ImageId AND Category = @Category
                         ORDER BY NEWID()";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ImageId", imageId);
                cmd.Parameters.AddWithValue("@Category", category);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptRelatedImages.DataSource = dt;
                rptRelatedImages.DataBind();
            }
        }

    }
}
