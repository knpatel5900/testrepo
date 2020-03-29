using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class maintanance : System.Web.UI.Page
{
    SqlDataAdapter da;
    SqlCommand cmd;
    SqlConnection cn;
    DataTable dt;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");
          if (!IsPostBack)
        {

        da = new SqlDataAdapter("select * from addassets", cn);
        da.SelectCommand.Parameters.AddWithValue("@Assetid", DropDownList1.SelectedValue);
        ds = new DataSet();
        da.Fill(ds);
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "Assetid";
        DropDownList1.DataValueField = "Assetid";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "-----Asset id------");
        }
       
    }
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into maintanance values(@mid,@mcost,@mdate,@assetid,@maintby)", cn);

        cmd.Parameters.AddWithValue("@mid", TextBox1.Text);
        cmd.Parameters.AddWithValue("@mcost", TextBox2.Text);
        cmd.Parameters.AddWithValue("@mdate", TextBox3.Text);
        cmd.Parameters.AddWithValue("@assetid", DropDownList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@maintby", TextBox5.Text);
        connection();


        da = new SqlDataAdapter("select AssPrice from addassets where Assetid=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList1.SelectedItem.Text);
        dt = new DataTable();
        da.Fill(dt);
        Double newone = Convert.ToDouble(dt.Rows[0]["AssPrice"].ToString()) + Convert.ToDouble(TextBox2.Text);
        cmd = new SqlCommand("update addassets set AssPrice=@prc where Assetid=@id", cn);
        cmd.Parameters.AddWithValue("@prc", Convert.ToInt32(newone));
        cmd.Parameters.AddWithValue("@id", DropDownList1.SelectedItem.Text);

        connection();
        Label1.Text = "Inserted succesfully";
        Response.Redirect("maintgrid.aspx?id=" + TextBox1.Text);
    }

   
}