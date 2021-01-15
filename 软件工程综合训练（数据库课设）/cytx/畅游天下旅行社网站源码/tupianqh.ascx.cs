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
public partial class kongjian_tupianqh : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strcmd = "select  *  from New where Picture!=''";
        DataSet ds = new DataSet();
        Class1 cc = new Class1();
        ds = cc.GetChacun(strcmd);
        this.Repeater1.DataSource = ds.Tables[0];
        this.Repeater1.DataBind();
    }
}
