using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project_Tours
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendLink_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = "SELECT FullName FROM Users WHERE Email=@Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
     
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        string fullName = result.ToString();

                        // Email service
                        EmailService emailService = new EmailService();
                        string subject = "Password Reset Request";
                        string body = $"<h3>Hello {fullName},</h3>" +
                                      $"<p>You requested a password reset. Click the link below to reset your password:</p>" +
                                      $"<a href='https://yourdomain.com/reset-password.aspx?email={email}'>Reset Password</a>" +
                                      "<p>If you did not request this, please ignore this email.</p>";

                        bool emailSent = emailService.SendEmail(email, subject, body);

                        if (emailSent)
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "Password reset link has been sent to your email.";
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Error sending email. Please try again later.";
                        }
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Email not found in our system.";
                    }
                }
            }
        }
    }
}
