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
    public partial class Studentaccountsinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            GridView1.Visible = false;
            btnallissued.Visible = false;
            btnissued.Visible = false;

        }

        protected void btnallissued_Click(object sender, EventArgs e)
        {
            btnallissued.Visible = true;
            btnissued.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = true;
        }

        protected void btnissued_Click(object sender, EventArgs e)
        {
            btnallissued.Visible = true;
            btnissued.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            btnallissued.Visible = true;
            btnissued.Visible = true;
            lblmsg.Text = "Student " + txtsid.Text + " data loaded succesfully";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT tblbooks.Bname, tblissuedbooks.Issid, tblissuedbooks.Idate FROM tblbooks INNER JOIN tblissuedbooks ON tblbooks.Bid = tblissuedbooks.Bid WHERE (tblissuedbooks.Issued = 1) AND (tblissuedbooks.Sid = '"+txtsid.Text+"')", con);
            SqlCommand cmd1 = new SqlCommand("SELECT tblissuedbooks.Issid, tblbooks.Bname, tblissuedbooks.Idate, tblissuedbooks.Issued FROM tblbooks INNER JOIN tblissuedbooks ON tblbooks.Bid = tblissuedbooks.Bid WHERE (tblissuedbooks.Sid = '" + txtsid.Text + "')", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            con.Close();
            con.Open();
            SqlDataReader dr1 = cmd1.ExecuteReader();
            GridView2.DataSource = dr1;
            GridView2.DataBind();
            con.Close();
           
        }
    }
}