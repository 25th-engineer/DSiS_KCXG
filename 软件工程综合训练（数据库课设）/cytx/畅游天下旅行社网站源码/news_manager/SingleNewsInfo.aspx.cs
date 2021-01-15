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

public partial class news_manager_SingleNewsInfo : System.Web.UI.Page
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
                Label22.Text = dr["NewFl"].ToString();
                Label23.Text = dr["Title"].ToString();
                Label24.Text = dr["News"].ToString();
                if (dr["Picture"].ToString() != string.Empty)
                {
                    Literal1.Text = "<img src=\"../upload_files/" + dr["Picture"] + "\" width=\"300px\" height=\"200px\" alt=\"\" align=\"center\" />";
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
}
