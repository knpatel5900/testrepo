using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class formview : System.Web.UI.Page
{
    SqlDataAdapter da;
    SqlConnection cn;
    DataTable dt;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");

        fill();
    }
       
    public void fill()
    {
       
        da = new SqlDataAdapter("Select * from addassets where assetid=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@Id", Request.QueryString["id"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        FormView1.DataSource = dt;
        FormView1.DataBind();
     
   
        }
    
}
