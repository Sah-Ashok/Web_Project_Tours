using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;

namespace Tours_Travels
{
 
    public partial class AddDest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                RegisterAsyncTask(new PageAsyncTask(SubmitBtn_Click_Async));
            }
        }

        protected async Task SubmitBtn_Click_Async()
        {
            string mainImagePath = null;
            var galleryImagePaths = new List<string>();
            string savePath = Server.MapPath("~/Images/");

            try
            {
                Directory.CreateDirectory(savePath);

                if (MainImageUpload.HasFile)
                {
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(MainImageUpload.FileName);
                    MainImageUpload.SaveAs(Path.Combine(savePath, fileName));
                    mainImagePath = "/Images/" + fileName;
                }

                if (GalleryImagesUpload.HasFiles)
                {
                    foreach (HttpPostedFile file in GalleryImagesUpload.PostedFiles)
                    {
                        if (file.ContentLength > 0)
                        {
                            string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                            file.SaveAs(Path.Combine(savePath, fileName));
                            galleryImagePaths.Add("/Images/" + fileName);
                        }
                    }
                }

                decimal.TryParse(Request.Form["Price"], NumberStyles.Any, CultureInfo.InvariantCulture, out decimal price);

                var newDest = new ModelDest
                {
                    // Changed DestName to Name to match your schema
                    Name = Request.Form["DestName"],
                    Tagline = Request.Form["Tagline"],
                    Duration = Request.Form["Duration"],
                    GroupSize = Request.Form["GroupSize"],
                    Region = Request.Form["Region"],
                    Description = Request.Form["Description"],
                    Included = Request.Form["Included"],
                    Price = price,
                    Category = Request.Form["Category"],
                    MainImage = mainImagePath,
                    // Changed GalleryImages to Images to match your schema
                    Images = galleryImagePaths
                };

                // Use the APIs class to add the destination
                bool success = await APIs.AddDestination(newDest);

                if (success)
                {
                    ShowStatusMessage(true, "<strong>Success!</strong><br>New destination added successfully.");
                }
                else
                {
                    ShowStatusMessage(false, "<strong>Error!</strong><br>Failed to add destination via API.");
                }
            }
            catch (Exception ex)
            {
                ShowStatusMessage(false, $"<strong>Server Error!</strong><br>Could not save files or connect to API. {ex.Message}");
            }
        }

        private void ShowStatusMessage(bool isSuccess, string message)
        {
            string cssClass = isSuccess ? "status-success" : "status-error";
            StatusLiteral.Text = $"<div class='status-box {cssClass}'>{message}</div>";
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            // This method is required for the OnClick event, 
            // but PageAsyncTask handles the actual async logic.
        }
    }
}


