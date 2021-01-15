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

public partial class news_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            teacher();
            jiaoxue();
            xinli();
            zhongkao();
            news();
            xiaonei();
            tongzhi();
        }
    }
    private void teacher()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='旅游常识' order by AddTime");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    private void jiaoxue()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='景点介绍' order by AddTime");
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }
    private void xinli()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='芒果之乡' order by AddTime");
        GridView3.DataSource = ds;
        GridView3.DataBind();
    }
    private void zhongkao()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='民族风情' order by AddTime");
        GridView4.DataSource = ds;
        GridView4.DataBind();
    }
    private void news()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='华坪特色' order by AddTime");
        GridView5.DataSource = ds;
        GridView5.DataBind();
    }
    private void xiaonei()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='公告' order by AddTime");
        GridView6.DataSource = ds;
        GridView6.DataBind();
    }
    private void tongzhi()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("SELECT top 15 * FROM New where NewFl='精品线路' order by AddTime");
        GridView7.DataSource = ds;
        GridView7.DataBind();
    }
    
}
