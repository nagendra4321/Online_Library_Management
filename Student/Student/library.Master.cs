using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student
{
    public partial class library : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {

            }
            else
            {
                Response.Redirect("loginuser.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Response.Redirect("logout.aspx");
        }
    }
}