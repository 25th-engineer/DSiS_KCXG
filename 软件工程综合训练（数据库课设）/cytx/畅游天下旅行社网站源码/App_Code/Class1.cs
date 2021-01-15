using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
///Class1 的摘要说明
/// </summary>
public class Class1
{
    public static string connstring = "Data Source=.;Initial Catalog=yy;User ID=sa;pwd=sa;";//字段
    /// <summary>
    /// 使用DataAdapter查询数据
    /// </summary>
    /// <param name="strcmd">SQL语句</param>
    /// <returns></returns>
    public DataSet GetInfo(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(strcmd, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "chaxun");
        return ds;
    }

    public int AddDabase(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand comm = new SqlCommand(strcmd, conn);
        int nResult = comm.ExecuteNonQuery();
        return nResult;
    }
    /// <summary>
    /// 删除数据
    /// </summary>
    /// <param name="nUserID"></param>
    /// <returns></returns>

    public int DeleteUser(string strcmd)
    {
        int nResult;
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand MyCommDel = new SqlCommand(strcmd, conn);
        nResult = MyCommDel.ExecuteNonQuery();
        return nResult;
        conn.Close();
    }
    /// <summary>
    /// 使用ExecuteReader()方法查询数据
    /// </summary>
    /// <param name="strcmd"></param>
    /// <returns></returns>
    public SqlDataReader Getdr(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand comm = new SqlCommand(strcmd, conn);
        SqlDataReader dr;
        dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }
    /// <summary>
    /// 功能:使用DataRreader查询数据
    /// </summary>
    /// <param name="strcmd">Sql语句</param>
    /// <returns></returns>
    public  SqlDataReader GetNewFl(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand comm = new SqlCommand(strcmd, conn);
        SqlDataReader dr;
        dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }

    public DataSet GetChacun(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(strcmd, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "yyy");
        conn.Close();
        return ds;
    }
    public int Caozuo(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand com = new SqlCommand(strcmd, conn);
        int nResult = -1;
        nResult = com.ExecuteNonQuery();
        conn.Close();
        return nResult;
    }
    public SqlDataReader GetDd(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand comm = new SqlCommand(strcmd, conn);
        SqlDataReader dr;
        dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }
    public SqlDataReader GetNewffl(string strcmd)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        SqlCommand comm = new SqlCommand(strcmd, conn);
        SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }

}
