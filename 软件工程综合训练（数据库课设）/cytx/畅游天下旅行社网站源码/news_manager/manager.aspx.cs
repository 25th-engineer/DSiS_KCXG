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

public partial class news_manager_manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
          if (!IsPostBack)
          {
        
            GetNewInfo("select * from New ");
        
          }
       

    }
    private void GetNewInfo(string strCmd)
    {
        try
        {
            SqlConnection conn = new SqlConnection(Class1.connstring);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strCmd, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "xcfvfxdvxc");
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
            if (GridView1.PageIndex == GridView1.PageCount - 1)
            {
                btnFirst.Visible = true;
                btnPrev.Visible = true;
                btnNext.Visible = false;
                btnLast.Visible = false;
            }
            if ((GridView1.PageIndex != 0) && (GridView1.PageIndex != GridView1.PageCount - 1))
            {
                btnFirst.Visible = true;
                btnPrev.Visible = true;
                btnNext.Visible = true;
                btnLast.Visible = true;
            }
            if (GridView1.PageCount == 1)
            {
                btnFirst.Visible = false;
                btnPrev.Visible = false;
                btnNext.Visible = false;
                btnLast.Visible = false;
            }
            if (!Page.IsPostBack)
            {
                for (int i = 1; i <= GridView1.PageCount; i++)
                {
                    DropDownList2.Items.Add(i.ToString());
                }
            }
        }
        catch (SqlException ex)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
    }

    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetNewInfo("select * from New");
    }
    protected void PagerButtonClick1(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
       GetNewInfo("select * from New ");
    }
    protected void PagerButtonClick2(object sender, EventArgs e)
    {
        GridView1.PageIndex = Convert.ToInt32(GridView1.PageIndex) - 1;
        GetNewInfo("select * from New ");
    }
    protected void PagerButtonClick3(object sender, EventArgs e)
    {
        GridView1.PageIndex = GridView1.PageIndex + 1;
        GetNewInfo("select * from New ");
    }
    protected void PagerButtonClick4(object sender, EventArgs e)
    {
        GridView1.PageIndex = GridView1.PageCount - 1;
        GetNewInfo("select * from New ");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string commandName = e.CommandName;
        int nUserID = -1;
        nUserID = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            Class1 c1 = new Class1();
            c1.DeleteUser("delete from New where NewID = " + nUserID.ToString());
            GetNewInfo("select * from New");
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] = "ItemOver(this)";
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=FileName.xls");
            Response.Charset = "gb2312";
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            GridView1.AllowPaging = false;
            GetNewInfo("select * from New ");
            GridView1.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
            GridView1.AllowPaging = true;
            GetNewInfo("select * from New ");
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        GridView1.PageIndex = Convert.ToInt32(DropDownList2.SelectedItem.Text) - 1;
        GetNewInfo("select * from New ");
    }
   
    }

