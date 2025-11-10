using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Tours_Travels
{
    public partial class Profile : Page
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
            if (Session["UserID"] == null)
            {
                Session["LoginMessage"] = "Please log in to access your profile.";
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                GetData(Convert.ToInt32(Session["UserID"]));
            }
        }

        public void GetData(int userId)
        {
            GetCon();
            string query = "SELECT FirstName, LastName, Email, Phone, Country, State, City, Image FROM Users WHERE Id = " + userId;
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
          
                litWelcome.Text = $"Welcome back, {dr["FirstName"]}";

               
                lblFirstName.Text = dr["FirstName"].ToString();
                lblLastName.Text = dr["LastName"].ToString();
                lblEmail.Text = dr["Email"].ToString();
                lblPhone.Text = dr["Phone"].ToString();
                lblCountry.Text = dr["Country"].ToString();
                lblState.Text = dr["State"].ToString();
                lblCity.Text = dr["City"].ToString();

              
                string imageUrl = dr["Image"].ToString();
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgAvatar.ImageUrl = $"~/Images/{imageUrl}";
                }
                else
                {
                    imgAvatar.ImageUrl = "~/Images/default-avatar.png";
                }
            }
            con.Close();
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
          
            txtFirstName.Text = lblFirstName.Text;
            txtLastName.Text = lblLastName.Text;
            txtPhone.Text = lblPhone.Text;
            txtCountry.Text = lblCountry.Text;
            txtState.Text = lblState.Text;
            txtCity.Text = lblCity.Text;

            
            pnlViewDetails.Visible = false;
            pnlEditDetails.Visible = true;
            btnEditProfile.Text = "Editing...";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
       
            pnlViewDetails.Visible = true;
            pnlEditDetails.Visible = false;
            btnEditProfile.Text = "Edit";
            lblMessage.Text = "";
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string imageName = null;

            if (fuProfileImage.HasFile)
            {
                try
                {
                    string fileExtension = Path.GetExtension(fuProfileImage.FileName).ToLower();
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                    {
                        imageName = $"user_{userId}_{Guid.NewGuid()}{fileExtension}";
                        string folderPath = Server.MapPath("~/Images/");
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }
                        fuProfileImage.SaveAs(Path.Combine(folderPath, imageName));
                    }
                    else
                    {
                        lblMessage.Text = "Only images (.jpg, .jpeg, .png, .gif) are allowed.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading image: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            // --- Database Update Logic ---
            GetCon();
            string query = "UPDATE Users SET FirstName = '" + txtFirstName.Text.Trim() + "', LastName = '" + txtLastName.Text.Trim() + "', " +
                           "Phone = '" + txtPhone.Text.Trim() + "', Country = '" + txtCountry.Text.Trim() + "', State = '" + txtState.Text.Trim() + "', City = '" + txtCity.Text.Trim() + "'";

            if (imageName != null)
            {
                query += ", Image = '" + imageName + "'";
            }

            query += " WHERE Id = " + userId;

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            // --- Session and UI Update ---
            // 1. Update the Session variable
            Session["FirstName"] = txtFirstName.Text.Trim();

            Site1 masterPage = (Site1)this.Master;

            if (masterPage != null)
            {
                masterPage.UserFirstName = txtFirstName.Text.Trim();
            }

        

            // 3. Show success message and switch panels
            lblMessage.Text = "Profile updated successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            GetData(userId); // Refreshes the view panel with latest data
            pnlViewDetails.Visible = true;
            pnlEditDetails.Visible = false;
            btnEditProfile.Text = "Edit";
        }
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCurrentPassword.Text) ||
                string.IsNullOrWhiteSpace(txtNewPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblMessage.Text = "All password fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "New password and confirm password do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string currentPasswordFromDb = "";

            GetCon();
            string passQuery = "SELECT Password FROM Users WHERE Id = " + userId;
            cmd = new SqlCommand(passQuery, con);
            var result = cmd.ExecuteScalar();
            if (result != null)
            {
                currentPasswordFromDb = result.ToString();
            }
            con.Close();

           
            if (txtCurrentPassword.Text.Trim() != currentPasswordFromDb)
            {
                lblMessage.Text = "Incorrect current password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 3. Update to new password
            GetCon();
            string updateQuery = "UPDATE Users SET Password = '" + txtNewPassword.Text.Trim() + "' WHERE Id = " + userId;
            cmd = new SqlCommand(updateQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.Text = "Password updated successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}

