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

public partial class UserManage2 : System.Web.UI.Page
{
    string connstring = "Data Source=localhost;Initial Catalog=yy;User ID=sa";//字段
    string Shyiy, Xiayiy, Moye;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    /// <summary>
    /// 读取用户的数据
    /// </summary>
    /// <returns></returns>
    private void BaindSource()
    {
        SqlConnection MyConnection = new SqlConnection(connstring);
        string strCmd = "select * from Username";
        DataSet ds = new DataSet();
        try
        {
            MyConnection.Open();
            //执行一组SQL命令和一个数据库连接
            SqlDataAdapter da = new SqlDataAdapter(strCmd,MyConnection);
            da.Fill(ds,"Users");//填充DataSet
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
            MyConnection.Close();

            //分页的数据
            LblCurrentIndex.Text = "第" + (GridView1 .PageIndex +1) .ToString () + "页";
            LblPageCount.Text = "总计" + GridView1.PageCount.ToString() + "页";
            LblRecordCount.Text = "总计" + ds.Tables [0].Rows .Count .ToString () +"行";

            if ((ds.Tables[0].Rows.Count == 0) || (GridView1.PageCount == 1))
            {
                btnFirst.Visible = false;
                btnPrev.Visible = false;
                btnNext.Visible = false;
                btnLast.Visible = false;
            }

        }
        catch(SqlException  ex)
        {
            throw new Exception(ex.Message ,ex);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BaindSource();
    }
    /// <summary>
    /// 删除用户的数据的方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    private int DeleteUser(int nUserID)
    {
        SqlConnection MyConnectionStr = new SqlConnection(connstring);
        //定义SQL语句
        string strCmd = "delete from Users where UserID = " + nUserID.ToString();
        SqlCommand MyCommDel = new SqlCommand(strCmd ,MyConnectionStr);
        int nResult;
        try
        {
            MyConnectionStr.Open();
            nResult = MyCommDel.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            MyConnectionStr.Close();
        }
        return nResult ;

    }
    /// <summary>
    /// 定义修改用户权限的方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private int UpdateUser(int nUserID,bool bIsAdmin)
    {
        SqlConnection MyConnectString = new SqlConnection(connstring );
        //定义SQL语句
        string strCmd = "update Users set IsAdmin="
                         + "'" + (bIsAdmin ? 1 : 0).ToString() + "'"
                         + "where UserID =" +"'"+ nUserID.ToString() + "'";
        SqlCommand MyCommand = new SqlCommand(strCmd ,MyConnectString);
        int nResult;
        try
        {
            MyConnectString.Open();
            nResult = MyCommand.ExecuteNonQuery();

        }
        catch(SqlException ex)
        {
            throw new Exception(ex.Message,ex);
        }
        finally
        {
            MyConnectString.Close();
        }
        return nResult;
    }
    /// <summary>
    /// GridViewCommandEventArgs:为 GridView的RowCommand 事件提供数据。
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string commandName = e.CommandName;
        int nUserID = -1;
        if (Int32.TryParse(e.CommandArgument.ToString(), out nUserID) == false)
        {
            return;
        }
        if (e.CommandName == "delete")
        {
            DeleteUser(nUserID);
            Response.Write("<script>alert('" + "删除成功" + "')</script>");
            BaindSource();
        }
        //switch (commandName)
        //{
        //    case "delete":
        //        {
        //            DeleteUser(nUserID);
        //            Response.Write("<script>alert('" + "删除数据成功" + "')</script>");
        //            BaindSource();
        //            break;
        //        }
        //    case "admin":
        //        {
        //            ///管理员的权限设置
        //            ///首先获取命令源命令源
        //            ///为包含用户单击的按钮的 GridView 控件指的就是Button按扭
        //            Button button = (Button)e.CommandSource;
        //            if (button == null)
        //            {
        //                break;
        //            }
        //            UpdateUser(nUserID, button.Text == "取消管理员权限" ? false : true);
        //            ///重新绑定GridView的数据
        //            Response.Write("<script>alert('" + "设置管理员权限成功，请检查数据库是否吻合！！！" + "');</script>");
        //            BaindSource();
        //            break;
        //        }
        //}
    }
    protected void Buton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddUser.aspx");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    } 
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        //填加鼠标经过行的颜色
        e.Row.Attributes["onmouseover"] = "ItemOver(this)";
        ImageButton button = (ImageButton)e.Row.FindControl("ImgButton1");
        if (button  != null)
        {
            button.Attributes.Add("onclick", "return confirm('你确定要删除所选择的数据项吗？');");
        }
    }
    protected void PagerButtonClick1(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        BaindSource();
    }
    protected void PagerButtonClick2(object sender, EventArgs e)
    {
        Shyiy = GridView1.PageIndex == 0 ? "1" : (GridView1.PageIndex).ToString();
        GridView1.PageIndex = Convert.ToInt32(Shyiy)-1;
        BaindSource();
    }
    protected void PagerButtonClick3(object sender, EventArgs e)
    {
        Xiayiy = GridView1.PageCount == 1 ? GridView1.PageCount.ToString() : (GridView1.PageIndex+1).ToString();
        GridView1.PageIndex = Convert.ToInt32(Xiayiy);
        BaindSource();
    }
    protected void PagerButtonClick4(object sender, EventArgs e)
    {
        Moye = GridView1.PageCount.ToString();
        GridView1.PageIndex = Convert.ToInt32(Moye);
        BaindSource();
    }
}
