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
    SqlCommand cmd;
    SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\fam.mdf;Integrated Security=True;User Instance=True");
     
    }
    public void connection()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("Insert into supplier values (@id,@supnm,@supadd,@email,@pdt,@mno)", cn);
        cmd.Parameters.AddWithValue("@id",TextBox1.Text);
        cmd.Parameters.AddWithValue("@supnm", TextBox2.Text);
        cmd.Parameters.AddWithValue("@supadd", TextBox3.Text);
        cmd.Parameters.AddWithValue("@email", TextBox4.Text);
        cmd.Parameters.AddWithValue("@pdt", TextBox5.Text); 
        cmd.Parameters.AddWithValue("@mno", TextBox6.Text);

        connection(); 
        Label1.Text = "Inserted succesfully";
        Response.Redirect("gridsupplier.aspx?id=" + TextBox1.Text);

    }
}