using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Student
{
    public partial class issuebook : System.Web.UI.Page
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

        protected void btnissue_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            //string query = string.Format("insert into tblissuedbooks  values('{0}',{1},'{2}',1)", txtsid.Text, txtbid.Text, System.DateTime.Now);
            //SqlCommand cmdissue = new SqlCommand(query, con);
            //con.Open();
            //SqlCommand cmdupdate = new SqlCommand(string.Format("update tblbooks set Noofbooksavailable=Noofbooksavailable-1 where Bid='{0}'", txtbid.Text), con);
            //cmdupdate.ExecuteNonQuery();
            //int i = cmdissue.ExecuteNonQuery();
            //con.Close();
            bool p = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            foreach (GridViewRow row in grdissuebooks.Rows)
            {
                CheckBox chkIsIssued = row.Cells[0].FindControl("chkIsIssued") as CheckBox;
                int isissued = chkIsIssued.Checked ? 1 :0;
                if (isissued == 1)
                {
                    string studentid = txtsid.Text;
                    HiddenField hdnBookid = row.Cells[1].FindControl("hdnBookid") as HiddenField;
                    string Bookid = hdnBookid.Value;
                    SqlCommand cmd = new SqlCommand("stp_IssueBooks", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@BookId", SqlDbType.Int).Value = Bookid;
                    cmd.Parameters.Add("@StudentId", SqlDbType.VarChar).Value = studentid;
                    cmd.Parameters.Add("@IssuedDate", SqlDbType.VarChar).Value = DateTime.Now.ToString();
                    cmd.Parameters.Add("@IsIssued", SqlDbType.Int).Value = isissued;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                
           }
            foreach (GridViewRow row1 in grdissuebooks.Rows)
            {
                CheckBox chkcheck = (CheckBox)row1.FindControl("chkIsIssued");
                chkcheck.Checked = p;
            }
            lblmsg.Text = "Books issued to " + txtsid.Text + " Succesfully";
           
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT [Bname],[Bid], catname, [Author], [Edition], [Noofbooksavailable] FROM [tblbooks] b inner join tblcategory c on c.catid=b.catid WHERE ((b.[Catid] = " + ddlcategory.SelectedItem.Value + ") AND ([Bname] LIKE '%" + txtbookname.Text + "%') AND ([Author] LIKE '%" + txtauthorname.Text + "%'))", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dad.Fill(ds);
            grdissuebooks.DataSource = ds;
            grdissuebooks.DataBind();
             


        }
    }
}