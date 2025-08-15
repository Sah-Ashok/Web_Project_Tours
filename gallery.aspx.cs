using System;
using System.Data.SqlClient;

namespace Web_Project_Tours
{
    public partial class gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    LoadGallerySlider();
                    LoadGalleryGrid();
                }
                catch (Exception ex)
                {
                    // Optional: log the error instead of showing to the user
                    Response.Write("<script>alert('Error loading gallery. Please try again later.');</script>");
                }
            }
        }

        private void LoadGallerySlider()
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = @"
                    SELECT ImagePath, Title, Description
                    FROM Gallery
                    WHERE IsActive = 1
                    ORDER BY DisplayOrder ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        rptSlider.DataSource = dr;
                        rptSlider.DataBind();
                    }
                }
            }
        }

        private void LoadGalleryGrid()
        {
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = @"
                    SELECT ImageId, Title, Description, ImagePath, Category AS CategoryClass
                    FROM Gallery
                    WHERE IsActive = 1
                    ORDER BY DisplayOrder ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        rptGallery.DataSource = dr;
                        rptGallery.DataBind();
                    }
                }
            }
        }
    }
}
