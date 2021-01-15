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

public partial class user_DleeteUser : System.Web.UI.Page
{
    int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["UserID"] != null)
        {
            userid = Convert.ToInt32(Request.Params["UserID"]);
        }
        GetSinUser();
    }
    private void DeleteUserInfo()
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        try
        {
            conn.Open();
            string strCmd = "delete Username where UserID = " + userid;
            SqlCommand comm = new SqlCommand(strCmd, conn);
            int nResult;
            nResult = comm.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + "编号为" + userid + "的用户，删除成功！！！" + "')</script>");
            Response.Redirect("~/user/SelectUser.aspx");
        }
        catch (SqlException ex)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    public void GetSinUser()
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        try
        {
            conn.Open();
            string strCmd = "select * from UserName where UserID=" + userid.ToString();
            SqlCommand comm = new SqlCommand(strCmd, conn);
            SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                Label1.Text = dr["Username"].ToString();
                Label2.Text = dr["UserID"].ToString();
                Label3.Text = dr["Username"].ToString();
                Label4.Text = dr["Email"].ToString();
                Label5.Text = dr["sex"].ToString();
                Label6.Text = dr["Birthday"].ToString();
                Label7.Text = dr["TelPhone"].ToString();
                Label8.Text = dr["Arear"].ToString();
                Label9.Text = dr["Zhuceriqi"].ToString();
                Label10.Text = dr["prontery"].ToString();
            }
        }
        catch (SqlException ex)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DeleteUserInfo();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/SelectUser.aspx");
    }
}
