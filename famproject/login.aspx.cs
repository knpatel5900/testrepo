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

            da = new SqlDataAdapter("select * from registration", cn);
            da.SelectCommand.Parameters.AddWithValue("@category", DropDownList1.SelectedValue);
            ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "category";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "-----category------");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        da = new SqlDataAdapter("select * from registration where firstname=@firstname and password=@password and category=@cat", cn);
        da.SelectCommand.Parameters.AddWithValue("@firstname", TextBox1.Text);
        da.SelectCommand.Parameters.AddWithValue("@password", TextBox2.Text);
        da.SelectCommand.Parameters.AddWithValue("@cat", DropDownList1.SelectedItem.Text);
        dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {

            Label1.Text = "Incorrect Password";
        }
        else
        {
            if (DropDownList1.SelectedItem.Text == "Admin")
            {
                Session["uname"] = TextBox1.Text;
                Response.Redirect("Adminhome.aspx");
            }
            else if(DropDownList1.SelectedItem.Text=="Manager")
            {
                Session["uname"] = TextBox1.Text;
                Response.Redirect("Home.aspx");
            }
        }
    }
}