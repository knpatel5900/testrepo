using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    SqlDataAdapter da;
    SqlConnection cn;
    SqlCommand cmd;
    DataTable dt;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");
        if (!IsPostBack)
        {
            fill();
            
            da = new SqlDataAdapter("select * from dept", cn);
            ds = new DataSet();
           
            da.SelectCommand.Parameters.AddWithValue("@deptid", DropDownList4.SelectedValue);

            da.Fill(ds);
            DropDownList4.DataSource = ds;
            DropDownList4.DataTextField = "name";
            DropDownList4.DataValueField = "deptid";

            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, "------------select dept------");

          
        }
    }
    void fill()
    {

        da = new SqlDataAdapter("select addassets.Assetid,addassets.Assetname,addassets.SuplID , addassets.SupNM, dept.name as dname,  asstype.name,asscat.ac_name from addassets  inner join dept on addassets.deptid=dept.deptid  inner join asstype on addassets.atid=asstype.atid   inner join asscat on asscat.ac_cat=addassets.ac_cat where Assetid=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();
    }
   
        protected void DropDownList4_SelectedIndexChanged1(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asstype where deptid=@id ", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList4.SelectedValue);

        da.Fill(ds);
        DropDownList5.DataSource = ds;
        DropDownList5.DataTextField = "name";
        DropDownList5.DataValueField = "atid";

        DropDownList5.DataBind();
        DropDownList5.Items.Insert(0, "------------select asstype------");
    }
    protected void DropDownList5_SelectedIndexChanged1(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asscat where atid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList5.SelectedValue);

        da.Fill(ds);
        DropDownList6.DataSource = ds;
        DropDownList6.DataTextField = "ac_name";
        DropDownList6.DataValueField = "ac_cat";
        DropDownList6.DataBind();
        DropDownList6.Items.Insert(0, "------------select asscat------");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update addassets set deptid=@did,atid=@aid,ac_cat=@acat where Assetid=@id", cn);

        cmd.Parameters.AddWithValue("@did", DropDownList4.SelectedValue);
        cmd.Parameters.AddWithValue("@aid", DropDownList5.SelectedValue);
        cmd.Parameters.AddWithValue("@acat", DropDownList6.SelectedValue);
        cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        fill();
    }

    
}
