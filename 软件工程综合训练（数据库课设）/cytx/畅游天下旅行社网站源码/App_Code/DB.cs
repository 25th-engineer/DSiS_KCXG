using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// DB 的摘要说明
/// </summary>
public class DB
{
    public static string connstring = "Data Source=.;Initial Catalog=yy;User ID=sa;pwd=sa";//字段
    /// <summary>
    /// 使用DataAdapter查询数据
    /// </summary>
    /// <param name="strcmd">SQL语句</param>
    /// <returns></returns>
	public DB()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static string Num;

    public static SqlConnection getConnection()
    {
        return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WebUserDBConnectionString"].ConnectionString);
    }
}
