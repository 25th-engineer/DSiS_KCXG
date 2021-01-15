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
public partial class login : System.Web.UI.Page
{
    DB db = new DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
           Random ran = new Random();
           this.Label1.Text = ran.Next(1000, 9999).ToString();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.TextBox3.Text != this.Label1.Text)
        {
             
                Response.Write("<script lanuage=javascript>alert('验证码错误');location='javascript:history.go(-1)'</script>");
            
        }
        string name=TextBox1.Text;
        string password=TextBox2.Text;
        string sql="select count(*) from user where name='"+name+"'and password='"+password+"'";
        SqlConnection con = db.getCon();
        SqlCommand com = new SqlCommand(sql, con);
        int k = Convert.ToInt32(com.ExecuteScalar());

        if (k > 0)
        {
            Session["admin"] = name;
          
            Response.Redirect("Message.aspx?message=登陆成功");
        }
        else
        {
            Response.Redirect("Message.aspx?message=登陆失败");
        }
       

    }
}
