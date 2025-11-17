using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Tours_Travels
{
    public partial class Destination : System.Web.UI.Page
    {
      
        private List<ModelDest> allDestinations = new List<ModelDest>();

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CurrentPage"] = 0;
                ViewState["ActiveFilter"] = "all";
                ViewState["SearchTerm"] = "";
                await GetDestinationsAsync();
            }
        }

        private async Task GetDestinationsAsync()
        {
            string category = ViewState["ActiveFilter"].ToString();
            string searchTerm = ViewState["SearchTerm"].ToString().ToLower();

            try
            {
                // ✅ Using your API class to get data
                allDestinations = await APIs.GetDestinations();

                if (allDestinations == null || allDestinations.Count == 0)
                {
                    ShowMessage("No destinations found.", "error");
                    pnlNoResults.Visible = true;
                    rptDestinations.Visible = false;
                    pnlPagination.Visible = false;
                    return;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading destinations: {ex.Message}", "error");
                pnlNoResults.Visible = true;
                rptDestinations.Visible = false;
                pnlPagination.Visible = false;
                return;
            }

            // ✅ Apply category filter
            var filteredDestinations = allDestinations;
            if (category != "all")
            {
                filteredDestinations = filteredDestinations
                    .Where(d => d.Category != null &&
                                d.Category.Equals(category, StringComparison.OrdinalIgnoreCase))
                    .ToList();
            }

            // ✅ Apply search filter
            if (!string.IsNullOrEmpty(searchTerm))
            {
                filteredDestinations = filteredDestinations
                    .Where(d =>
                        (d.Name != null && d.Name.ToLower().Contains(searchTerm)) ||
                        (d.Region != null && d.Region.ToLower().Contains(searchTerm)) ||
                        (d.Tagline != null && d.Tagline.ToLower().Contains(searchTerm)))
                    .ToList();
            }

            // ✅ Pagination setup
            PagedDataSource pds = new PagedDataSource
            {
                DataSource = filteredDestinations,
                AllowPaging = true,
                PageSize = 8,
                CurrentPageIndex = Convert.ToInt32(ViewState["CurrentPage"])
            };

            if (filteredDestinations.Count > 0)
            {
                rptDestinations.DataSource = pds;
                rptDestinations.DataBind();
                pnlNoResults.Visible = false;
                rptDestinations.Visible = true;
            }
            else
            {
                pnlNoResults.Visible = true;
                rptDestinations.Visible = false;
            }

            UpdatePaginationButtons(pds);
            SetActiveFilterButton();
        }

        // ✅ Helper to show messages in frontend
        private void ShowMessage(string message, string type)
        {
            string sanitizedMessage = message.Replace("'", "\\'").Replace("\r", "").Replace("\n", "");
            string script = $"showMessage('{sanitizedMessage}', '{type}');";

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "MessageScript" + Guid.NewGuid(),
                script,
                true
            );
        }

        // ✅ Pagination logic
        private void UpdatePaginationButtons(PagedDataSource pds)
        {
            pnlPagination.Visible = pds.PageCount > 1;

            if (pnlPagination.Visible)
            {
                btnPrev.Enabled = !pds.IsFirstPage;
                btnNext.Enabled = !pds.IsLastPage;

                string prevClass = "pagination-nav-btn";
                string nextClass = "pagination-nav-btn";

                if (!btnPrev.Enabled) prevClass += " disabled";
                if (!btnNext.Enabled) nextClass += " disabled";

                btnPrev.CssClass = prevClass;
                btnNext.CssClass = nextClass;
            }
        }

        protected async void btnFilter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            ViewState["ActiveFilter"] = btn.CommandArgument;
            ViewState["SearchTerm"] = "";
            txtSearch.Text = "";
            ViewState["CurrentPage"] = 0;
            await GetDestinationsAsync();
        }

        protected async void btnSearch_Click(object sender, EventArgs e)
        {
            ViewState["SearchTerm"] = txtSearch.Text.Trim();
            ViewState["CurrentPage"] = 0;
            await GetDestinationsAsync();
        }

        private void SetActiveFilterButton()
        {
            string activeFilter = ViewState["ActiveFilter"].ToString();

            btnAll.CssClass = "filter-btn px-6 py-2 rounded-full font-semibold";
            btnAdventure.CssClass = "filter-btn px-6 py-2 rounded-full font-semibold";
            btnCultural.CssClass = "filter-btn px-6 py-2 rounded-full font-semibold";
            btnBeach.CssClass = "filter-btn px-6 py-2 rounded-full font-semibold";
            btnCity.CssClass = "filter-btn px-6 py-2 rounded-full font-semibold";

            switch (activeFilter)
            {
                case "adventure":
                    btnAdventure.CssClass += " active";
                    break;
                case "cultural":
                    btnCultural.CssClass += " active";
                    break;
                case "beach":
                    btnBeach.CssClass += " active";
                    break;
                case "city":
                    btnCity.CssClass += " active";
                    break;
                default:
                    btnAll.CssClass += " active";
                    break;
            }
        }

        protected async void btnNext_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["CurrentPage"]);
            currentPage++;
            ViewState["CurrentPage"] = currentPage;
            await GetDestinationsAsync();
        }

        protected async void btnPrev_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["CurrentPage"]);
            if (currentPage > 0)
            {
                currentPage--;
                ViewState["CurrentPage"] = currentPage;
                await GetDestinationsAsync();
            }
        }
    }
}
