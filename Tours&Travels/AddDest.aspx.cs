using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;

namespace Tours_Travels
{
    public partial class AddDest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void SubmitBtn_Click_Async(object sender, EventArgs e)
        {
            string savePath = Server.MapPath("~/Images/");
            Directory.CreateDirectory(savePath);

            string mainImageUrl = null;
            List<string> galleryUrls = new List<string>();

            try
            {
                if (MainImageUpload.HasFile)
                {
                    string fileName = Guid.NewGuid() + Path.GetExtension(MainImageUpload.FileName);
                    string fullPath = Path.Combine(savePath, fileName);

                    MainImageUpload.SaveAs(fullPath);

                    mainImageUrl = "/Images/" + fileName;
                }

                if (GalleryImagesUpload.HasFiles)
                {
                    foreach (HttpPostedFile file in GalleryImagesUpload.PostedFiles)
                    {
                        if (file.ContentLength > 0)
                        {
                            string fileName = Guid.NewGuid() + Path.GetExtension(file.FileName);
                            string fullPath = Path.Combine(savePath, fileName);

                            file.SaveAs(fullPath);

                            galleryUrls.Add("/Images/" + fileName);
                        }
                    }
                }

                decimal.TryParse(Request.Form["Price"], NumberStyles.Any, CultureInfo.InvariantCulture, out decimal price);

                var newDest = new ModelDest
                {
                    Name = Request.Form["DestName"],
                    Tagline = Request.Form["Tagline"],
                    Duration = Request.Form["Duration"],
                    GroupSize = Request.Form["GroupSize"],
                    Region = Request.Form["Region"],
                    Description = Request.Form["Description"],
                    Included = Request.Form["Included"],
                    Price = price,
                    Category = Request.Form["Category"],
                    MainImage = mainImageUrl,
                    Images = galleryUrls
                };

                bool success = await APIs.AddDestination(newDest);

                if (success)
                {
                    ShowStatusMessage(true, "Destination added successfully!");
                }
                else
                {
                    ShowStatusMessage(false, "Failed to add destination via API.");
                }
            }
            catch (Exception ex)
            {
                ShowStatusMessage(false, "Error: " + ex.Message);
            }
        }

        private void ShowStatusMessage(bool isSuccess, string message)
        {
            string cssClass = isSuccess ? "status-success" : "status-error";
            StatusLiteral.Text = $"<div class='status-box {cssClass}'>{message}</div>";
        }
    }
}