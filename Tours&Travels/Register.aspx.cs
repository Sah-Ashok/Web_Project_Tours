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
    public partial class Register : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public void ImgUpload()
        {
            if (fpImage.HasFile)
            {
                fnm = fpImage.FileName.ToString();
                fpImage.SaveAs(Server.MapPath("Images/" + fnm));
            }
            else
            {
                fnm = "noimage.png";
            }
        }
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "" || txtEmail.Text == "" || txtPassword.Text == "" || txtConfirmPassword.Text == "")
            {
                lblMessage.Text = "Please fill all mandatory fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GetCon();
            ImgUpload();
            string query = "insert into users(FirstName,LastName,Email,Phone,Country,State,City,Password,Image) values('" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + ddlCountry.SelectedValue + "','" + txtState.Text + "','" + txtCity.Text + "','" + txtPassword.Text + "','" + fnm + "')";
            cmd = new SqlCommand(query, con);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                lblMessage.Text = "Account created successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                EmailService emailService = new EmailService();
                string subject = "Welcome to Tripur Tours & Travels!";
                string body = $"<h2>Hello {txtFirstName.Text},</h2>" +
                              "<p>Thank you for registering with <b>Exploria</b>. We’re excited to have you on board!</p>" +
                              "<p>Start exploring your next adventure today.</p><br/>" +
                              "<p>Best Regards,<br/>Tripur Team</p>";

                try
                {
                    emailService.SendEmail(txtEmail.Text, subject, body);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Account created, but email not sent. " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Orange;
                }
            }
        }
    }
}