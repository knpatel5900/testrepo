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

        //if (Session["uname"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        //else
        //{
       // }
            if (!IsPostBack)
            {
                da = new SqlDataAdapter("select * from dept", cn);
                ds = new DataSet();
                da.SelectCommand.Parameters.AddWithValue("@deptid", DropDownList2.SelectedValue);

                da.Fill(ds);
                DropDownList2.DataSource = ds;
                DropDownList2.DataTextField = "name";
                DropDownList2.DataValueField = "deptid";

                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, "-------select department------");



            }
        
    }
    
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asstype where deptid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList2.SelectedValue);

        da.Fill(ds);
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "atid";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "-------select asset type------");
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asscat where atid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);

        da.Fill(ds);
        DropDownList3.DataSource = ds;
        DropDownList3.DataTextField = "ac_name";
        DropDownList3.DataValueField = "ac_cat";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "-------select asset category------");

    }
   
    
    

    protected void Button1_Click(object sender, EventArgs e)
    {

        fill();    
    }
    public void fill()
    {
        da = new SqlDataAdapter("select addassets.Assetid,addassets.Assetname,addassets.SuplID , addassets.SupNM, dept.name as dname,  asstype.name,asscat.ac_name from addassets  inner join dept on addassets.deptid=dept.deptid  inner join asstype on addassets.atid=asstype.atid   inner join asscat on asscat.ac_cat=addassets.ac_cat where addassets.deptid=@deptid and addassets.atid=@atid and addassets.ac_cat=@ac_cat", cn);
        
        da.SelectCommand.Parameters.AddWithValue("@deptid", DropDownList2.SelectedValue);
        da.SelectCommand.Parameters.AddWithValue("@atid", DropDownList1.SelectedValue);
        da.SelectCommand.Parameters.AddWithValue("@ac_cat", DropDownList3.SelectedValue);
        dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
     
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        fill();
    }
    
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
        cmd = new SqlCommand("update addassets set deptid=@deptid,atid=@atid,ac_cat=@ac_cat where Assetid=@Assetid", cn) ;
        
       // cmd.Parameters.AddWithValue("@Assetid",lblid1.Text);
        cmd.Parameters.AddWithValue("@deptid", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@atid", DropDownList2.SelectedValue);
        cmd.Parameters.AddWithValue("@ac_cat", DropDownList3.SelectedValue);

        connection();
        fill();
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        string str = e.CommandArgument.ToString();
        Response.Redirect("Transfer2.aspx?id="+e.CommandArgument);
    }
}
