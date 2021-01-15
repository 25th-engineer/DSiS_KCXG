using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Windows.Forms;
using System.IO;
using System.Data.SqlClient;

public partial class user_Default : System.Web.UI.Page
{
    string Conncetion = "Data Source=localhost;Initial Catalog=yy;User ID=sa";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Class1 c1 = new Class1();
            SqlDataReader dr = c1.Getdr("select NewFl from NewsFl");
            while (dr.Read())
            {
                DropDownList1.Items.Add(dr["NewFl"].ToString());
            }
        }
    }
    protected void Submit1_Click1(object sender, EventArgs e)
    {
        HttpFileCollection files = HttpContext.Current.Request.Files;//提供对上传文件的访问
        string filename;//文件名
        for (int iFile = 0; iFile < files.Count; iFile++)//对上传文件的遍历
        {
            HttpPostedFile postFile = files[iFile];//读取上传文件的访问
            filename = System.IO.Path.GetFileName(postFile.FileName);//获取到文件名
            if (filename != "")
            {
                postFile.SaveAs(Request.MapPath("~/upload_files/" + filename));//保存上传来的文件
            }
            SqlConnection Myconnection = new SqlConnection(Conncetion);
            Myconnection.Open();
            string strCmd = "insert into New values('"
                               + TextBox3.Text.Trim() + "','"
                               + TextBox2.Text + "','"
                               + TextBox1.Text + "','"
                               + content1.Value + "','"
                               + TextBox4.Text + "','"
                               + TextBox5.Text + "','"
                               + filename + "',"
                               + 0 + ","
                               + "getdate()" + ",'"
                               + DropDownList1.SelectedItem.Text + "',"
                               + 0
                               + ")"
                               ;
            SqlCommand Mycommand = new SqlCommand(strCmd, Myconnection);
            int nResult;
            nResult = Mycommand.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('" + "填加信息成功，请妥善保管好你的信息！" + "');</script>");
            Myconnection.Close();
        }
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        content1.Value = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        content1.Value = "";
    }
}
