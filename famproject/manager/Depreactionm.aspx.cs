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
         public void fill()
         {
             da = new SqlDataAdapter("select addassets.Assetid,addassets.Assetname,addassets.SuplID , addassets.SupNM,addassets.InstDate, addassets.Assprice,dept.name as dname,  asstype.name,asscat.ac_name from addassets  inner join dept on addassets.deptid=dept.deptid  inner join asstype on addassets.atid=asstype.atid   inner join asscat on asscat.ac_cat=addassets.ac_cat where addassets.deptid=@deptid and addassets.atid=@atid and addassets.ac_cat=@ac_cat", cn);

             da.SelectCommand.Parameters.AddWithValue("@deptid", DropDownList2.SelectedValue);
             da.SelectCommand.Parameters.AddWithValue("@atid", DropDownList1.SelectedValue);
             da.SelectCommand.Parameters.AddWithValue("@ac_cat", DropDownList3.SelectedValue);
             dt = new DataTable();
             da.Fill(dt);
             GridView1.DataSource = dt;
             GridView1.DataBind();
         }
protected void  DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
{
    da = new SqlDataAdapter("select * from asstype where deptid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList2.SelectedValue);

        da.Fill(ds);
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "atid";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "-------select assettype------");
}
protected void  DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
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

protected void ImageButton1_Command(object sender, CommandEventArgs e)
{
    da = new SqlDataAdapter("select * from addassets where assetid=@id", cn);
    da.SelectCommand.Parameters.AddWithValue("@id", e.CommandArgument);
    dt = new DataTable();
    da.Fill(dt);
    double  price =Convert.ToDouble( dt.Rows[0]["AssPrice"].ToString());
    DateTime idate =Convert.ToDateTime( dt.Rows[0]["InstDate"].ToString());
    DateTime cdate = DateTime.Now;
   string year= idate.Year.ToString();
   string year1 = cdate.Year.ToString();
   string month = idate.Month.ToString();
   string month1 = idate.Month.ToString();
   int life = Convert.ToInt16(year1) - Convert.ToInt16(year);
   double derp =( price - 5) / life;
   Label10.Text = "The depreaction value is:";
   Label9.Text= derp.ToString();
}

protected void LinkButton2_Command(object sender, CommandEventArgs e)

{
    Label lblid1 = (Label)GridView1.Rows[0].FindControl("Label1");
    cmd = new SqlCommand("insert into depreaction values (@assetid,@depreaction)", cn);
    cmd.Parameters.AddWithValue("@assetid",lblid1.Text);
    cmd.Parameters.AddWithValue("@depreaction", Label9.Text);
    connection();
}
}