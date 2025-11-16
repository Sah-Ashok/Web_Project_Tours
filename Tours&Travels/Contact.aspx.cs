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
    public partial class Contact : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetCon();
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtSubject.Text) || string.IsNullOrEmpty(txtMessage.Text))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtMessage.Text.Length > 500)
            {
                lblMessage.Text = "Message cannot exceed 500 characters.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }


            string query = "insert into Contacts(Name, Email, Subject, Message) values('" + txtName.Text + "','" + txtEmail.Text + "','" + txtSubject.Text + "','" + txtMessage.Text + "')";
            cmd = new SqlCommand(query, con);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
           
                EmailService emailService = new EmailService();

            
                string userEmail = txtEmail.Text.Trim();
                string userSubject = "Thank you for contacting Tripura Adventures!";
                string userBody = $"<h3>Hello {txtName.Text.Trim()},</h3>" +
                                  $"<p>We have successfully received your message and appreciate you reaching out.</p>" +
                                  $"<p>Our team will review your inquiry and get back to you as soon as possible.</p>" +
                                  $"<p><b>Your Message Summary:</b><br/><b>Subject:</b> {txtSubject.Text.Trim()}<br/><b>Message:</b> {txtMessage.Text.Trim()}</p>" +
                                  $"<p>Thank you,<br/>The Tripura Adventures Team</p>";
                emailService.SendEmail(userEmail, userSubject, userBody);

             
                string adminEmail = "wd0ashok@gmail.com"; 
                string adminSubject = $"New Contact Form Message: {txtSubject.Text.Trim()}";
                string adminBody = $"<h3>New message received from the website contact form.</h3>" +
                                   $"<p><b>Name:</b> {txtName.Text.Trim()}</p>" +
                                   $"<p><b>Email:</b> {txtEmail.Text.Trim()}</p>" +
                                   $"<p><b>Subject:</b> {txtSubject.Text.Trim()}</p>" +
                                   $"<hr><p><b>Message:</b><br/>{txtMessage.Text.Trim()}</p>";
                emailService.SendEmail(adminEmail, adminSubject, adminBody);


           
                lblMessage.Text = "Thank you! Your message has been sent successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

               
                txtName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "Error saving your message. Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        
    }
}