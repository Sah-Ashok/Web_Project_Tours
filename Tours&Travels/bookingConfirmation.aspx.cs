using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using Tours_Travels.Services;
using Razorpay.Api;
using System.Web.UI;

namespace Tours_Travels
{
    public partial class bookingConfirmation : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        private SqlConnection con;
        private SqlCommand cmd;

        private const string RazorpayKeyId = "rzp_test_RH6BCRHYRKNmRY";
        private const string RazorpayKeySecret = "gJ4Kqbjukx9CihPEBJgoDfhM";

        private const decimal INSURANCE_PER_PERSON = 50m;
        private const decimal TAX_RATE = 0.10m;

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
        private decimal RoomUpgradeCost
        {
            get => ViewState["RoomUpgradeCost"] != null ? (decimal)ViewState["RoomUpgradeCost"] : 0m;
            set => ViewState["RoomUpgradeCost"] = value;
        }
        private decimal MealUpgradeCost
        {
            get => ViewState["MealUpgradeCost"] != null ? (decimal)ViewState["MealUpgradeCost"] : 0m;
            set => ViewState["MealUpgradeCost"] = value;
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    try
                    {
                        Session["LoginMessage"] = "Please Login to Book Your Destinations";
                        Response.Redirect("Login.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    catch (System.Threading.ThreadAbortException) { }
                    return;
                }

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

        private async Task LoadDestinationDetailsAsync(string destinationId)
        {
            try
            {
                var destination = await APIs.GetDestinationById(destinationId);
                if (destination != null)
                {
                    int days = int.TryParse(destination.Duration, out int d) ? d : 0;
                    lblDestName.Text = destination.Name;
                    lblDuration.Text = $"{days} Days / {Math.Max(0, days - 1)} Nights";
                    imgDest.ImageUrl = destination.MainImage;
                    MaxGroupSize = int.TryParse(destination.GroupSize, out int size) ? size : 0;
                    PricePerPerson = destination.Price;
                    lblPricePerPerson.Text = string.Format("₹{0:N0} / person", destination.Price);
                    pnlBookingContent.Visible = true;
                    CalculateTotalCosts();
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

        protected void CalculateAndUpdateSummary(object sender, EventArgs e)
        {
            CalculateTotalCosts();
        }

        private void CalculateTotalCosts()
        {
            int adults = int.Parse(lblAdultsCount.Text);
            int children = int.Parse(lblChildrenCount.Text);
            int totalTravelers = adults + children;

            decimal childrenPrice = PricePerPerson / 2;
            decimal basePrice = (adults * PricePerPerson) + (children * childrenPrice);

            RoomUpgradeCost = 0m;
            string selectedRoom = rblRoomSelection.SelectedValue;
            if (string.IsNullOrEmpty(selectedRoom)) selectedRoom = "Standard Room";
            if (selectedRoom == "Deluxe Room")
                RoomUpgradeCost = 5000m;
            else if (selectedRoom == "Suite")
                RoomUpgradeCost = 12000m;

            MealUpgradeCost = 0m;
            string selectedMeal = rblMealPreference.SelectedValue;
            if (string.IsNullOrEmpty(selectedMeal)) selectedMeal = "Any";

            decimal mealUpgradeCostPerPerson = 0m;
            if (selectedMeal == "Vegan")
                mealUpgradeCostPerPerson = 800m;
            else if (selectedMeal == "Gluten-Free")
                mealUpgradeCostPerPerson = 1000m;

            int totalTravellers = adults + children;
            MealUpgradeCost = mealUpgradeCostPerPerson * totalTravellers;

            bool hasInsurance = chkTravelInsurance.Checked;
            decimal insuranceCost = hasInsurance ? totalTravellers * INSURANCE_PER_PERSON : 0;

            decimal subTotal = basePrice + RoomUpgradeCost + MealUpgradeCost + insuranceCost;
            decimal taxes = subTotal * TAX_RATE;
            decimal totalAmount = subTotal + taxes;

            lblBookingForName.Text = rblBookingFor.SelectedValue;
            lblMealPreferenceName.Text = selectedMeal;
            lblRoomSelectionName.Text = selectedRoom;

            lblTravelerSummary.Text = $"{adults} Adult(s), {children} Child(ren)";
            lblBasePriceSummary.Text = $"₹{basePrice:N0}";

            lblRoomUpgradeSummary.Text = $"{selectedRoom} - {(RoomUpgradeCost > 0 ? $"₹{RoomUpgradeCost:N0}" : "₹0")}";
            lblMealUpgradeSummary.Text = $"{selectedMeal} - {(MealUpgradeCost > 0 ? $"₹{MealUpgradeCost:N0}" : "₹0")}";

            lblInsuranceSummary.Text = hasInsurance ? $"₹{insuranceCost:N0}" : "Not Added";
            lblTaxesSummary.Text = $"₹{taxes:N0}";
            lblTotalSummary.Text = $"₹{totalAmount:N0}";
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
            CalculateAndUpdateSummary(sender, e);
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            // Basic validation
            if (string.IsNullOrEmpty(txtFirstName.Text) ||
                string.IsNullOrEmpty(txtLastName.Text) ||
                string.IsNullOrEmpty(txtEmail.Text) ||
                string.IsNullOrEmpty(txtBookingDate.Text))
            {
                lblMessage.Text = "Please fill in all required fields.";
                return;
            }

            CalculateTotalCosts();

            int adults = int.Parse(lblAdultsCount.Text);
            int children = int.Parse(lblChildrenCount.Text);
            int totalTravelers = adults + children;

            if (totalTravelers > MaxGroupSize)
            {
                lblMessage.Text = $"Total travelers ({totalTravelers}) exceeds the maximum group size of {MaxGroupSize}.";
                return;
            }

            // Recalculate amounts
            decimal basePrice = (adults * PricePerPerson) + (children * (PricePerPerson / 2));
            decimal roomUpgradeCost = RoomUpgradeCost;
            decimal mealUpgradeCost = MealUpgradeCost;
            bool hasInsurance = chkTravelInsurance.Checked;
            decimal insuranceCost = hasInsurance ? totalTravelers * INSURANCE_PER_PERSON : 0;

            decimal subTotal = basePrice + roomUpgradeCost + mealUpgradeCost + insuranceCost;
            decimal taxes = subTotal * TAX_RATE;
            decimal totalAmount = subTotal + taxes;

            // Round amount in rupees for storage and Razorpay service (Razorpay service converts to paise)
            int totalAmountRounded = (int)Math.Round(totalAmount);

            // Razorpay single-order limit check (₹10,00,000)
            if (totalAmountRounded > 1000000)
            {
                lblMessage.Text = "Amount exceeds Razorpay single transaction limit (₹10,00,000). Please contact support or split payment.";
                return;
            }

            // Collect inputs
            string mealPreference = rblMealPreference.SelectedValue;
            string roomSelection = rblRoomSelection.SelectedValue;
            string specialRequests = txtSpecialRequests.Text.Trim();
            string bookingFor = rblBookingFor.SelectedValue;
            string passportNumber = txtPassportNumber.Text.Trim();
            string passportExpiry = txtPassportExpiry.Text.Trim();
            string city = txtCity.Text.Trim();
            string country = txtCountry.Text.Trim();
            string ticketEmail = txtTicketEmail.Text.Trim();

            int userId = Convert.ToInt32(Session["UserID"]);
            string destinationId = Request.QueryString["id"];

            SqlTransaction transaction = null;
            int bookingId = 0;
            string orderId = string.Empty;

            try
            {
                // STEP 1 - Create Razorpay Order (amount in rupees passed; service will convert)
                RazorpayService razorpayService = new RazorpayService(RazorpayKeyId, RazorpayKeySecret);
                Order order = razorpayService.CreateOrder(totalAmountRounded); // service should multiply by 100 internally and validate
                orderId = order["id"].ToString();

                // STEP 2 - Insert Booking and Payment inside a transaction
                GetCon();
                transaction = con.BeginTransaction();

                string bookingQuery = @"
                    INSERT INTO Bookings
                    (UserId, DestinationId, TravelerFirstName, TravelerLastName, TravelerEmail, TravelerPhone,
                     TravelDate, NumberOfAdults, NumberOfChildren, TotalAmount, MealPreference, RoomSelection,
                     SpecialRequests, TravelInsurance, InsuranceCost, Taxes, RoomUpgradeCost, MealUpgradeCost,
                     BookingFor, PassportNumber, PassportExpiry, TravelerCity, TravelerCountry, TicketEmail, OrderId, BookingStatus)
                    OUTPUT INSERTED.BookingId
                    VALUES
                    (@UserId, @DestinationId, @FName, @LName, @Email, @Phone, @Date, @Adults, @Children,
                     @Amount, @Meal, @Room, @Requests, @HasInsurance, @InsuranceCost, @Taxes, @RoomUpgradeCost, @MealUpgradeCost,
                     @BookingFor, @PassportNumber, @PassportExpiry, @City, @Country, @TicketEmail, @OrderId, @BookingStatus)";

                cmd = new SqlCommand(bookingQuery, con, transaction);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@DestinationId", destinationId ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@FName", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LName", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                // TravelDate column is DATE - attempt to parse & set properly
                if (DateTime.TryParse(txtBookingDate.Text.Trim(), out DateTime travelDate))
                    cmd.Parameters.AddWithValue("@Date", travelDate.Date);
                else
                    cmd.Parameters.AddWithValue("@Date", DBNull.Value);

                cmd.Parameters.AddWithValue("@Adults", adults);
                cmd.Parameters.AddWithValue("@Children", children);
                cmd.Parameters.AddWithValue("@Amount", totalAmountRounded);
                cmd.Parameters.AddWithValue("@Meal", string.IsNullOrEmpty(mealPreference) ? (object)DBNull.Value : mealPreference);
                cmd.Parameters.AddWithValue("@Room", string.IsNullOrEmpty(roomSelection) ? (object)DBNull.Value : roomSelection);
                cmd.Parameters.AddWithValue("@Requests", string.IsNullOrEmpty(specialRequests) ? (object)DBNull.Value : specialRequests);
                cmd.Parameters.AddWithValue("@HasInsurance", hasInsurance);
                cmd.Parameters.AddWithValue("@InsuranceCost", insuranceCost);
                cmd.Parameters.AddWithValue("@Taxes", taxes);
                cmd.Parameters.AddWithValue("@RoomUpgradeCost", roomUpgradeCost);
                cmd.Parameters.AddWithValue("@MealUpgradeCost", mealUpgradeCost);
                cmd.Parameters.AddWithValue("@BookingFor", string.IsNullOrEmpty(bookingFor) ? (object)DBNull.Value : bookingFor);
                cmd.Parameters.AddWithValue("@PassportNumber", string.IsNullOrEmpty(passportNumber) ? (object)DBNull.Value : passportNumber);
                if (DateTime.TryParse(passportExpiry, out DateTime passportExpDt))
                    cmd.Parameters.AddWithValue("@PassportExpiry", passportExpDt.Date);
                else
                    cmd.Parameters.AddWithValue("@PassportExpiry", DBNull.Value);

                cmd.Parameters.AddWithValue("@City", string.IsNullOrEmpty(city) ? (object)DBNull.Value : city);
                cmd.Parameters.AddWithValue("@Country", string.IsNullOrEmpty(country) ? (object)DBNull.Value : country);
                cmd.Parameters.AddWithValue("@TicketEmail", string.IsNullOrEmpty(ticketEmail) ? (object)DBNull.Value : ticketEmail);
                cmd.Parameters.AddWithValue("@OrderId", orderId);
                cmd.Parameters.AddWithValue("@BookingStatus", "Pending"); // must be one of the allowed values in CK_Bookings_Status

                bookingId = Convert.ToInt32(cmd.ExecuteScalar());

                // Payment insert
                string paymentQuery = @"
                    INSERT INTO Payments (UserId, BookingId, OrderId, Amount, Status)
                    VALUES (@UserId, @BookingId, @OrderId, @Amount, @Status)";

                SqlCommand paymentCmd = new SqlCommand(paymentQuery, con, transaction);
                paymentCmd.Parameters.AddWithValue("@UserId", userId);
                paymentCmd.Parameters.AddWithValue("@BookingId", bookingId);
                paymentCmd.Parameters.AddWithValue("@OrderId", orderId);
                paymentCmd.Parameters.AddWithValue("@Amount", totalAmountRounded);
                paymentCmd.Parameters.AddWithValue("@Status", "OrderCreated"); // Payment status for internal tracking
                paymentCmd.ExecuteNonQuery();

                transaction.Commit();
                con.Close();

                // Optionally notify user that booking created and payment pending
                SendBookingEmails(txtFirstName.Text.Trim(), txtLastName.Text.Trim(), txtEmail.Text.Trim(),
                                  txtBookingDate.Text.Trim(), adults, children, basePrice, insuranceCost, taxes, totalAmount, roomUpgradeCost, mealUpgradeCost);

                // STEP 3 - Open Razorpay Checkout (amount in paise)
                string script = $@"
                    launchRazorpay({{
                        key: '{RazorpayKeyId}',
                        amount: {totalAmountRounded * 100},
                        order_id: '{orderId}',
                        name: 'Exploria Tours & Travels',
                        description: 'Booking: {lblDestName.Text}',
                        prefill: {{
                            name: '{txtFirstName.Text.Trim()} {txtLastName.Text.Trim()}',
                            email: '{txtEmail.Text.Trim()}',
                            contact: '{txtPhone.Text.Trim()}'
                        }},
                        callback_url: 'PaymentVerificationSuccess.aspx?bookingId={bookingId}'
                    }});";

                ScriptManager.RegisterStartupScript(
                    UpdatePanelBooking,
                    this.GetType(),
                    "RazorpayCheckoutScript",
                    script,
                    true
                );
            }
            catch (Exception ex)
            {
                try
                {
                    transaction?.Rollback();
                }
                catch { /* ignore rollback error */ }

                try
                {
                    if (con != null && con.State == System.Data.ConnectionState.Open)
                        con.Close();
                }
                catch { }

                lblMessage.Text = $"System error. Details: {ex.Message}";
            }
        }

        private void SendBookingEmails(string firstName, string lastName, string email, string travelDate, int adults, int children, decimal basePrice, decimal insuranceCost, decimal taxes, decimal totalAmount, decimal roomUpgradeCost, decimal mealUpgradeCost)
        {
            try
            {
                string loggedInUserEmail = Session["Email"]?.ToString() ?? string.Empty;
                string loggedInUserFirstName = Session["FirstName"]?.ToString() ?? string.Empty;
                string travelerEmail = email;
                EmailService emailService = new EmailService();
                var costDetails = new { BasePrice = basePrice, RoomUpgrade = roomUpgradeCost, MealUpgrade = mealUpgradeCost, Insurance = insuranceCost, Taxes = taxes, Total = totalAmount };

                if (!string.IsNullOrEmpty(loggedInUserEmail) && loggedInUserEmail.Equals(travelerEmail, StringComparison.OrdinalIgnoreCase))
                {
                    string subject = "Your Booking Order Created - Exploria";
                    string body = GetCombinedEmailBody(firstName, lastName, lblDestName.Text, travelDate, adults, children, costDetails);
                    emailService.SendEmail(travelerEmail, subject, body);
                }
                else
                {
                    if (!string.IsNullOrEmpty(travelerEmail))
                    {
                        string travelerSubject = "Your Upcoming Trip with Exploria!";
                        string travelerBody = GetTravelerEmailBody(firstName, lastName, lblDestName.Text, travelDate, adults, children, loggedInUserFirstName);
                        emailService.SendEmail(travelerEmail, travelerSubject, travelerBody);
                    }

                    if (!string.IsNullOrEmpty(loggedInUserEmail))
                    {
                        string bookerSubject = "Booking Order Created - Exploria";
                        string bookerBody = GetBookerReceiptEmailBody(loggedInUserFirstName, firstName, lastName, lblDestName.Text, travelDate, costDetails);
                        emailService.SendEmail(loggedInUserEmail, bookerSubject, bookerBody);
                    }
                }
            }
            catch
            {
                // swallow email errors to avoid breaking booking flow
            }
        }

        public void GetBookingUserDetails()
        {
            if (Session["UserID"] != null)
            {
                try
                {
                    GetCon();
                    string query = "SELECT FirstName, LastName, Email, Phone FROM Users WHERE Id = @UserId";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserID"]);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtFirstName.Text = reader["FirstName"].ToString();
                            txtLastName.Text = reader["LastName"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPhone.Text = reader["Phone"].ToString();
                        }
                    }
                }
                catch
                {
                    // ignore
                }
                finally
                {
                    try { if (con != null && con.State == System.Data.ConnectionState.Open) con.Close(); } catch { }
                }
            }
        }

        private string GetBaseEmailTemplate(string title, string content)
        {
            return $@"
                <div style='font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px; overflow: hidden;'>
                    <div style='background-color: #073b3a; color: white; padding: 20px; text-align: center;'>
                        <h1 style='margin:0; font-size: 28px;'>Exploria</h1>
                    </div>
                    <div style='padding: 25px;'>
                        <h2 style='color: #0b6e4f; margin-top:0;'>{title}</h2>
                        {content}
                        <p style='margin-top: 25px;'>Best regards,<br/><b>The Exploria Team</b></p>
                    </div>
                    <div style='background-color: #f7f7f7; color: #777; padding: 15px; text-align: center; font-size: 12px;'>
                        <p style='margin:0;'>This is an automated email. Please do not reply directly.</p>
                    </div>
                </div>";
        }

        private string GetCostDetailsHtml(dynamic costDetails)
        {
            return $@"
                <div style='border: 1px solid #eee; border-radius: 5px; padding: 15px; margin-top: 15px;'>
                    <h3 style='margin-top:0; color:#0b6e4f;'>Cost Breakdown</h3>
                    <p style='display:flex; justify-content:space-between;'><span>Base Price:</span> <strong>₹{costDetails.BasePrice:N0}</strong></p>
                    <p style='display:flex; justify-content:space-between;'><span>Room Upgrade:</span> <strong>₹{costDetails.RoomUpgrade:N0}</strong></p>
                    <p style='display:flex; justify-content:space-between;'><span>Meal Upgrade:</span> <strong>₹{costDetails.MealUpgrade:N0}</strong></p>
                    <p style='display:flex; justify-content:space-between;'><span>Insurance:</span> <strong>₹{costDetails.Insurance:N0}</strong></p>
                    <p style='display:flex; justify-content:space-between;'><span>Taxes & Fees:</span> <strong>₹{costDetails.Taxes:N0}</strong></p>
                    <hr style='border:none; border-top: 1px solid #ddd; margin: 10px 0;'/>
                    <p style='display:flex; justify-content:space-between; font-size: 1.2em;'><strong>Total Amount:</strong> <strong>₹{costDetails.Total:N0}</strong></p>
                </div>";
        }

        private string GetCombinedEmailBody(string fName, string lName, string destName, string travelDate, int adults, int children, dynamic costDetails)
        {
            string content = $@"
                <p>Dear {fName} {lName},</p>
                <p>Thank you for initiating your booking! Here’s your complete trip summary:</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                    <p><strong>Travelers:</strong> {adults} Adult(s), {children} Child(ren)</p>
                </div>
                {GetCostDetailsHtml(costDetails)}
                <p style='color:red;'>Your payment is pending. Please check the website to complete payment.</p>";
            return GetBaseEmailTemplate("Booking Order Created", content);
        }

        private string GetTravelerEmailBody(string fName, string lName, string destName, string travelDate, int adults, int children, string bookerName)
        {
            string content = $@"
                <p>Dear {fName} {lName},</p>
                <p>Your trip to <strong>{destName}</strong> has been initiated by <strong>{bookerName}</strong>.</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                    <p><strong>Number of Travelers:</strong> {adults} Adult(s), {children} Child(ren)</p>
                </div>
                <p>Get ready for an amazing adventure! (Payment status: Pending)</p>";
            return GetBaseEmailTemplate("Your Upcoming Trip Details", content);
        }

        private string GetBookerReceiptEmailBody(string bookerName, string travelerFName, string travelerLName, string destName, string travelDate, dynamic costDetails)
        {
            string content = $@"
                <p>Dear {bookerName},</p>
                <p>Thank you for creating a booking order for <strong>{travelerFName} {travelerLName}</strong>.</p>
                <p>Here is your order summary:</p>
                <div style='border-top: 1px solid #eee; margin-top: 20px; padding-top: 20px;'>
                    <p><strong>Destination:</strong> {destName}</p>
                    <p><strong>Travel Date:</strong> {travelDate}</p>
                </div>
                {GetCostDetailsHtml(costDetails)}
                <p style='color:red;'>Please complete the payment process on the website to confirm the booking.</p>";
            return GetBaseEmailTemplate("Your Booking Order Summary", content);
        }
    }
}
