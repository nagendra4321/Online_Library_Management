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
    public partial class librarian_search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("loginuser.aspx");
            }



            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
                SqlCommand cmdbcat = new SqlCommand("select * from tblcategory", con);
                con.Open();
                SqlDataReader drbcat = cmdbcat.ExecuteReader();
                while (drbcat.Read())
                {
                    ListItem newItem1 = new ListItem();

                    newItem1.Text = drbcat["Catname"].ToString();
                    newItem1.Value = drbcat["Catid"].ToString();
                    ddlcategory.Items.Add(newItem1);
                }
                drbcat.Close();

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT [Bname], catname, [Author], [Edition], [Noofbooksavailable] FROM [tblbooks] b inner join tblcategory c on c.catid=b.catid WHERE ((b.[Catid] = " + ddlcategory.SelectedItem.Value + ") AND ([Bname] LIKE '%" + txtbookname.Text + "%') AND ([Author] LIKE '%" + txtauthorname.Text + "%'))", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            grdbooks.DataSource = dr;
            grdbooks.DataBind();
            con.Close();
            lblmsg.Text = "search completed Succesfully";
        }
    }
}