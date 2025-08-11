using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Project_Tours
{
	public partial class Site1 : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["isLogin"] != null && (bool)Session["isLogin"] == true)
				{
					lblUserName.Text = Session["FullName"].ToString();
                    btnLogout.Visible = true;
                    LoginLink.Visible = false;
                }
				else
				{
                    lblUserName.Text = "Guest";
                    btnLogout.Visible = false;
                    LoginLink.Visible = true;
                }
			}
		}

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // 1. Clear session
            Session.Clear();
            Session.Abandon();

            // 3. Redirect to login
            Response.Redirect("login.aspx?isAuth=false");
        }



    }
}