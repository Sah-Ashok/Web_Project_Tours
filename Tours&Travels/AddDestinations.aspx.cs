using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AddDestinations : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string mainImageFileName = "";
        List<string> galleryImageFileNames = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public string ImgUpload(FileUpload fileUploadControl)
        {
            string fileName;
            if (fileUploadControl.HasFile)
            {
                fileName = Path.GetFileName(fileUploadControl.FileName);
                string folderPath = Server.MapPath("~/Images/");
                fileUploadControl.SaveAs(folderPath + fileName);
            }
            else
            {
                fileName = "noimage.png";
            }
            return fileName;
        }

        protected void btnAddDestination_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "")
            {
                lblMessage.Text = "Please select a category.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            mainImageFileName = ImgUpload(fileMainImage);

            if(string.IsNullOrEmpty(txtDestName.Text) || string.IsNullOrEmpty(txtTagline.Text) || string.IsNullOrEmpty(txtDuration.Text) || string.IsNullOrEmpty(txtGroupSize.Text) || string.IsNullOrEmpty(txtRegion.Text) || string.IsNullOrEmpty(txtDescription.Text) || string.IsNullOrEmpty(txtIncluded.Text) || string.IsNullOrEmpty(txtPrice.Text))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            if (mainImageFileName == "noimage.png")
            {
                lblMessage.Text = "Please select a main image.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            if (fileGalleryImages.HasFiles)
            {
                foreach (HttpPostedFile postedFile in fileGalleryImages.PostedFiles)
                {
                    string galleryFileName = Path.GetFileName(postedFile.FileName);
                    string folderPath = Server.MapPath("~/Images/");
                    postedFile.SaveAs(folderPath + galleryFileName);
                    galleryImageFileNames.Add(galleryFileName);
                }
            }
            string galleryImagesString = string.Join(",", galleryImageFileNames);

            GetCon();
            string query = "INSERT INTO Destinations (Name, Tagline, Duration, GroupSize, Region, Description, Included, Price, Category, MainImage, Image) VALUES ('" + txtDestName.Text + "', '" + txtTagline.Text + "', '" + txtDuration.Text + "', '" + txtGroupSize.Text + "', '" + txtRegion.Text + "', '" + txtDescription.Text + "', '" + txtIncluded.Text + "', " + txtPrice.Text + ", '" + ddlCategory.SelectedValue + "', '" + mainImageFileName + "', '" + galleryImagesString + "')";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.Text = "Destination added successfully!";
            lblMessage.ForeColor = Color.Green;
            ClearForm();
        }

        private void ClearForm()
        {
            txtDestName.Text = "";
            txtTagline.Text = "";
            txtDuration.Text = "";
            txtGroupSize.Text = "";
            txtRegion.Text = "";
            txtDescription.Text = "";
            txtIncluded.Text = "";
            txtPrice.Text = "";
            ddlCategory.SelectedIndex = 0;
        }
    }
}

