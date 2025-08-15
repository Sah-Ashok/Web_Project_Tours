using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Web_Project_Tours
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Simple server-side validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtSubject.Text) ||
                string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                litStatus.Text = "<div class='alert alert-danger'>Please fill in all fields.</div>";
                return;
            }

            try
            {
                using (SqlConnection con = DatabaseHelper.GetConnection())
                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Contact(FullName, Email, Subject, Message) VALUES (@Name, @Email, @Subject, @Message)", con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        litStatus.Text = "<div class='alert alert-success'>Your message has been sent successfully!</div>";
                        ClearForm();
                    }
                    else
                    {
                        litStatus.Text = "<div class='alert alert-warning'>Something went wrong. Please try again.</div>";
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error (optional)
                litStatus.Text = $"<div class='alert alert-danger'>Error: {ex.Message}</div>";
            }
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}
