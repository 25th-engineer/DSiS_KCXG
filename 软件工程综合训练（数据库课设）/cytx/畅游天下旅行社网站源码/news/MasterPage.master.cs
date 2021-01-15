using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class news_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Class1 c1 = new Class1();
        DataSet ds = new DataSet();
        ds = c1.GetInfo("select * from NewsFl");
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
}
