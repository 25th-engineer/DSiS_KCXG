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

public partial class user_LoginOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {//清空Session中的内容，并停止Session
        Session["UserID"] = null;
        Session["UserName"] = null;
        Session.Abandon();
        Request.Cookies.Clear();
        Session.Clear();
        FormsAuthentication.SignOut();
        Response.Write("<script>window.close();</script>");
        //跳转到首页
    }
}
