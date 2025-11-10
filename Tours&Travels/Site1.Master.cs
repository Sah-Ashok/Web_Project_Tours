using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null && Session["Email"] != null)
            {
                isAuth.Text = Session["FirstName"].ToString();
            }
        }

        public string UserFirstName
        {
            set
            {
                if (isAuth != null)
                {
                    isAuth.Text = value;
                }
            }
        }
    }
}