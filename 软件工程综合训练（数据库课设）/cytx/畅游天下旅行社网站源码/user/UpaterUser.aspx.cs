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

public partial class user_UpaterUser : System.Web.UI.Page
{
    int UserIDs;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["UserID"] != null)
        {
            UserIDs = Convert.ToInt32(Request.Params["UserID"]);
        }
        if (!Page.IsPostBack)
        {
            GetSinUser(UserIDs);
        }

    }
    public void GetSinUser(int Userid)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        try
        {
            conn.Open();
            string strCmd = "select * from UserName where UserID=" + Userid.ToString();
            SqlCommand comm = new SqlCommand(strCmd, conn);
            SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                Label1.Text = dr["Username"].ToString();
                Label20.Text = dr["UserID"].ToString();
                TextBox2.Text = dr["Username"].ToString();
                TextBox3.Text = dr["Email"].ToString();
                TextBox4.Text = dr["sex"].ToString();
                TextBox5.Text = dr["Birthday"].ToString();
                TextBox6.Text = dr["TelPhone"].ToString();
                TextBox7.Text = dr["Arear"].ToString();
                Label21.Text = dr["Zhuceriqi"].ToString();
                content1.Value  = dr["prontery"].ToString();
            }
        }
        catch (SqlException ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        string strCmd = "update Username set UserName ='" + TextBox2.Text + "',"
                                            + "Email ='" + TextBox3.Text + "',"
                                            + "sex ='" + TextBox4.Text + "',"
                                            + "Birthday='" + TextBox5.Text + "',"
                                            + "TelPhone='" + TextBox6.Text + "',"
                                            + "Arear='" + TextBox7.Text + "',"
                                            + "prontery='" + content1.Value + "'"
                                            + "where UserID=" + UserIDs
                                            ;
        SqlCommand comm = new SqlCommand(strCmd, conn);
        int nResult;
        nResult = comm.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('更新成功！！！')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/SelectUser.aspx");
    }
}
