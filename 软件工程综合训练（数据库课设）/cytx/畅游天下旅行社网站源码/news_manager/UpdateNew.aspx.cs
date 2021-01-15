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

public partial class news_manager_UpdateNew : System.Web.UI.Page
{
    int NewID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["NewID"] != "")
        {
            NewID = Convert.ToInt32(Request.Params["NewID"]);
        }
        if (!IsPostBack)
        {
            GetSinUser();
        }
    }
    public void GetSinUser()
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        try
        {
            conn.Open();
            string strCmd = "select * from new where NewID=" + NewID.ToString();
            SqlCommand comm = new SqlCommand(strCmd, conn);
            SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                Label20.Text = dr["NewID"].ToString();
                TextBox1.Text = dr["Title_Fu"].ToString();
                TextBox2.Text = dr["Title"].ToString();
                TextBox3.Text = dr["Author"].ToString();
                TextBox4.Text = dr["Txshe"].ToString();
                TextBox5.Text = dr["Beizhu"].ToString();
                Label21.Text = dr["AddTime"].ToString();
                DropDownList1.Text = dr["NewFl"].ToString();
                content1.Value = dr["News"].ToString();
                Label22.Text = dr["Title"].ToString();
                if (dr["Picture"].ToString() != string.Empty)
                {
                    Literal1.Text = "<img src=\"../upload_files/" + dr["Picture"] + "\" width=\"250px\" height=\"150px\" alt=\"\" align=\"center\" />";
                }
            }
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
    protected void Button1_Click1(object sender, EventArgs e)
    {
        HttpFileCollection files = HttpContext.Current.Request.Files;
        string filename;
        for (int iFile = 0; iFile < files.Count; iFile++)
        {
            HttpPostedFile postFile = files[iFile];
            filename = System.IO.Path.GetFileName(postFile.FileName);
            postFile.SaveAs(Request.MapPath("~/upload_files/" + filename));
            string strCmd = "update New set Title_Fu='" + TextBox1.Text + "',"
                                              + "Title ='" + TextBox2.Text + "',"
                                              + "Author ='" + TextBox3.Text + "',"
                                              + "Txshe ='" + TextBox4.Text + "',"
                                              + "Beizhu='" + TextBox5.Text + "',"
                                              + "news='" + content1.Value + "',"
                                              + "Picture='" + filename + "',"
                                              + "NewFl='" + DropDownList1.SelectedItem.Text + "'"
                                              + "where NewID=" + NewID
                                              ;
            Class1 c1 = new Class1();
            c1.DeleteUser(strCmd);
        }
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('编号为：" + NewID + "的新闻修改成功！！！')</script>");
        GetSinUser();
    }
}
