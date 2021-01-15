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

public partial class user_denglu1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //private SqlDataReader GetUserLogin(string username, string password)
    //{
    //    string strMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text.ToString(), "md5");
    //    SqlConnection conn = new SqlConnection(Class1.connstring);
    //    conn.Open();
    //    SqlCommand comm = new SqlCommand("Pr_GetUser", conn);
    //    comm.CommandType = CommandType.StoredProcedure;
    //    SqlParameter Yhm = new SqlParameter("@UserName", SqlDbType.VarChar, 32);
    //    Yhm.Value = username;
    //    comm.Parameters.Add(Yhm);
    //    SqlParameter mima = new SqlParameter("@strMd5", SqlDbType.VarChar, 255);
    //    mima.Value = password;
    //    comm.Parameters.Add(mima);
    //    SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
    //    return dr;
    //}
    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string userid = "";
        string strMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text.ToString(), "md5");
        string strcmd = "select UserID from Users where UserName='" + UserName.Text.Trim() + "' and password='" + strMd5 + "'";
        Class1 c1 = new Class1();
        SqlDataReader dr = c1.GetNewFl(strcmd);
        if (dr.Read())
        {
            userid = dr["UserID"].ToString();
        }
        string stemyzhm = Session["checkcode"].ToString();
        if (userid != "" && Validator.Text == stemyzhm)
        {
            Response.Redirect("~/user/SelectUser.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请检查你的输入，用户名、密码和验证码输入是否正确！！！')</script>");
        }
    }
    protected void CancelBtn_Click(object sender, EventArgs e)
    {

    }
}
