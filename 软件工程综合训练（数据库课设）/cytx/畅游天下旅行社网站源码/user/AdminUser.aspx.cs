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

public partial class AdminUser : System.Web.UI.Page
{
    string StrConnect = "Data Source=localhost;Initial Catalog=yy;User ID=sa";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void button1_Click(object sender, EventArgs e)
    {
        string strPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox1.Text.Trim(), "md5");
        SqlConnection conn = new SqlConnection(StrConnect);
        try
        {
            conn.Open();
            string cmdText = "insert into Users values('"
                               + name.Text.Trim() + "','"
                               + strPwd + "','"
                               + TextBox3.Text.Trim() + "','"
                               + sex.SelectedItem.Text.Trim() + "','"
                               + Convert.ToDateTime(DropDownList1.SelectedItem.Text + "-" + DropDownList2.SelectedItem.Text + "-" + DropDownList3.SelectedItem.Text) + "','"
                               + TextBox4.Text + "','"
                               + DropDownList4.SelectedItem.Text + "','"
                               + TextBox5.Text + "',"
                               + "getdate()"
                               + ")"
                               ;
            SqlCommand comm = new SqlCommand(cmdText, conn);
            int nResult;
            nResult = comm.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + name.Text + ",管理员用户，恭喜你注册成功！！！" + "')</script>");
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
    protected void button2_Click(object sender, EventArgs e)
    {

    }
}
