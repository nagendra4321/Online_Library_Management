using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student
{
    public partial class returnbook : System.Web.UI.Page
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

        protected void btnreturn_Click(object sender, EventArgs e)
        {
            bool p = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            //string searchquery = string.Format("select * from tblissuedbooks where (Sid='{0}' and Bid={1} )", txtrsid.Text, txtrbid.Text);
            //SqlCommand cmdsearch = new SqlCommand(searchquery, con);
            //con.Open();
            //SqlDataReader drsearch = cmdsearch.ExecuteReader();
            //if (drsearch.HasRows)
            //{
            //    drsearch.Read();
            //    string query = string.Format("insert into tblreturn  values({0},'{1}',{2},'{3}')", drsearch["Issid"], txtrsid.Text, txtrbid.Text, System.DateTime.Now);
            //    SqlCommand cmdupdatebooks = new SqlCommand(string.Format("update tblbooks set Noofbooksavailable=Noofbooksavailable+1 where Bid='{0}'", txtrbid.Text), con);
            //    SqlCommand cmdupdateissuedbooks = new SqlCommand(string.Format("update tblissuedbooks set Issued=0 where (Sid='{0}' and Bid={1} )", txtrsid.Text, txtrbid.Text), con);
            //    SqlCommand cmdret = new SqlCommand(query, con);
            //    drsearch.Close();
            //    int i = cmdret.ExecuteNonQuery();
            //    cmdupdatebooks.ExecuteNonQuery();
            //    cmdupdateissuedbooks.ExecuteNonQuery();


            //}
            //con.Close();





            //DataTable dt = new DataTable();
            //dt.Columns.Add("Issid", typeof(int));
            //dt.Columns.Add("Sid", typeof(string));
            //dt.Columns.Add("Bid", typeof(int));
            //dt.Columns.Add("rdate", typeof(string));
            //dt.Columns.Add("Issued", typeof(bool));
            foreach (GridViewRow row in grdreturnbooks.Rows)
            {

                CheckBox chkIsPresent = row.Cells[0].FindControl("chkIsReturn") as CheckBox;
                int ispresent = chkIsPresent.Checked ? 0: 1;
                if (ispresent == 0)
                {
                    HiddenField hdnBookid = row.Cells[1].FindControl("hdnBookId") as HiddenField;
                    int bookid = int.Parse(hdnBookid.Value);
                    HiddenField hdnIssueid = row.Cells[1].FindControl("hdnIssueId") as HiddenField;
                    int issueid = int.Parse(hdnIssueid.Value);
                    HiddenField hdnStudentid = row.Cells[1].FindControl("hdnStudentId") as HiddenField;
                    string studentid = hdnStudentid.Value;
                    //   dt.Rows.Add(issueid, studentid, bookid, DateTime.Now.ToString(), ispresent);

                    SqlCommand cmd = new SqlCommand("stp_UpdateIssuedBooks", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@IssueId", SqlDbType.Int).Value = issueid;
                    cmd.Parameters.Add("@StudentId", SqlDbType.VarChar).Value = studentid;
                    cmd.Parameters.Add("@BookId", SqlDbType.Int).Value = bookid;
                    cmd.Parameters.Add("@IsReturned", SqlDbType.Int).Value = ispresent;
                    cmd.Parameters.Add("@ReturnedDate", SqlDbType.VarChar).Value = DateTime.Now.ToString();
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }


            }
            foreach (GridViewRow row1 in grdreturnbooks.Rows)
            {
                CheckBox chkcheck = (CheckBox)row1.FindControl("chkIsReturn");
                chkcheck.Checked = p;
            }


            lblmsg.Text = "Book Returned by " + txtrsid.Text + " Succesfully";
            grdreturnbooks.Visible = false;
            btnreturn.Enabled = false;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            btnreturn.Enabled = true;
            grdreturnbooks.Visible = true;
           SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
           string query = string.Format("select IB.Bid, Bname,Name,IB.sid,Idate,Issid from [tblissuedbooks] IB   inner join tblstudents s on IB.Sid=s.Sid inner join tblbooks b on b.Bid=IB.Bid where IB.sid='{0}' and issued=1", txtrsid.Text);
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dad.Fill(ds);
            grdreturnbooks.DataSource = ds;
            grdreturnbooks.DataBind();
            
        }

        protected void grdreturnbooks_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}