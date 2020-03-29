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
            da.SelectCommand.Parameters.AddWithValue("@deptid",DropDownList1.SelectedValue);

            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "deptid";

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "-------select department------");


            fill();
           
        
           

        }
    }
    public void fill()
    {
        da = new SqlDataAdapter("select * from supplier", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@supid", DropDownList4.SelectedValue);

        da.Fill(ds);
        DropDownList4.DataSource = ds;
        DropDownList4.DataTextField = "supid";
        DropDownList4.DataValueField = "supid";
        DropDownList4.DataBind();
        DropDownList4.Items.Insert(0, "---------select supplier------");
    }
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
 
        cmd = new SqlCommand("insert into addassets values(@id,@AssetName,@Desc,@SID,@SNM,@AssPrc,@MFGDt,@InstDt,@mntnc,@life,@deptid,@atid,@ac_cat)", cn);
        cmd.Parameters.AddWithValue("@Id", TextBox1.Text);
        cmd.Parameters.AddWithValue("@AssetName", TextBox5.Text);
        cmd.Parameters.AddWithValue("@Desc", TextBox2.Text);
        cmd.Parameters.AddWithValue("@SID", DropDownList4.SelectedValue);
        cmd.Parameters.AddWithValue("@SNM", Label2.Text);
        cmd.Parameters.AddWithValue("@AssPrc", TextBox10.Text);
        cmd.Parameters.AddWithValue("@MFGDt", TextBox11.Text);
        cmd.Parameters.AddWithValue("@InstDt", TextBox12.Text);
        cmd.Parameters.AddWithValue("@mntnc", TextBox13.Text);
        cmd.Parameters.AddWithValue("@life", TextBox14.Text);
        cmd.Parameters.AddWithValue("@deptid", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@atid",DropDownList2.SelectedValue);
        cmd.Parameters.AddWithValue("@ac_cat", DropDownList3.SelectedValue);

        connection();
        Label1.Text = "Inserted succesfully";
        Response.Redirect("gridAddassetm.aspx?id="+TextBox1.Text);
 
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = TextBox2.Text  = TextBox5.Text  = DropDownList4.Text = Label2.Text = Label3.Text = TextBox10.Text = TextBox11.Text = TextBox12.Text = TextBox13.Text = TextBox14.Text = "";
  
    }

    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asstype where deptid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);

        da.Fill(ds);
        DropDownList2.DataSource = ds;
        DropDownList2.DataTextField = "name";
        DropDownList2.DataValueField = "atid";
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "-------select asset type------");
    }

   
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from asscat where atid=@id", cn);
        ds = new DataSet();
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList2.SelectedValue);

        da.Fill(ds);
        DropDownList3.DataSource = ds;
        DropDownList3.DataTextField = "ac_name";
        DropDownList3.DataValueField = "ac_cat";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "-------select asset category------");
    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {


        da = new SqlDataAdapter("select * from supplier where supid=@id", cn);
         dt = new DataTable();

        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList4.SelectedValue);
        da.Fill(dt);

        Label2.Text = dt.Rows[0]["supname"].ToString();
        Label3.Text = dt.Rows[0]["supaddrs"].ToString();
       
    }
   
}
    