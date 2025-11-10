using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class MyBookings : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        private List<ModelDest> allDestinations = new List<ModelDest>();

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                try
                {
                    Session["LoginMessage"] = "Please Login to See Your Bookings";
                    Response.Redirect("Login.aspx");
                }
                catch (System.Threading.ThreadAbortException)
                {
                    // safe to ignore
                }
                return;
            }

            if (!IsPostBack)
            {
                await GetUserBookingsAsync();
            }
        }

        private async Task GetUserBookingsAsync()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            // Step 1: Fetch all destinations from API
            try
            {
                allDestinations = await APIs.GetDestinations();
            }
            catch (Exception ex)
            {
                // Handle API failure gracefully
                pnlBookings.Visible = false;
                pnlNoBookings.Visible = true;
                return;
            }

            // Step 2: Fetch bookings from SQL
            GetCon();
            string query = @"
                SELECT
                    B.BookingId AS BookingId, B.TravelDate, B.NumberOfAdults, B.NumberOfChildren,
                    B.TotalAmount, B.BookingStatus, B.TravelerFirstName, B.TravelerLastName,
                    B.TravelerPhone, B.TravelerEmail, B.DestinationId
                FROM Bookings B
                WHERE B.UserId = @UserId
                ORDER BY B.TravelDate DESC";

            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            // Step 3: Merge Booking + Destination (from API)
            var mergedData = from DataRow row in dt.Rows
                             let dest = allDestinations.FirstOrDefault(d => d.Id == row["DestinationId"].ToString())
                             select new
                             {
                                 BookingId = row["BookingId"],
                                 TravelDate = Convert.ToDateTime(row["TravelDate"]),
                                 NumberOfAdults = row["NumberOfAdults"],
                                 NumberOfChildren = row["NumberOfChildren"],
                                 TotalAmount = row["TotalAmount"],
                                 BookingStatus = row["BookingStatus"],
                                 TravelerFirstName = row["TravelerFirstName"],
                                 TravelerLastName = row["TravelerLastName"],
                                 TravelerPhone = row["TravelerPhone"],
                                 TravelerEmail = row["TravelerEmail"],
                                 DestinationId = row["DestinationId"],
                                 DestinationName = dest?.Name ?? "Unknown",
                                 MainImage = dest?.MainImage ?? "",
                                 Duration = dest?.Duration ?? "0"
                             };

            // Step 4: Bind data
            if (mergedData.Any())
            {
                pnlBookings.Visible = true;
                pnlNoBookings.Visible = false;
                rptBookings.DataSource = mergedData;
                rptBookings.DataBind();
            }
            else
            {
                pnlBookings.Visible = false;
                pnlNoBookings.Visible = true;
            }
        }

        protected void rptBookings_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus = e.Item.FindControl("lblStatus") as Label;
                Label lblReturnDate = e.Item.FindControl("lblReturnDate") as Label;
                LinkButton btnCancel = e.Item.FindControl("btnCancel") as LinkButton;

                dynamic data = e.Item.DataItem;
                string bookingStatus = data.BookingStatus.ToString();
                lblStatus.Text = bookingStatus;

                switch (bookingStatus.ToLower())
                {
                    case "confirmed":
                        lblStatus.CssClass = "BookingStatus-badge bg-green-100 text-green-800";
                        break;
                    case "pending":
                        lblStatus.CssClass = "BookingStatus-badge bg-yellow-100 text-yellow-800";
                        break;
                    case "cancelled":
                        lblStatus.CssClass = "BookingStatus-badge bg-red-100 text-red-800";
                        break;
                    default:
                        lblStatus.CssClass = "BookingStatus-badge bg-gray-100 text-gray-800";
                        break;
                }

                DateTime travelDate = data.TravelDate;
                int duration = int.TryParse(data.Duration.ToString(), out int d) ? d : 0;
                DateTime returnDate = travelDate.AddDays(duration);
                lblReturnDate.Text = returnDate.ToString("dd MMM, yyyy");

                if (bookingStatus.ToLower() == "cancelled" || travelDate < DateTime.Today)
                {
                    btnCancel.Visible = false;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int bookingId = Convert.ToInt32(btn.CommandArgument);

            GetCon();
            string query = "UPDATE Bookings SET BookingStatus = 'Cancelled' WHERE BookingId = @BookingId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
            cmd.ExecuteNonQuery();
            con.Close();

            // Refresh data
            GetUserBookingsAsync().GetAwaiter().GetResult();
        }
    }
}
