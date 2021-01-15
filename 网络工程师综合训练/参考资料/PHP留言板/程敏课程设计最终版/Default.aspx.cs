using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page 
{
    DB db = new DB();
    PagedDataSource ps;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.showAll();
        if (!IsPostBack)
        {
            if (Session["admin"] == null)
            {
                this.PopupWin1.Message = "你的身份是访客--------你的IP是" + Request.UserHostAddress;
            }
            else
            {

                this.PopupWin1.Message = "你的身份是管理员-----你的IP是" + Request.UserHostAddress;
            }
        }
       
    }
    public void showAll()
    {//显示Datalist里面的内容
        string sql = "select * from note order by time DESC";
        ps = new PagedDataSource();
        ps.AllowPaging = true;
        ps.PageSize = 5;
        ps.CurrentPageIndex = Convert.ToInt32(this.Label1.Text) - 1;
        SqlConnection con;
        con = db.getCon();
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataAdapter sda = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        sda.Fill(ds, "note");
        ps.DataSource=ds.Tables["note"].DefaultView;
        DataList1.DataSource = ps;
        this.Label8.Text =Convert.ToString(ps.PageCount);
        this.Label10.Text = Convert.ToString(Application["total"]);
        this.Label13.Text = Convert.ToString(Application["online"]);
        if (Label1.Text == "1")
        {
            LinkButton2.Enabled = false;
            LinkButton3.Enabled = false;

        }
        else
        {
            LinkButton2.Enabled = true;
            LinkButton3.Enabled = true;
        }
        if (Label1.Text == Convert.ToString(ps.PageCount))
        {
            LinkButton5.Enabled = false;
            LinkButton4.Enabled = false;
        }

        else
        {
            LinkButton5.Enabled = true;
            LinkButton4.Enabled = true;
        }
        DataBind();
    }
    //显示 上一页 下一页 按钮
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        this.Label1.Text = Convert.ToString(1);
        showAll();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        this.Label1.Text = Convert.ToString(Convert.ToInt32(this.Label1.Text) - 1);
        showAll();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        this.Label1.Text = Convert.ToString(Convert.ToInt32(this.Label1.Text) +1);
        showAll();
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        this.Label1.Text = Convert.ToString(ps.PageCount);
        showAll();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
    }
    //删除操作
    protected void LinkButton6_Command(object sender, CommandEventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Write("<script lanuage=javascript>alert('你不是管理员，没有权限删除！！Do you understand');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            string sql = "delete from note where id='" + e.CommandArgument + "'";
            SqlConnection con = db.getCon();
            SqlCommand com = new SqlCommand(sql, con);
            int k = Convert.ToInt32(com.ExecuteNonQuery());
            if (k > 0)
            {
                Response.Redirect("Message.aspx?message=删除成功");
            }
            else
            {
                Response.Redirect("Message.aspx?message=删除失败");
            }
        }
    }
   //留言连接
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lk = (LinkButton)(e.Item.FindControl("LinkButton6"));
        if (lk != null)
        {
            lk.Attributes.Add("onclick", "return confirm('你是否删除留言？');");
        }
    }
}
