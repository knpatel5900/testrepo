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
    DataSet ds;
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
        da = new SqlDataAdapter("select * from registration ", cn);
        dt = new DataTable();
        da.Fill(dt);
      
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            dt = new DataTable();
            DataColumn dc1 = new DataColumn("id", typeof(string));
            DataColumn dc2 = new DataColumn("firstname", typeof(string));
            DataColumn dc3 = new DataColumn("lastname", typeof(string));
            DataColumn dc4 = new DataColumn("password", typeof(string));
           
            DataColumn dc5 = new DataColumn("birthday", typeof(string));
            DataColumn dc6 = new DataColumn("email", typeof(string));
            DataColumn dc7 = new DataColumn("country", typeof(string));
            DataColumn dc8 = new DataColumn("state", typeof(string));
            DataColumn dc9 = new DataColumn("city", typeof(string));
            DataColumn dc10 = new DataColumn("category", typeof(string));
            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);
            dt.Columns.Add(dc8);
            dt.Columns.Add(dc9); 
            dt.Columns.Add(dc10);
            DataRow dr = dt.NewRow();
            dr["id"] = "No Record";
            dr["firstname"] = "No Record";
            dr["lastname"] = "No Record";
            dr["password"] = "No Record";
            dr["birthday"] = "No Record";
            dr["email"] = "No Record";
            dr["country"] = "No Record";
            dr["state"] = "No Record";
            dr["city"] = "No Record";
            dr["category"] = "No Record";


            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        fill();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label11");

        TextBox txtfn = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox1");
        TextBox txtmln = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox2");
        TextBox txtpass = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox3");
        TextBox txtbth = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox9");
        TextBox txtemail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox8");
        TextBox txtcontry = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox5");
        TextBox txtstate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox6");

        TextBox txtcity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox7");
        cmd = new SqlCommand("update registration set firstname=@firstname,lastname=@lastname,password=@password,birthday=@birthday,email=@email,country=@country,state=@state,city=@city where id=@id", cn);
        cmd.Parameters.AddWithValue("@id", lblid1.Text);
        cmd.Parameters.AddWithValue("@firstname", txtfn.Text);
        cmd.Parameters.AddWithValue("@lastname", txtmln.Text);
        cmd.Parameters.AddWithValue("@password", txtpass.Text);
        cmd.Parameters.AddWithValue("@birthday", txtbth.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@country", txtcontry.Text);
        cmd.Parameters.AddWithValue("@state", txtstate.Text);
        cmd.Parameters.AddWithValue("@city", txtcity.Text);

        connection();
        GridView1.EditIndex = -1;
        fill();
        Label7.Text = "Updated Successfully";
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        fill();
    }


    protected void Button2_Click1(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from registration ", cn);
        dt = new DataTable();
        da.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            LinkButton lnk = (LinkButton)GridView1.Rows[i].FindControl("LinkButton123");
            lnk.Visible = true;

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from registration", cn);
        dt = new DataTable();
        da.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (chk.Checked == true)
            {
                Label lbl = (Label)GridView1.Rows[i].FindControl("Label1");
                cmd = new SqlCommand("delete from registration where id=@id", cn);
                cmd.Parameters.AddWithValue("@id", lbl.Text);
                connection();
            }
        }
        if (dt.Rows.Count == 0)
        {
            Button2.Visible = false;
            Button3.Visible = false;
        }
        fill();
        //GridView1.AutoGenerateDeleteButton = true;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lbl = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
        cmd = new SqlCommand("delete from registration where id=@id", cn);
        cmd.Parameters.AddWithValue("@id", lbl.Text);
        connection();
        Label7.Text = "Deleted Succesfully";
        fill();
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        da = new SqlDataAdapter("select * from registration", cn);
        dt = new DataTable();
        da.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (chk1.Checked == true)
            {
                chk.Checked = true;
            }
            else
            {
                chk.Checked = false;
            }
        }
    }
}