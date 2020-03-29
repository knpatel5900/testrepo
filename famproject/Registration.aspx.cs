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
    SqlCommand cmd;
    SqlConnection cn;
    DataTable dt;
    DataSet ds;


    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");
        if (!IsPostBack)
        {
            da = new SqlDataAdapter("select * from country ", cn);
            da.SelectCommand.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);
            ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "country_name";
            DropDownList1.DataValueField = "country_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "------------select  country------");

        }
    }
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into registration values(@fn,@ln,@pass,@birth,@email,@country,@state,@city,@category)", cn);

        cmd.Parameters.AddWithValue("@fn", fntxt.Text);
        cmd.Parameters.AddWithValue("@ln", lntxt.Text);
        cmd.Parameters.AddWithValue("@pass", passtxt.Text);
        cmd.Parameters.AddWithValue("@birth", TextBox1.Text);
        cmd.Parameters.AddWithValue("@email", emailtxt.Text);
       
        cmd.Parameters.AddWithValue("@country", DropDownList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@category", RadioButtonList1.SelectedItem.Text);

        connection();
        Label1.Text = "Inserted succesfully";
        Response.Redirect("reggrid.aspx?id="+fntxt.Text);
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from city where state_id=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList2.SelectedValue);
        ds = new DataSet();
        da.Fill(ds);
        DropDownList3.DataSource = ds;
        DropDownList3.DataTextField = "city_name";
        DropDownList3.DataValueField = "city_id";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "------------select  city------");
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from state where country_id=@id ", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", DropDownList1.SelectedValue);
        ds = new DataSet();
        da.Fill(ds);
        DropDownList2.DataSource = ds;
        DropDownList2.DataTextField = "state_name";
        DropDownList2.DataValueField = "state_id";
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "------------select  state------");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        fntxt.Text = lntxt.Text = passtxt.Text=TextBox2.Text = "";
    }
}
