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
    public partial class loginuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string uname = "admin";
            string pass = "1234";
            string username = loginstu.UserName;
            string password = loginstu.Password;
            if (uname == username)
            {
                if (pass == password)
                {
                    
                    Session["UserName"] = "admin";
                    Response.Redirect("index.aspx");

                }
            }
            else 
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["libraryconnection"].ConnectionString);
                string query = string.Format("select * from tblstudents where sid='{0}' and pass='{1}'", loginstu.UserName, loginstu.Password);
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    string reg = dr["registered"].ToString();
                    if (reg == "1")  
                        {
                            string name = dr["name"].ToString();
                            Session["Name"] = name;
                            string uid = dr["sid"].ToString();
                            Session["UserName"] = uid;
                            Response.Redirect("login.aspx");

                        }
                        else
                        {
                            string name = dr["name"].ToString();
                            Session["Name"] = name;
                            string uid = dr["sid"].ToString();
                            Session["UserName"] = uid;
                            Response.Redirect("register.aspx");
                        }




                }
                

            }
        }
    }
}