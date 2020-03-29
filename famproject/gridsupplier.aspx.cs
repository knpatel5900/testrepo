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
        da = new SqlDataAdapter("select * from supplier", cn);
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
            DataColumn dc1 = new DataColumn("supid", typeof(string));
            DataColumn dc2 = new DataColumn("supname", typeof(string));
            DataColumn dc3 = new DataColumn("supaddrs", typeof(string));
           
            DataColumn dc4 = new DataColumn("email", typeof(string));
            DataColumn dc5 = new DataColumn("purchasedate", typeof(string));
            DataColumn dc6 = new DataColumn("mobileno", typeof(string));
        

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            

            DataRow dr = dt.NewRow();
            dr["supid"] = "No Record";
            dr["supname"] = "No Record";
            dr["supaddrs"] = "No Record";
            dr["purchasedate"] = "No Record";
            dr["email"] = "No Record";
            dr["mobileno"] = "No Record";
          



            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
   
    protected void Button3_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from supplier ", cn);
        dt = new DataTable();
        da.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (chk.Checked == true)
            {
                Label lbl = (Label)GridView1.Rows[i].FindControl("Label1");
                cmd = new SqlCommand("delete from supplier where supid=@id", cn);
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
        Label7.Text = "Deleted Successfully";
       // GridView1.AutoGenerateEditButton = true;
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from supplier ", cn);
        dt = new DataTable();
        da.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            LinkButton lnk = (LinkButton)GridView1.Rows[i].FindControl("LinkButton123");
            lnk.Visible = true;

        }
        
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
          CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        da = new SqlDataAdapter("select * from supplier", cn);
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

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label8");

        TextBox snm = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox1");
        TextBox sadd = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox2");
        TextBox email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox3");
        TextBox pdt = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox4");
        TextBox  mno = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Textbox5");
        cmd = new SqlCommand("update supplier set supname=@supname,supaddrs=@supaddrs,email=@email,purchasedate=@purchasedate,mobileno=@mobileno where supid=@supid", cn);
        cmd.Parameters.AddWithValue("@supid", lblid1.Text);
        cmd.Parameters.AddWithValue("@supname",snm.Text);
        cmd.Parameters.AddWithValue("@supaddrs",sadd.Text);
        cmd.Parameters.AddWithValue("@email",email.Text);
        cmd.Parameters.AddWithValue("@purchasedate",pdt.Text);
        cmd.Parameters.AddWithValue("@mobileno",mno.Text);
        connection();
        GridView1.EditIndex = -1;
        fill();
        Label7.Text = "Updated Successfully";
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

        GridView1.EditIndex = e.NewEditIndex;
        fill();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        fill();
    }
}
