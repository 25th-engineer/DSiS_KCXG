using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class AddNote : System.Web.UI.Page
{
    DB db = new DB();
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = TextBox1.Text;
        string content = TextBox2.Text;
        //string con = content.Replace("\n", "<br>");
        string sex = "男";
        string image = "boy.gif";
        if (RadioButton2.Checked == true)
        {
             sex = "女";
            image = "girl.gif";
        }
        string sql="insert into note(name,sex,image,content)values('"+name+"','"+sex+"','"+image+"','"+content+"')";
        con = db.getCon();
        SqlCommand com = new SqlCommand(sql, con);
        int k = Convert.ToInt32(com.ExecuteNonQuery());
        if (k > 0)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Message.aspx?message=留言失败");
        }
    }
}
