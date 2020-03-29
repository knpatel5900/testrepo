using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

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
        da = new SqlDataAdapter("select * from subassets ", cn);
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
            DataColumn dc1 = new DataColumn("Asssetid", typeof(string));
            DataColumn dc2 = new DataColumn("subassetid", typeof(string));
            DataColumn dc3 = new DataColumn("assetname", typeof(string));
            
            DataColumn dc4 = new DataColumn("assprice", typeof(string));
            DataColumn dc5 = new DataColumn("mfgdate", typeof(string));
            DataColumn dc6= new DataColumn("instdate", typeof(string));
            DataColumn dc7 = new DataColumn("life", typeof(string));
          

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);
          
            DataRow dr = dt.NewRow();
            dr["asssetid"] = "No Record";
            dr["subassetid"] = "No Record";
            dr["assetname"] = "No Record";
            dr["assprice"] = "No Record";
            dr["mfgdate"] = "No Record";
            dr["instdate"] = "No Record";
            dr["life"] = "No Record";
            
            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        LinkButton lblid1 = (LinkButton)GridView1.Rows[e.RowIndex].FindControl("LinkButton2");

        cmd = new SqlCommand("delete from subassets where subAssetid=@Assetid", cn);
        cmd.Parameters.AddWithValue("@assetid", lblid1.Text);
        connection();
        Label7.Text = "Deleted Successfully";
        fill();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        fill();

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        {
            da = new SqlDataAdapter("select * from subassets ", cn);
            dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (chk.Checked == true)
                {
                    Label lbl = (Label)GridView1.Rows[i].FindControl("Label1");
                    cmd = new SqlCommand("delete from subassets where subassetid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", lbl.Text);
                    connection();
                }
            }

            fill();
            Label7.Text = "Deleted Successfully";


        }
    }
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    da = new SqlDataAdapter("select * from subassets", cn);
    //    dt = new DataTable();
    //    da.Fill(dt);
    //    }

    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    //Label lblid1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label13");
    //    //TextBox txtanm = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox1");
    //    //TextBox txtasprc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox2");
    //    //TextBox txtmfg = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox3");
    //    //TextBox txtinst = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox4");
    //    //TextBox txtlife = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox5");

    //    //cmd = new SqlCommand("update subassets set assetname=@assetname,suplid=@suplid,supnm=@supnm,assprice=@assprice,mfgdate=@mfgdate,instdate=@instdate,life=@life,assetid=@assetid where subassetid=@subassetidid", cn);
    //    //cmd.Parameters.AddWithValue("@assetid", lblid1.Text);
    //    //cmd.Parameters.AddWithValue("@subassetid", lblid1.Text);
    //    //cmd.Parameters.AddWithValue("@asssetname", txtanm.Text);
    //    //cmd.Parameters.AddWithValue("@assprice", txtasprc.Text);
    //    //cmd.Parameters.AddWithValue("@mfgdate", txtmfg.Text);
    //    //cmd.Parameters.AddWithValue("@instdate", txtinst.Text);
    //    //cmd.Parameters.AddWithValue("@life", txtlife.Text);

    //    //connection();
    //    //GridView1.EditIndex = -1;
    //    //fill();
    //    //Label7.Text = "Updated Successfully";
    //}



    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        fill();
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        da = new SqlDataAdapter("select * from subassets ", cn);
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