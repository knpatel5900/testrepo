using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Costbreakup : System.Web.UI.Page
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
            Label4.Text = Request.QueryString["id"].ToString();
    }}
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
        cmd = new SqlCommand("insert into subassets values(@SubAssetId,@Assetname,@SID,@SNM,@AssPrc,@MFGDt,@InstDt,@life,@asssetid)", cn);
        cmd.Parameters.AddWithValue("@SubAssetId", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Assetname", TextBox5.Text);
       
        cmd.Parameters.AddWithValue("@SID", DropDownList4.SelectedValue);
        cmd.Parameters.AddWithValue("@SNM", Label2.Text);

        cmd.Parameters.AddWithValue("@AssPrc", TextBox10.Text);
        cmd.Parameters.AddWithValue("@MFGDt", TextBox11.Text);
        cmd.Parameters.AddWithValue("@InstDt", TextBox12.Text);
        cmd.Parameters.AddWithValue("@life", TextBox14.Text);
        cmd.Parameters.AddWithValue("@asssetid", Label4.Text);
        connection();

        
        da = new SqlDataAdapter("select AssPrice from addassets where Assetid=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        Double newone = Convert.ToDouble(dt.Rows[0]["AssPrice"].ToString()) - Convert.ToDouble(TextBox10.Text);
        cmd = new SqlCommand("update addassets set AssPrice=@prc where Assetid=@id", cn);
        cmd.Parameters.AddWithValue("@prc", Convert.ToInt32(newone));
        cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
        connection();
        Label1.Text = "Inserted succesfully";
        fill();

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

