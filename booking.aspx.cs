using System;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Web_Project_Tours
{
    public partial class booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int tourId;
                if (!int.TryParse(Request.QueryString["Tour"], out tourId) || tourId <= 0)
                {
                    Response.Redirect("tours.aspx");
                    return;
                }
                LoadTourDetails(tourId);
            }
        }

        private int GetNumberFromString(string input)
        {
            Match match = Regex.Match(input, @"\d+");
            if (match.Success)
            {
                return Convert.ToInt16(match.Value); 
            }
            return 0;
        }
        private void LoadTourDetails(int tourId)
        {
            var indianCulture = new CultureInfo("en-IN");
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = "SELECT * FROM Tours WHERE Id = @TourID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TourID", tourId);


                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTitle.Text = reader["Title"]?.ToString() ?? "N/A";

                            int durationDays = reader["DurationDays"] != DBNull.Value ? Convert.ToInt32(reader["DurationDays"]) : 0;
                            lblDuration.Text = durationDays > 0 ? $"{durationDays} Days / {durationDays - 1} Nights" : "N/A";
                            lblDurationOnly.Text = durationDays > 0 ? $"{durationDays} Days" : "N/A";


                            lblLocation.Text = reader["TourHighlights"].ToString();


                            imgTour.ImageUrl = reader["ImagePath"]?.ToString();

                            decimal basePrice = reader["Price"] != DBNull.Value ? Convert.ToDecimal(reader["Price"]) : 0;
                            lblBasePrice.Text = basePrice.ToString("C0", indianCulture);

                            // Static prices for now
                            decimal insurance = 178m;
                            decimal transfer = 90m;
                            decimal taxes = 156m;

                            lblTravelInsurance.Text = insurance.ToString("C0", indianCulture);
                            lblAirportTransfer.Text = transfer.ToString("C0", indianCulture);
                            lblTaxesFees.Text = taxes.ToString("C0", indianCulture);

                            decimal total = basePrice + insurance + transfer + taxes;
                            lblTotalAmount.Text = total.ToString("C0", indianCulture);

                            // Default values
                            lblDeparture.Text = "Select dates";
                            //lblTravelers.Text = "2 Adults";
                        }
                        else
                        {
                            Response.Redirect("tours.aspx");
                        }
                    }
                }
            }
        }


        protected void btnCompleteBooking_Click(object sender, EventArgs e)
        {

        }
    }
}
