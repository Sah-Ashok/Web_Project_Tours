using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Web_Project_Tours
{
    public partial class sign_up : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (FullName.Text == "")
            {
                Response.Write("<script>alert('Please enter your Full Name');</script>");
                return;
            }

            if (Phone.Text == "")
            {
                Response.Write("<script>alert('Please enter your Phone Number');</script>");
                return;
            }
            if (Email.Text == "")
            {
                Response.Write("<script>alert('Please enter your Email');</script>");
                return;
            }
            if (Password.Text == "")
            {
                Response.Write("<script>alert('Please enter a Password');</script>");
                return;
            }
            if (Password.Text != ConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match');</script>");
                return;
            }
            if (Countries.SelectedValue == "")
            {
                Response.Write("<script>alert('Please select your Country');</script>");
                return;
            }
            if (!Terms.Checked)
            {
                Response.Write("<script>alert('You must accept Terms and Privacy Policy');</script>");
                return;
            }

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                string query = ("INSERT INTO Users (FullName, Email, Phone, Password, Countries) VALUES('" + FullName.Text + "','" + Email.Text + "','" + Phone.Text + "','" + Password.Text + "','" + Countries.SelectedValue + "') ");
                SqlCommand cmd = new SqlCommand(query, con);
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    Response.Write("<script>alert('Data inserted ');</script>");
                    EmailService emailService = new EmailService();

                    string subject = "Welcome To Travel Tours ";
                    string body = $"<h3>Hello {FullName.Text},</h3>" +                      
                                  "<p> Enjoy your Jounery with us . </p>";

                    bool emailSent = emailService.SendEmail(Email.Text, subject, body);
                }
                else
                {
                    Response.Write("<script>alert('Data inserted ');</script>");
                }
            }

        }
    }
}