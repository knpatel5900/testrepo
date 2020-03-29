using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    SqlDataAdapter da;
    SqlConnection cn;
    SqlCommand cmd;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");
        if (!IsPostBack)
        {
            fill();
        }

    }
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public void fill()
    {
        da = new SqlDataAdapter("select * from addassets", cn);
        dt = new DataTable();
        da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
}