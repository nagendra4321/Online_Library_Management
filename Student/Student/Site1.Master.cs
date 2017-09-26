using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student
{
    public partial class Site1 : System.Web.UI.MasterPage
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
            lblmsg.Text = Session["Name"].ToString() ;
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Session["UserName"] = null;
            Response.Redirect("logout.aspx");
            //if (Session["UserName"] != "")
            //{
            //}

        }
    }
}