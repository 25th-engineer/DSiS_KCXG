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

public partial class news_NewsFenl : System.Web.UI.Page
{
    string NewFl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["NewFl"] != "")
        {
            NewFl = Request.Params["NewFl"];
        }
        GetNewInfo(NewFl);
    }
    private void GetNewInfo(string NewFl)
    {
        Label11.Text = NewFl;
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select * from New where NewFl ='" + NewFl +"'");
        Gridview1.DataSource = ds;
        Gridview1.DataBind();
        Label1.Text = (Gridview1.PageIndex + 1).ToString() + "页";
        Label2.Text = (Gridview1.PageCount).ToString() + "页";
        Label3.Text = ds.Tables[0].Rows.Count.ToString();
        if (!IsPostBack)
        {
            for (int i = 1; i <= Gridview1.PageCount; i++)
            {
                DropDownList2.Items.Add(i.ToString());
            }
        }
        if (Gridview1.PageIndex == 0)
        {
            btnFirst.Visible = false;
            btnPrev.Visible = false;
            btnNext.Visible = true;
            btnLast.Visible = true;
        }
        if (Gridview1.PageIndex == Gridview1.PageCount - 1)
        {
            btnFirst.Visible = true;
            btnPrev.Visible = true;
            btnNext.Visible = false;
            btnLast.Visible = false;
        }
        if ((Gridview1.PageIndex != 0) && (Gridview1.PageIndex != Gridview1.PageCount - 1))
        {
            btnFirst.Visible = true;
            btnPrev.Visible = true;
            btnNext.Visible = true;
            btnLast.Visible = true;
        }
        if ((Gridview1.PageCount == 1) || (Gridview1.PageCount == 0))
        {
            btnFirst.Visible = false;
            btnPrev.Visible = false;
            btnNext.Visible = false;
            btnLast.Visible = false;
            LinkButton1.Visible = false;
            DropDownList2.Visible = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void PagerButtonClick1(object sender, EventArgs e)
    {
        Gridview1.PageIndex = 0;
        GetNewInfo(NewFl);
    }
    protected void PagerButtonClick2(object sender, EventArgs e)
    {
        Gridview1.PageIndex = Gridview1.PageIndex - 1;
        GetNewInfo(NewFl);
    }
    protected void PagerButtonClick3(object sender, EventArgs e)
    {
        Gridview1.PageIndex = Gridview1.PageIndex + 1;
        GetNewInfo(NewFl);
    }
    protected void PagerButtonClick4(object sender, EventArgs e)
    {
        Gridview1.PageIndex = Gridview1.PageCount - 1;
        GetNewInfo(NewFl);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Gridview1.PageIndex = Convert.ToInt32(DropDownList2.SelectedItem.Text) - 1;
        GetNewInfo(NewFl);
    }
}
