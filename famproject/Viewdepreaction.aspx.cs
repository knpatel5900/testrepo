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
        da = new SqlDataAdapter("select addassets.Assetid,addassets.Assetname,addassets.Assprice ,addassets.InstDate,depreaction.derp from addassets inner join depreaction on   addassets.assetid=depreaction.assetid", cn);
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
            DataColumn dc1 = new DataColumn("assetid", typeof(string));
            DataColumn dc2 = new DataColumn("assetname", typeof(string));
            DataColumn dc3 = new DataColumn("assprice", typeof(string));
            DataColumn dc4 = new DataColumn("instdate", typeof(string));
           
            DataColumn dc5 = new DataColumn("derp", typeof(string));


            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);

            DataRow dr = dt.NewRow();
            dr["assetid"] = "No Record";
            dr["assetname"] = "No Record";
            dr["assprice"] = "No Record";
            dr["instdate"] = "No Record";
           
            dr["derp"] = "No Record";

            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        da = new SqlDataAdapter("select * from depreaction ", cn);
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
        cmd = new SqlCommand("delete from depreaction where assetid=@assetid", cn);
        cmd.Parameters.AddWithValue("@assetid", lblid.Text);
        connection();
        Label7.Text = "Deleted Successfully";
        fill();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        {

            da = new SqlDataAdapter("select addassets.Assetid,addassets.Assetname,addassets.Assprice ,addassets.InstDate,depreaction.derp from addassets inner join depreaction on   addassets.assetid=depreaction.assetid", cn);
            dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (chk.Checked == true)
                {
                    Label lbl = (Label)GridView1.Rows[i].FindControl("Label1");
                    cmd = new SqlCommand("delete from depreaction where assetid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", lbl.Text);
                    connection();
                }
            }

            fill();
            Label7.Text = "Deleted Successfully";


        }
    }
   
}