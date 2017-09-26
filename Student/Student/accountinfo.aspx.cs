using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student
{
    public partial class accountinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            if (Session["UserName"] == null)
            {
                Response.Redirect("loginuser.aspx");
            }


            lblmsg.Text = "Your Information has been loaded succesfully";
        }

        protected void btnallissued_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
        }

        protected void btnissued_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
        }

       

      
    }
}