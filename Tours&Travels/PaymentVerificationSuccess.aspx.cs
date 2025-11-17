using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Tours_Travels.Services;

namespace Tours_Travels
{
    public partial class PaymentVerification_Success : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        private const string RazorpayKeyId = "rzp_test_RH6BCRHYRKNmRY";
        private const string RazorpayKeySecret = "gJ4Kqbjukx9CihPEBJgoDfhM";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerifyPayment();
            }
        }

        private void VerifyPayment()
        {
            try
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                string orderId = Request.Form["razorpay_order_id"];
                string signature = Request.Form["razorpay_signature"];
                string bookingId = Request.QueryString["bookingId"];

                if (string.IsNullOrEmpty(paymentId))
                {
                    ShowFailed("No Payment ID received.");
                    return;
                }

                var service = new RazorpayService(RazorpayKeyId, RazorpayKeySecret);

                bool valid = service.VerifySignature(orderId, paymentId, signature);

                if (!valid)
                {
                    ShowFailed("Signature verification failed.");
                    return;
                }

                int amount = 0;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmdAmount = new SqlCommand("SELECT Amount FROM Payments WHERE OrderId=@o", con);
                    cmdAmount.Parameters.AddWithValue("@o", orderId);
                    amount = Convert.ToInt32(cmdAmount.ExecuteScalar());
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    SqlCommand updatePayment = new SqlCommand(
                        @"UPDATE Payments 
                  SET PaymentId=@p, Status='Paid' 
                  WHERE OrderId=@o", con);

                    updatePayment.Parameters.AddWithValue("@p", paymentId);
                    updatePayment.Parameters.AddWithValue("@o", orderId);
                    updatePayment.ExecuteNonQuery();

                    SqlCommand updateBooking = new SqlCommand(
                        @"UPDATE Bookings 
                  SET BookingStatus='Confirmed' 
                  WHERE BookingId=@b", con);

                    updateBooking.Parameters.AddWithValue("@b", bookingId);
                    updateBooking.ExecuteNonQuery();
                }

                pnlSuccess.Visible = true;
                pnlFailed.Visible = false;

                lblPaymentId.Text = paymentId;
                lblOrderId.Text = orderId;
                lblBookingId.Text = bookingId;
                lblAmount.Text = amount.ToString("N0");
            }
            catch (Exception ex)
            {
                ShowFailed(ex.Message);
            }
        }

        private void ShowFailed(string message)
        {
            pnlSuccess.Visible = false;
            pnlFailed.Visible = true;
            lblError.Text = message;
        }
    }
}
