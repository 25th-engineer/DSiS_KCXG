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
       jingdian();
        ziyuan();
        TeacherNew();
        JiaoxueNew();
        JiaokeNew();
        StudentNew();
        mangguo();
        gonggao();
      
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select * from NewsFl");
        //DataList1.DataSource = ds;
        //DataList1.DataBind();
      }
    private void jingdian()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='旅游常识' order by AddTime DESC");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    private void ziyuan()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='华坪资源' order by AddTime DESC");
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }
   
    private void TeacherNew()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='精品线路' order by AddTime DESC");
        GridView3.DataSource = ds;
        GridView3.DataBind();
    }
    private void JiaoxueNew()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='景点介绍' order by AddTime DESC");
        GridView4.DataSource = ds;
        GridView4.DataBind();
    }
    private void mangguo()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='芒果之乡' order by AddTime DESC");
        GridView5.DataSource = ds;
        GridView5.DataBind();
    }
    private void JiaokeNew()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='民族风情' order by AddTime DESC");
        GridView6.DataSource = ds;
        GridView6.DataBind();
    }
    private void StudentNew()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='华坪特色' order by AddTime DESC");
        GridView8.DataSource = ds;
        GridView8.DataBind();
    }
    private void gonggao()
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select top 10 * from  New where NewFl='公告' order by AddTime DESC");
        GridView7.DataSource = ds;
        GridView7.DataBind();
    }
}
