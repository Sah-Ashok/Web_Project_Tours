using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using Tours_Travels.Services;

namespace Tours_Travels
{
    public partial class ViewBookingDetails : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        private SqlConnection con;
        private SqlCommand cmd;

        private const string RazorpayKeyId = "rzp_test_RH6BCRHYRKNmRY";
        private const string RazorpayKeySecret = "gJ4Kqbjukx9CihPEBJgoDfhM";

        private int BookingId => ViewState["BookingId"] != null ? (int)ViewState["BookingId"] : 0;
        private string PaymentId => ViewState["PaymentId"] as string ?? string.Empty;
        private int PaymentAmount => ViewState["PaymentAmount"] != null ? (int)ViewState["PaymentAmount"] : 0;
        private string PaymentStatus => ViewState["PaymentStatus"] as string ?? string.Empty;
        private DateTime TravelDate => ViewState["TravelDate"] != null ? (DateTime)ViewState["TravelDate"] : DateTime.MinValue;
        private string BookingStatus => ViewState["BookingStatus"] as string ?? string.Empty;

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bookingId"] == null && Request.QueryString["id"] == null)
                {
                    pnlBookingDetails.Visible = false;
                    pnlNotFound.Visible = true;
                    return;
                }

                string bookingIdStr = Request.QueryString["bookingId"] ?? Request.QueryString["id"];
                if (!int.TryParse(bookingIdStr, out int bookingId))
                {
                    pnlBookingDetails.Visible = false;
                    pnlNotFound.Visible = true;
                    return;
                }

                ViewState["BookingId"] = bookingId;

