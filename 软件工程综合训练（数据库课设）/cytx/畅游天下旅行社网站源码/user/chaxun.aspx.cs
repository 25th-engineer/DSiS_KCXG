using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class caldenar_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1_Click(sender, e);
    }
    private void GetSingleUserInfo(string strCmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strCmd, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "UserName");
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
            Label1.Text = (GridView1.PageIndex + 1).ToString() + "页";
            Label2.Text = (GridView1.PageCount).ToString() + "页";
            Label3.Text = ds.Tables[0].Rows.Count.ToString();
            if (GridView1.PageIndex == 0)
            {
                btnFirst.Visible = false;
                btnPrev.Visible = false;
                btnNext.Visible = true;
                btnLast.Visible = true;
            }
            if (GridView1.PageIndex != 0)
            {
                btnLast.Visible = true;
                btnNext.Visible = true;
                btnFirst.Visible = true;
                btnPrev.Visible = true;
            }
            if (GridView1.PageIndex == GridView1.PageCount - 1)
            {
                btnFirst.Visible = true;
                btnPrev.Visible = true;
                btnLast.Visible = false;
                btnNext.Visible = false;
            }
        }
        catch (SqlException ex)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false; 
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TextBox2.Text = Calendar2.SelectedDate.ToShortDateString();
        Calendar2.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        GetSingleUserInfo("select * from Username where Zhuceriqi >='" + TextBox1.Text + "'and Zhuceriqi <='" + TextBox2.Text + "'");
    }
    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {

    }
    protected void PagerButtonClick1(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        Page_Load(sender, e);
    }
    protected void PagerButtonClick2(object sender, EventArgs e)
    {
        GridView1.PageIndex = Convert.ToInt32(GridView1.PageIndex) - 1;
        Page_Load(sender, e);
    }
    protected void PagerButtonClick3(object sender, EventArgs e)
    {
        GridView1.PageIndex = GridView1.PageIndex + 1;
        Page_Load(sender, e);
    }
    protected void PagerButtonClick4(object sender, EventArgs e)
    {
        GridView1.PageIndex = GridView1.PageCount - 1;
        Page_Load(sender, e);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] = "ItemOver(this)";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedItem.Text)
        {
            case "按姓名查询":
                GetSingleUserInfo("select * from UserName where UserName like '%" + TextBox3.Text + "%'");
                break;
            case "按地址查询":
                GetSingleUserInfo("select * from UserName where Arear like '%" + TextBox3.Text + "%'");
                break;
            case "按邮箱查询":
                GetSingleUserInfo("select * from UserName where Email like '%" + TextBox3.Text + "%'");
                break;
            case "按联系电话查询":
                GetSingleUserInfo("select * from UserName where TelPhone = '" + TextBox3.Text + "'");
                break;
            case "按性别查询":
                GetSingleUserInfo("select * from UserName where Sex ='" + TextBox3.Text + "'");
                break;
            default:
                GetSingleUserInfo("select * from UserName");
                break;
        }
    }
}
