using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student
{
    public partial class Enterbook : System.Web.UI.Page
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

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            SqlCommand cmdcat = new SqlCommand("select * from tblcategory", con);
            con.Open();
            SqlDataReader drcat = cmdcat.ExecuteReader();
            while (drcat.Read())
            {
                ListItem newItem1 = new ListItem();

                newItem1.Text = drcat["Catname"].ToString();
                newItem1.Value = drcat["Catid"].ToString();
                ddlcategory.Items.Add(newItem1);
            }
            drcat.Close();
        }


        protected void btnenter_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            string query = string.Format("insert into tblbooks  values('{0}',{1},'{2}','{3}',{4})", txtbookname.Text, ddlcategory.SelectedItem.Value, txtauthor.Text, txtedition.Text, txtnoavailable.Text);

            SqlCommand cmdenter = new SqlCommand(query, con);
            con.Open();
            int i = cmdenter.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = txtbookname.Text + " Book added Succesfully";

            txtbookname.Text = null;
            txtauthor.Text = null;
            txtedition.Text = null;
            txtnoavailable.Text = null;
            ddlcategory.ClearSelection();
        }

    }
}