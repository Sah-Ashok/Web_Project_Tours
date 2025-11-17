using System;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{

    public class ApiResponse
    {
        public bool Success { get; set; }
        public string Message { get; set; }
    }

    public partial class AdminDestinations : Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadDestinationsAsync();
            }
        }

        private async Task LoadDestinationsAsync()
        {
            try
            {

                var data = await APIs.GetDestinations();

                if (data != null && data.Count > 0)
                {
                    rptDestinations.DataSource = data;
                    rptDestinations.DataBind();
                    pnlDestinations.Visible = true;
                    pnlNoData.Visible = false;
                }
                else
                {
                    pnlDestinations.Visible = false;
                    pnlNoData.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading destinations: {ex.Message}", "error");
                pnlDestinations.Visible = false;
                pnlNoData.Visible = true;
            }
        }

        protected async void rptDestinations_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDestination")
            {
                string id = e.CommandArgument.ToString();

                try
                {
                    bool success = await APIs.DeleteDestination(id);
                    if (success)
                    {
                        ShowMessage("Destination deleted successfully!", "success");
                        await LoadDestinationsAsync();
                    }
                    else
                    {
                        ShowMessage("Failed to delete destination. Please try again.", "error");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage($"An error occurred: {ex.Message}", "error");
                }
            }
        }

        // Updated method to call the new 'showMessage' JavaScript function.
        private void ShowMessage(string message, string type)
        {
            string sanitizedMessage = message.Replace("'", "\\'").Replace("\r", "").Replace("\n", "");
            string script = $@"
                document.addEventListener('DOMContentLoaded', function() {{
                    showMessage('{sanitizedMessage}', '{type}');
                }});";

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "MessageScript" + Guid.NewGuid(),
                script,
                true
            );
        }
    }
}