                await LoadBookingAndPaymentAsync(bookingId);
            }
        }

        private void GetCon()
        {
            con = new SqlConnection(connectionString);
            con.Open();
        }

        private async System.Threading.Tasks.Task LoadBookingAndPaymentAsync(int bookingId)
        {
            try
            {
                GetCon();

                string bookingQuery = $@"
                    SELECT TOP 1 *
                    FROM Bookings
                    WHERE BookingId = {bookingId}";

                cmd = new SqlCommand(bookingQuery, con);

                DataTable dtBooking = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dtBooking);
                }

                if (dtBooking.Rows.Count == 0)
                {
                    pnlBookingDetails.Visible = false;
                    pnlNotFound.Visible = true;
                    return;
                }

                DataRow row = dtBooking.Rows[0];

                var destId = row["DestinationId"]?.ToString();
                lblDateOfBooking.Text = Convert.ToDateTime(row["DateOfBooking"]).ToString("dd MMM, yyyy");
                DateTime travelDate = Convert.ToDateTime(row["TravelDate"]);
                lblTravelDate.Text = travelDate.ToString("dd MMM, yyyy");
                ViewState["TravelDate"] = travelDate;
                int adults = Convert.ToInt32(row["NumberOfAdults"]);
                int children = Convert.ToInt32(row["NumberOfChildren"]);
                lblTravelers.Text = $"{adults} Adult(s), {children} Child(ren)";
                lblRoomSelection.Text = row["RoomSelection"]?.ToString() ?? "-";
                lblMealPreference.Text = row["MealPreference"]?.ToString() ?? "-";
                lblTravelerName.Text = $"{row["TravelerFirstName"]} {row["TravelerLastName"]}";
                lblTravelerEmail.Text = row["TravelerEmail"]?.ToString() ?? "-";
                lblTravelerPhone.Text = row["TravelerPhone"]?.ToString() ?? "-";
                lblTravelerCity.Text = row["TravelerCity"]?.ToString() ?? "-";
                lblTravelerCountry.Text = row["TravelerCountry"]?.ToString() ?? "-";
                lblPassportNumber.Text = row["PassportNumber"]?.ToString() ?? "-";
                lblDateOfBooking.Text = Convert.ToDateTime(row["DateOfBooking"]).ToString("dd MMM, yyyy");
                lblTotalAmount.Text = "₹" + Convert.ToDecimal(row["TotalAmount"]).ToString("N0");
                lblStatus.Text = row["BookingStatus"]?.ToString() ?? "Pending";
                ViewState["BookingStatus"] = lblStatus.Text;

                int durationDays = 0;
                if (int.TryParse(row["RoomUpgradeCost"]?.ToString(), out int dummy)) { }
                if (!string.IsNullOrEmpty(destId))
                {
                    try
                    {
                        var dest = await APIs.GetDestinationById(destId);
                        if (dest != null)
                        {
                            lblDestinationName.Text = dest.Name;
                            int days = int.TryParse(dest.Duration, out int d) ? d : 0;
                            lblReturnDate.Text = travelDate.AddDays(days).ToString("dd MMM, yyyy");
                        }
                        else
                        {
                            lblDestinationName.Text = "Unknown";
                            lblReturnDate.Text = travelDate.ToString("dd MMM, yyyy");
                        }
                    }
                    catch
                    {
                        lblDestinationName.Text = "Unknown";
                        lblReturnDate.Text = travelDate.ToString("dd MMM, yyyy");
                    }
                }
                else
                {
                    lblDestinationName.Text = "Unknown";
                    lblReturnDate.Text = travelDate.ToString("dd MMM, yyyy");
                }

                string paymentQuery = $@"
                    SELECT TOP 1 *
                    FROM Payments
                    WHERE BookingId = {bookingId}
                    ORDER BY CreatedAt DESC, Id DESC";

                cmd = new SqlCommand(paymentQuery, con);

                DataTable dtPayment = new DataTable();
                using (SqlDataAdapter da2 = new SqlDataAdapter(cmd))
                {
                    da2.Fill(dtPayment);
                }

                string paymentId = string.Empty;
                string paymentStatus = string.Empty;
                int paymentAmount = 0;
                string orderId = string.Empty;

                if (dtPayment.Rows.Count > 0)
                {
                    DataRow prow = dtPayment.Rows[0];
                    paymentId = prow["PaymentId"]?.ToString() ?? string.Empty;
                    paymentStatus = prow["Status"]?.ToString() ?? string.Empty;
                    orderId = prow["OrderId"]?.ToString() ?? string.Empty;
                    paymentAmount = prow["Amount"] != DBNull.Value ? Convert.ToInt32(prow["Amount"]) : 0;

                    lblPaymentStatus.Text = paymentStatus;
                    lblOrderId.Text = orderId;
                    lblPaymentId.Text = paymentId;
                }
                else
                {
                    lblPaymentStatus.Text = "No Payment Found";
                    lblOrderId.Text = "-";
                    lblPaymentId.Text = "-";
                }

                ViewState["PaymentId"] = paymentId;
                ViewState["PaymentAmount"] = paymentAmount;
                ViewState["PaymentStatus"] = paymentStatus;

                bool canCancel = CheckCancellationEligibility(travelDate, lblStatus.Text, paymentStatus, paymentId);

                btnCancelBooking.Visible = canCancel;
                pnlBookingDetails.Visible = true;
                pnlNotFound.Visible = false;
            }
            catch (Exception ex)
            {
                pnlBookingDetails.Visible = false;
                pnlNotFound.Visible = true;
            }
            finally
            {
                try { if (con != null && con.State == ConnectionState.Open) con.Close(); } catch { }
            }
        }

        private bool CheckCancellationEligibility(DateTime travelDate, string bookingStatus, string paymentStatus, string paymentId)
        {
            if (!string.IsNullOrEmpty(bookingStatus) && bookingStatus.Equals("Cancelled", StringComparison.OrdinalIgnoreCase))
            {
                lblCancelMessage.Text = "This booking is already cancelled.";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#7f1d1d");
                pnlCancelResult.CssClass = "info-box info-error";
                pnlCancelResult.Visible = true;
                return false;
            }

            double hoursUntilTravel = (travelDate - DateTime.Now).TotalHours;

            if (hoursUntilTravel < 42)
            {
                lblCancelMessage.Text = "Cancellation not allowed within 42 hours of the travel date.";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#7f1d1d");
                pnlCancelResult.CssClass = "info-box info-error";
                pnlCancelResult.Visible = true;
                return false;
            }

            if (string.IsNullOrEmpty(paymentId))
            {
                lblCancelMessage.Text = "Payment information missing; cannot process refund.";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#7f1d1d");
                pnlCancelResult.CssClass = "info-box info-error";
                pnlCancelResult.Visible = true;
                return false;
            }

            if (string.IsNullOrEmpty(paymentStatus) ||
                !(paymentStatus.Equals("captured", StringComparison.OrdinalIgnoreCase) ||
                  paymentStatus.Equals("paid", StringComparison.OrdinalIgnoreCase)))
            {
                lblCancelMessage.Text = "Payment is not in a final, refundable status; please contact support.";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#7f1d1d");
                pnlCancelResult.CssClass = "info-box info-error";
                pnlCancelResult.Visible = true;
                return false;
            }

            pnlCancelResult.Visible = false;
            return true;
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            int bookingId = BookingId;
            if (bookingId == 0)
            {
                lblCancelMessage.Text = "Invalid booking.";
                pnlCancelResult.Visible = true;
                pnlCancelResult.CssClass = "info-box info-error";
                return;
            }

            DateTime travelDate = TravelDate;
            string currentBookingStatus = BookingStatus;
            string paymentId = PaymentId;
            int paymentAmount = PaymentAmount;
            string paymentStatus = PaymentStatus;

            if (!CheckCancellationEligibility(travelDate, currentBookingStatus, paymentStatus, paymentId))
            {
                btnCancelBooking.Visible = false;
                return;
            }

            SqlTransaction transaction = null;
            try
            {
                GetCon();
                transaction = con.BeginTransaction();

                string paymentFetchQuery = $@"
                    SELECT TOP 1 * FROM Payments 
                    WHERE BookingId = {bookingId} 
                    ORDER BY CreatedAt DESC, Id DESC";

                var fetchCmd = new SqlCommand(paymentFetchQuery, con, transaction);

                DataTable dtPay = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(fetchCmd))
                {
                    da.Fill(dtPay);
                }

                if (dtPay.Rows.Count == 0)
                {
                    throw new Exception("Payment record not found during refund attempt.");
                }

                DataRow payRow = dtPay.Rows[0];
                int paymentRecordId = Convert.ToInt32(payRow["Id"]);
                string payPaymentId = payRow["PaymentId"]?.ToString() ?? string.Empty;
                string payStatus = payRow["Status"]?.ToString() ?? string.Empty;
                int amountStored = payRow["Amount"] != DBNull.Value ? Convert.ToInt32(payRow["Amount"]) : 0;

                if (string.IsNullOrEmpty(payPaymentId) ||
                    !(payStatus.Equals("captured", StringComparison.OrdinalIgnoreCase) ||
                      payStatus.Equals("paid", StringComparison.OrdinalIgnoreCase)))
                {
                    throw new Exception("Payment is not in a final, refundable status or PaymentId missing; cannot refund.");
                }

                RazorpayService rz = new RazorpayService(RazorpayKeyId, RazorpayKeySecret);
                var refund = rz.RefundPayment(payPaymentId, amountStored);

                string refundId = refund["id"]?.ToString() ?? string.Empty;
                int refundedAmount = 0;
                try
                {
                    var refundAmountObj = refund["amount"];

                    int amtPaise = 0;
                    if (refundAmountObj != null && int.TryParse(refundAmountObj.ToString(), out amtPaise))
                    {
                        refundedAmount = (int)Math.Round(amtPaise / 100.0);
                    }
                    else
                    {
                        refundedAmount = amountStored;
                    }

                }
                catch
                {
                    refundedAmount = amountStored;
                }

                string updatePayment = $@"
                    UPDATE Payments
                    SET Status = 'Refunded', 
                        RefundId = '{refundId}', 
                        RefundedAmount = {refundedAmount}
                    WHERE Id = {paymentRecordId}";
                var updPayCmd = new SqlCommand(updatePayment, con, transaction);
                updPayCmd.ExecuteNonQuery();

                string updateBooking = $@"
                    UPDATE Bookings
                    SET BookingStatus = 'Cancelled'
                    WHERE BookingId = {bookingId}";
                var updBookingCmd = new SqlCommand(updateBooking, con, transaction);
                updBookingCmd.ExecuteNonQuery();

                transaction.Commit();

                lblCancelMessage.Text = "Your booking has been cancelled and refund has been initiated.";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#065f46");
                pnlCancelResult.CssClass = "info-box info-success";
                pnlCancelResult.Visible = true;

                lblRefundId.Text = refundId;
                lblRefundedAmount.Text = $"₹{refundedAmount:N0}";
                lblPaymentStatusAfter.Text = "Refunded";
                pnlRefundInfo.Visible = true;

                btnCancelBooking.Visible = false;

                lblStatus.Text = "Cancelled";
                lblPaymentStatus.Text = "Refunded";
            }
            catch (Exception ex)
            {
                try { transaction?.Rollback(); } catch { }
                lblCancelMessage.Text = $"Refund failed: {ex.Message}";
                lblCancelMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#7f1d1d");
                pnlCancelResult.CssClass = "info-box info-error";
                pnlCancelResult.Visible = true;
            }
            finally
            {
                try { if (con != null && con.State == ConnectionState.Open) con.Close(); } catch { }
            }
        }
    }
}