using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Threading.Tasks;


namespace Tours_Travels
{
    public partial class bookingConfirmation : System.Web.UI.Page
    {
        
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        private SqlConnection con;
        private SqlCommand cmd;

        // API BASE
        private decimal PricePerPerson
        {
            get => ViewState["PricePerPerson"] != null ? (decimal)ViewState["PricePerPerson"] : 0;
            set => ViewState["PricePerPerson"] = value;
        }

        private int MaxGroupSize
        {
            get => ViewState["MaxGroupSize"] != null ? (int)ViewState["MaxGroupSize"] : 0;
            set => ViewState["MaxGroupSize"] = value;
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["UserId"] == null)
                {
                    try
                    {
                        Session["LoginMessage"] = "Please Login to Book Your Destinations";
                        Response.Redirect("Login.aspx");
                    }
                    catch (System.Threading.ThreadAbortException)
                    {
                        // This exception is automatically thrown by Response.Redirect
                        // We can safely ignore it because redirection has already occurred
                    }
                    return;
                }


                // Check destination ID
                if (Request.QueryString["id"] != null)
                {
                    string destId = Request.QueryString["id"];
                    await LoadDestinationDetailsAsync(destId);
                    GetBookingUserDetails();
                }
                else
                {
                    Response.Redirect("Destination.aspx");
                }
            }
        }

        private void GetCon()
        {
            con = new SqlConnection(connectionString);
            con.Open();
        }

        // 🔹 Now uses centralized API method
        private async Task LoadDestinationDetailsAsync(string destinationId)
        {
            try
            {
                var destination = await APIs.GetDestinationById(destinationId);

                if (destination != null)
                {
                    int days = int.TryParse(destination.Duration, out int d) ? d : 0;
                    lblDestName.Text = destination.Name;
                    lblDuration.Text = $"{days} Days / {days - 1} Nights";
                    imgDest.ImageUrl = destination.MainImage;

                    MaxGroupSize = int.TryParse(destination.GroupSize, out int size) ? size : 0;

                    PricePerPerson = destination.Price;
                    lblPricePerPerson.Text = string.Format("₹{0:N0} / person", destination.Price);

                    pnlBookingContent.Visible = true;
                    UpdateSummary();
                }
                else
                {
                    Response.Redirect("Destination.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("Destination.aspx");
            }
        }

        protected void Quantity_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string command = btn.CommandArgument;

            int adults = int.Parse(lblAdultsCount.Text);
            int children = int.Parse(lblChildrenCount.Text);

            switch (command)
            {
                case "Adults_Increment": adults++; break;
                case "Adults_Decrement": if (adults > 1) adults--; break;
                case "Children_Increment": children++; break;
                case "Children_Decrement": if (children > 0) children--; break;
            }

            lblAdultsCount.Text = adults.ToString();
            lblChildrenCount.Text = children.ToString();

            UpdateSummary();
        }

        private void UpdateSummary()
        {
            int adults = int.Parse(lblAdultsCount.Text);
            int children = int.Parse(lblChildrenCount.Text);
            decimal childrenPrice = PricePerPerson / 2;
            decimal total = (adults * PricePerPerson) + (children * childrenPrice);

            lblSummaryDetails.Text = $@"
                <div class='flex justify-between items-center'>
                    <span class='text-text-light'>Adults ({adults} x ₹{PricePerPerson:N0})</span>
                    <span class='font-semibold'>₹{(adults * PricePerPerson):N0}</span>
                </div>
                <div class='flex justify-between items-center'>
                    <span class='text-text-light'>Children ({children} x ₹{childrenPrice:N0})</span>
                    <span class='font-semibold'>₹{(children * childrenPrice):N0}</span>
                </div>
                <div class='border-t my-3'></div>
                <div class='flex justify-between items-center font-bold text-2xl text-midnight-green'>
                    <span>Total</span>
                    <span>₹{total:N0}</span>
                </div>";
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtFirstName.Text) || string.IsNullOrEmpty(txtLastName.Text) ||
                string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtBookingDate.Text))
            {
                lblMessage.Text = "Please fill in all required fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int adults = int.Parse(lblAdultsCount.Text);
            int children = int.Parse(lblChildrenCount.Text);
            int totalTravelers = adults + children;

            if (totalTravelers > MaxGroupSize)
            {
                lblMessage.Text = $"Total travelers ({totalTravelers}) exceeds the maximum group size of {MaxGroupSize}.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string destinationId = Request.QueryString["id"];
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string travelDate = txtBookingDate.Text;
            decimal childrenPrice = PricePerPerson / 2;
            decimal totalAmount = (adults * PricePerPerson) + (children * childrenPrice);

            GetCon();
            string query = "INSERT INTO Bookings (UserId, DestinationId, TravelerFirstName, TravelerLastName, TravelerEmail, TravelerPhone, TravelDate, NumberOfAdults, NumberOfChildren, TotalAmount) " +
                           "VALUES (@UserId, @DestinationId, @FName, @LName, @Email, @Phone, @Date, @Adults, @Children, @Amount)";

            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@DestinationId", destinationId);
            cmd.Parameters.AddWithValue("@FName", firstName);
            cmd.Parameters.AddWithValue("@LName", lastName);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@Date", travelDate);
            cmd.Parameters.AddWithValue("@Adults", adults);
            cmd.Parameters.AddWithValue("@Children", children);
            cmd.Parameters.AddWithValue("@Amount", totalAmount);

            int rows = cmd.ExecuteNonQuery();
            con.Close();

            if (rows > 0)
            {
                SendBookingEmails(firstName, lastName, email, travelDate, adults, children, totalAmount);
                lblMessage.Text = "Booking confirmed! A confirmation email has been sent.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("ThankYou.aspx");
            }
            else
            {
                lblMessage.Text = "Error while booking your destination.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void SendBookingEmails(string firstName, string lastName, string email, string travelDate, int adults, int children, decimal totalAmount)
        {
            string loggedInUserEmail = Session["Email"].ToString();
            string loggedInUserFirstName = Session["FirstName"].ToString();
            string travelerEmail = email;

            EmailService emailService = new EmailService();

            if (loggedInUserEmail.Equals(travelerEmail, StringComparison.OrdinalIgnoreCase))
            {
                string subject = "Your Booking Confirmation & Receipt - Exploria";
                string body = GetCombinedEmailBody(firstName, lastName, lblDestName.Text, travelDate, adults, children, totalAmount);
                emailService.SendEmail(travelerEmail, subject, body);
            }
            else
            {
                string travelerSubject = "Your Upcoming Trip with Exploria!";
                string travelerBody = GetTravelerEmailBody(firstName, lastName, lblDestName.Text, travelDate, adults, children, loggedInUserFirstName);
                emailService.SendEmail(travelerEmail, travelerSubject, travelerBody);

                string bookerSubject = "Booking Receipt for Your Purchase - Exploria";
                string bookerBody = GetBookerReceiptEmailBody(loggedInUserFirstName, firstName, lastName, lblDestName.Text, travelDate, totalAmount);
                emailService.SendEmail(loggedInUserEmail, bookerSubject, bookerBody);
            }
        }

        // Load user details
        public void GetBookingUserDetails()
        {
            if (Session["UserID"] != null)
            {
                GetCon();
                string query = "SELECT FirstName, LastName, Email, Phone FROM Users WHERE Id = @UserId";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", Session["UserID"]);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtFirstName.Text = reader["FirstName"].ToString();
                    txtLastName.Text = reader["LastName"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["Phone"].ToString();
                }
                con.Close();
            }
        }

        // EMAIL TEMPLATE HELPERS
        private string GetBaseEmailTemplate(string title, string content)
        {
            return $@"
                <div style='font-family: Arial; line-height: 1.6; color: #333; max-width: 600px; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px;'>
                    <div style='background-color: #073b3a; color: white; padding: 20px; text-align: center;'>
                        <h1>Exploria</h1>
                    </div>
                    <div style='padding: 25px;'>
                        <h2 style='color: #0b6e4f;'>{title}</h2>
                        {content}
                        <p style='margin-top: 25px;'>Best regards,<br/><b>The Exploria Team</b></p>
                    </div>
                    <div style='background-color: #f7f7f7; color: #777; padding: 15px; text-align: center; font-size: 12px;'>
                        <p>This is an automated email. Please do not reply directly.</p>
                    </div>
                </div>";
        }

        private string GetCombinedEmailBody(string fName, string lName, string destName, string travelDate, int adults, int children, decimal total)
        {
            string content = $@"
                <p>Dear {fName} {lName},</p>
                <p>Thank you for your booking! Here’s your trip summary:</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                    <p><strong>Travelers:</strong> {adults} Adults, {children} Children</p>
                    <p><strong>Total Amount:</strong> ₹{total:N0}</p>
                </div>";
            return GetBaseEmailTemplate("Booking Confirmed!", content);
        }

        private string GetTravelerEmailBody(string fName, string lName, string destName, string travelDate, int adults, int children, string bookerName)
        {
            string content = $@"
                <p>Dear {fName} {lName},</p>
                <p>Your trip has been booked by <strong>{bookerName}</strong>.</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                    <p><strong>Travelers:</strong> {adults} Adults, {children} Children</p>
                </div>";
            return GetBaseEmailTemplate("Your Trip Confirmation", content);
        }

        private string GetBookerReceiptEmailBody(string bookerName, string travelerFName, string travelerLName, string destName, string travelDate, decimal total)
        {
            string content = $@"
                <p>Dear {bookerName},</p>
                <p>You’ve successfully booked a trip for <strong>{travelerFName} {travelerLName}</strong>.</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                    <p><strong>Total Amount Paid:</strong> ₹{total:N0}</p>
                </div>";
            return GetBaseEmailTemplate("Booking Receipt", content);
        }
    }
}
