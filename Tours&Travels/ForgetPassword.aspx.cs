using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerifyReset_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                lblMessage.Text = "Email is required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (btnVerifyReset.Text == "Verify Email")
            {
                if (CheckEmailExists(txtEmail.Text))
                {
                    Random rnd = new Random();
                    int otp = rnd.Next(100000, 999999);

                    // Store the generated OTP in the Session
                    ViewState["ResetOTP"] = otp.ToString();
                    Session["ResetEmail"] = txtEmail.Text;

                    EmailService email = new EmailService();
                    string subject = "Password Reset Request - Tours & Travels";
                    string body = $@"
                <h2>Password Reset Request</h2>
                <p>Hello,</p>
                <p>We received a request to reset your password. Please use the OTP below to verify your identity:</p>
                <h3 style='color: #0b6e4f;'>{otp}</h3>
                <p>This OTP is valid for the next 10 minutes.</p>
                <p>If you did not request this, you can safely ignore this email.</p>
                <br/>
                <p>Best regards,</p>
                <p><b>Tours & Travels Team</b></p>";

                    email.SendEmail(txtEmail.Text, subject, body);

                    lblMessage.Text = "An OTP has been sent to your email.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    otpWrapper.Visible = true;
                    btnVerifyReset.Text = "Verify OTP";
                }
                else
                {
                    lblMessage.Text = "This email is not registered with us.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (btnVerifyReset.Text == "Verify OTP")
            {
                if (ViewState["ResetOTP"] != null)
                {
                    string storedOtp = ViewState["ResetOTP"].ToString();

                    if (storedOtp == txtOTP.Text)
                    {
                      
                        Response.Redirect("ResetPassword.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid OTP. Please try again.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMessage.Text = "OTP session has expired. Please request a new one.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        public bool CheckEmailExists(string email)
        {
            GetCon();
            string query = "select * from users where Email='" + email + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                return true;
            else
            {
                return false;

            }

        }
    }
}