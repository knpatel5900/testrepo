using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class editass : System.Web.UI.Page
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


    void fill()
    {

        da = new SqlDataAdapter("select * from addassets where assetid=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        Label lbl_id = (Label)DetailsView1.FindControl("Label1");
        cmd = new SqlCommand("delete from addassets where assetid=@id", cn);

        cmd.Parameters.AddWithValue("@id", lbl_id.Text);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        da = new SqlDataAdapter("select * from addassets", cn);
        dt = new DataTable();
        da.Fill(dt);
        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        
        Label lblid1 = (Label)DetailsView1.FindControl("Label10");
        TextBox txtanm = (TextBox)DetailsView1.FindControl("Textbox1");
        TextBox txtdes = (TextBox)DetailsView1.FindControl("Textbox2");
        TextBox txtsupid = (TextBox)DetailsView1.FindControl("Textbox3");
        TextBox txtsupnm = (TextBox)DetailsView1.FindControl("Textbox4");
        TextBox txtasprc = (TextBox)DetailsView1.FindControl("Textbox5");
        TextBox txtmfg = (TextBox)DetailsView1.FindControl("Textbox6");
        TextBox txtinst = (TextBox)DetailsView1.FindControl("Textbox7");
        TextBox txtlife = (TextBox)DetailsView1.FindControl("Textbox8");
        cmd = new SqlCommand("update addassets set assetname=@asssetname,description=@description,suplid=@suplid,supnm=@supnm,assprice=@assprice,mfgdate=@mfgdate,instdate=@instdate,life=@life where assetid=@assetid", cn);
        cmd.Parameters.AddWithValue("@assetid", lblid1.Text);
        cmd.Parameters.AddWithValue("@asssetname", txtanm.Text);
        cmd.Parameters.AddWithValue("@description", txtdes.Text);
        cmd.Parameters.AddWithValue("@suplid", txtsupid.Text);
        cmd.Parameters.AddWithValue("@supnm", txtsupnm.Text);
        cmd.Parameters.AddWithValue("@assprice", txtasprc.Text);
        cmd.Parameters.AddWithValue("@mfgdate", txtmfg.Text);
        cmd.Parameters.AddWithValue("@instdate", txtinst.Text);
        cmd.Parameters.AddWithValue("@life", txtlife.Text);
        

       cn.Open();
       cmd.ExecuteNonQuery();
       cn.Close();
       DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
       fill();
       Response.Redirect("gridAddasset.aspx");
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        
        DetailsView1.PageIndex = e.NewPageIndex;
        da = new SqlDataAdapter("select * from Addassets", cn);
        dt = new DataTable();
        da.Fill(dt);
        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();
    }

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        DetailsView1.ChangeMode(e.NewMode);

        fill();
        
    }


   
}
