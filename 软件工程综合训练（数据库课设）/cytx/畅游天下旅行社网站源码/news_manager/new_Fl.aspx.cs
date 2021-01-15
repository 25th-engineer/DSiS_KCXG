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

public partial class news_manager_new_Fl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Class1 c1 = new Class1();
        int Result = c1.AddDabase("insert into NewsFl values('" + TextBox1.Text + "')");
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('新闻类别添加成功！！！')</script>");
    }
}
