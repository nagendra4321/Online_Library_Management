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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("loginuser.aspx");
            }
            
            

          txtsid.Text = Session["Username"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
            SqlCommand cmdsbr = new SqlCommand("select * from tblbranch", con);
            con.Open();
            SqlDataReader drsbr = cmdsbr.ExecuteReader();
            while (drsbr.Read())
            {
                ListItem newItem1 = new ListItem();
                
                newItem1.Text = drsbr["Brname"].ToString();
                newItem1.Value = drsbr["Brid"].ToString();
                ddlbranch.Items.Add(newItem1);
             }
            drsbr.Close();
              
            SqlCommand cmdsque = new SqlCommand("select * from tblsecurity", con);
  
            SqlDataReader drsque = cmdsque.ExecuteReader();
            while (drsque.Read())
            {
                ListItem newItem2 = new ListItem();

                newItem2.Text = drsque["Secque"].ToString();
                newItem2.Value = drsque["Secid"].ToString();
                ddlquestion.Items.Add(newItem2);
            }
            con.Close();

        }

        protected void ddlquestion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void fupphoto_Load(object sender, EventArgs e)
        {
            if (fupphoto.HasFile)
            {
                fupphoto.PostedFile.SaveAs(Server.MapPath("~/photos/" + fupphoto.FileName));


            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
               // string query = string.Format("insert into tblstudents  values('{1}','{2}',{3},'{4}',{5},'{6}','{7}','{8}','{9}','{10}','{11}',1)", txtname.Text, txtnewpass.Text, ddlbranch.SelectedItem.Value, ddlsemster.SelectedItem.Text, ddlquestion.SelectedItem.Value, txtsecans.Text, ddlgender.SelectedItem.Text, txtemail.Text, txtphonenumber.Text, txtdob.Text, "photos/" + fupphoto.FileName);
          //  string query1=string.Format("UPDATE tblstudents(Name,Pass,Brid,Semester,Secid,Secans,Gender,Email,Phno,Dob,Photo,registered)"+
          // " values ('{0}','{1}',{2},'{3}',{4},'{5}','{6}','{7}','{8}','{9}','{10}',1)"+
          //"  where sid="+Session["UserName"]+"", txtname.Text,txtnewpass.Text, ddlbranch.SelectedItem.Value, ddlsemster.SelectedItem.Text, ddlquestion.SelectedItem.Value, txtsecans.Text, ddlgender.SelectedItem.Text, txtemail.Text, txtphonenumber.Text, txtdob.Text, "photos/" + fupphoto.FileName);
                string query1 = string.Format("update tblstudents set name='" + txtname.Text + "',pass='" + txtnewpass.Text + "',brid=" + ddlbranch.SelectedItem.Value + ",semester='" + ddlsemster.SelectedItem.Text + "',secid=" + ddlquestion.SelectedItem.Value + ",secans='" + txtsecans.Text + "',gender='" + ddlgender.SelectedItem.Text + "',email='" + txtemail.Text + "',phno='" + txtphonenumber.Text + "',dob='" + txtdob.Text + "',photo='photos/" + fupphoto.FileName + "',registered='1'  where sid=" + Session["UserName"]);
                SqlCommand cmdsubmit = new SqlCommand(query1, con);
                con.Open();
                int i = cmdsubmit.ExecuteNonQuery();
                con.Close();
           
            


        }

        protected void txtdob_TextChanged(object sender, EventArgs e)
        {

        }

        
      
       

       
    }
}