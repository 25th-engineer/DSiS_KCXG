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

public partial class news_XinwenInfo : System.Web.UI.Page
{
    int nNewID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["NewID"] != "")
        {
            nNewID = Convert.ToInt32(Request.Params["NewID"]);
        }
        if (!IsPostBack)
        {
            GetNewInfo(nNewID);
            Class1 c1 = new Class1();
            c1.DeleteUser("update New set HitCounts = HitCounts+1 where NewID=" + nNewID);
        }
    }
    private void GetNewInfo(int nnewid)
    {
        SqlConnection conn = new SqlConnection(Class1.connstring);
        conn.Open();
        string strcmd = "select * from New where NewID =" + nnewid;
        SqlCommand comm = new SqlCommand(strcmd, conn);
        SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        if (dr.Read())
        {
            Label1.Text = dr["NewFl"].ToString();
            Label2.Text = dr["Title"].ToString();
            Label3.Text = dr["AddTime"].ToString();
            Label4.Text = dr["Txshe"].ToString();
            Label7.Text = dr["HitCounts"].ToString();
            Label5.Text = dr["Title_Fu"].ToString();
            Label6.Text = dr["News"].ToString();
            Label8.Text = dr["author"].ToString();
            if (dr["Picture"].ToString() != string.Empty)
            {
                Literal1.Text = "<img src =\"../upload_files/" + dr["Picture"] + "\" width=\"680px\" height=\"100%\" align=\"center\" alt=\"\"/>";
            }
        }
    }
}
