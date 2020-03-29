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
        da = new SqlDataAdapter("select * from addassets", cn);
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
            DataColumn dc3 = new DataColumn("description", typeof(string));
            DataColumn dc4 = new DataColumn("suplid", typeof(string));

            DataColumn dc5 = new DataColumn("supnm", typeof(string));
            DataColumn dc6 = new DataColumn("assprice", typeof(string));
            DataColumn dc7 = new DataColumn("mfgdate", typeof(string));
            DataColumn dc8 = new DataColumn("instdate", typeof(string));

            DataColumn dc9 = new DataColumn("life", typeof(string));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);
            dt.Columns.Add(dc8);
            dt.Columns.Add(dc9);

            DataRow dr = dt.NewRow();
            dr["assetid"] = "No Record";
            dr["assetname"] = "No Record";
            dr["description"] = "No Record";
            dr["suplid"] = "No Record";
            dr["supnm"] = "No Record";
            dr["assprice"] = "No Record";
            dr["mfgdate"] = "No Record";
            dr["instdate"] = "No Record";
            dr["life"] = "No Record";



            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Label lblid1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label13");
        //TextBox txtanm = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox2");
        //TextBox txtdes = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox3");
        //TextBox txtsupid = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox5");
        //TextBox txtsupnm = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox6");
        //TextBox txtasprc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox8");
        //TextBox txtmfg = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox9");
        //TextBox txtinst = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox10");
        //TextBox txtlife = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox12");
        //cmd = new SqlCommand("update addassets set assetname=@asssetname,description=@description,suplid=@suplid,supnm=@supnm,assprice=@assprice,mfgdate=@mfgdate,instdate=@instdate,life=@life where assetid=@assetid", cn);

        //cmd.Parameters.AddWithValue("@assetid", lblid1.Text);
        //cmd.Parameters.AddWithValue("@asssetname", txtanm.Text);
        //cmd.Parameters.AddWithValue("@description", txtdes.Text);
        //cmd.Parameters.AddWithValue("@suplid", txtsupid.Text);
        //cmd.Parameters.AddWithValue("@supnm", txtsupnm.Text);
        //cmd.Parameters.AddWithValue("@assprice", txtasprc.Text);
        //cmd.Parameters.AddWithValue("@mfgdate", txtmfg.Text);
        //cmd.Parameters.AddWithValue("@instdate", txtinst.Text);
        //cmd.Parameters.AddWithValue("@life", txtlife.Text);


        //connection();
        //GridView1.EditIndex = -1;
        //fill();
        //Label7.Text = "Updated Successfully";
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //GridView1.EditIndex = e.NewEditIndex;
        //fill();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        fill();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from addassets ", cn);
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
        da = new SqlDataAdapter("select * from addassets ", cn);
        dt = new DataTable();

        da.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (chk.Checked == true)
            {
                LinkButton lbl = (LinkButton)GridView1.Rows[i].FindControl("LinkButton2");
                cmd = new SqlCommand("delete from addassets where assetid=@id", cn);
                cmd.Parameters.AddWithValue("@id", lbl.Text);
                connection();
            }
        }
        if (dt.Rows.Count == 0)
        {
            //Button2.Visible = false;
            Button3.Visible = false;
        }
        fill();
        //GridView1.AutoGenerateDeleteButton = true;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        LinkButton lblid1 = (LinkButton)GridView1.Rows[e.RowIndex].FindControl("LinkButton2");

        cmd = new SqlCommand("delete from addassets where Assetid=@Assetid", cn);
        cmd.Parameters.AddWithValue("@assetid", lblid1.Text);
        connection();
        Label7.Text = "Deleted Successfully";
        fill();

    }

    protected void LinkButton2_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("editass.aspx?id=" + e.CommandArgument);
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        da = new SqlDataAdapter("select * from addassets ", cn);
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


    protected void ImageButton3_Command(object sender, CommandEventArgs e)
    {
        //Response.Redirect("editass.aspx?id=" + e.CommandArgument);
    }

    protected void ImageButton4_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("costbreakupm.aspx?id=" + e.CommandArgument);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from addassets where Assetname like @name", cn);
        string temp=TextBox1.Text+"%";
        da.SelectCommand.Parameters.AddWithValue("@name",temp);
        dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}

