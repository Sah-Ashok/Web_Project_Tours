using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;

namespace Tours_Travels
{
    public partial class ViewDetails : System.Web.UI.Page
    {

        private ModelDest destination;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check for the string ID from the query string
                if (Request.QueryString["id"] != null)
                {
                    string destId = Request.QueryString["id"];
                    await LoadDestinationDetailsAsync(destId);
                }
                else
                {
                    ShowError();
                }
            }
        }
        private async Task LoadDestinationDetailsAsync(string id)
        {
        
            try
            {
                
                destination = await APIs.GetDestinationById(id);

                if (destination != null)
                {
                    // Parse string values for duration and group size
                    int days = int.TryParse(destination.Duration, out int d) ? d : 0;
                    int groupSize = int.TryParse(destination.GroupSize, out int g) ? g : 0;

                    litDestName.Text = destination.Name;
                    litTagline.Text = destination.Tagline;
                    litDuration.Text = $"{days} Days / {days - 1} Nights";
                    litGroupSize.Text = $"Up to {groupSize} people";
                    litRegion.Text = destination.Region;

                    string mainImage = destination.MainImage;
                    heroSection.Style["background-image"] = $"url('{mainImage}')";

                    litOverviewTitle.Text = "Experience " + destination.Name;
                    litOverviewText.Text = destination.Description.Replace("\n", "<br/>");

                    litPrice.Text = "₹" + destination.Price.ToString("N0");
                    hlBookNow.NavigateUrl = $"~/bookingConfirmation.aspx?id={id}";

                    // Bind Inclusions
                    string inclusionsString = destination.Included;
                    string[] inclusionsArray = inclusionsString.Replace("\\n", "\n").Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);

                    var inclusionsList = inclusionsArray.Select(item => new { InclusionText = item.Trim() }).ToList();
                    rptInclusions.DataSource = inclusionsList;
                    rptInclusions.DataBind();

                    // Bind Gallery Images
                    if (destination.Images != null && destination.Images.Any())
                    {
                        var galleryList = destination.Images.Select(imageUrl => new {
                            ImageUrl = imageUrl.Trim(),
                            AltText = destination.Name + " Image"
                        }).ToList();

                        rptGallery.DataSource = galleryList;
                        rptGallery.DataBind();
                    }

                    divDetails.Visible = true;
                    divError.Visible = false;
                }
                else
                {
                    ShowError();
                }
            }
            catch (Exception)
            {
                // Handle API call exceptions (e.g., 404 Not Found, server down)
                ShowError();
            }
        }

        private void ShowError()
        {
            divDetails.Visible = false;
            divError.Visible = true;
        }

        protected void btnWishlist_Click(object sender, EventArgs e)
        {
            // Wishlist logic to be implemented
        }
    }
}
