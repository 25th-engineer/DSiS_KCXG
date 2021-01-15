<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码
        DB db = new DB();
        SqlConnection con = db.getCon();
        SqlCommand com = new SqlCommand("select count(*) from count", con);
        int k = Convert.ToInt32(com.ExecuteScalar());
        Application["online"] = 0;
        Application["total"] = k;

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码
        DB db = new DB();
        SqlConnection con = db.getCon();
        SqlCommand com = new SqlCommand("update count set number='" + Application["total"] + "'", con);
        com.ExecuteNonQuery();

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新会话启动时运行的代码
        Session.Timeout = 1;
        Application.Lock();
        Application["online"] = (int)Application["online"] + 1;
        Application["total"] = (int)Application["total"] + 1;
        Application.UnLock();
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。
        
        Application.Lock();
        Application["online"] = (int)Application["online"] - 1;
        Application.UnLock();

    }
       
</script>
