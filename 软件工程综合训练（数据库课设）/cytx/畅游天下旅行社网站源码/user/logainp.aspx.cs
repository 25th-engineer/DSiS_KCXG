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
using System.Text;
using System.Drawing;
using System.IO;
//using System.Drawing.Imaging;

public partial class session_logainp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["checkcode"] = GetNum(5);
        ValideCode(Session["checkcode"].ToString());
    }
    /// <summary>
    /// 功能：产生随机数作为验证码
    /// </summary>
    /// <param name="len">验证码的长度</param>
    /// <returns></returns>
    public string GetNum(int len)
    {
        string strText = "a,b,c,d,e,f,g,h,j,k,l,m,n,p,q,r,s,t,u,v,w,x,y,z,2,3,4,5,6,7,8,9";
        string[] strArry = strText.Split(new char[] { ',' });
        Random ran = new Random();
        StringBuilder strCheckcode = new StringBuilder();
        for (int i = 0; i< len; i++)
        {
            strCheckcode.Append(strArry[ran.Next(0, 32)]);
        }
        return strCheckcode.ToString();
    }
    /// <summary>
    /// 功能：把验证码写在规定的图片上
    /// </summary>
    /// <param name="Vnum">验证码</param>
    public void ValideCode(string Vnum)
    {
        string ImagePath = "~/Images/validator.jpg";
        Bitmap img = new Bitmap(Server.MapPath(ImagePath));
        Font f = new Font("Arial", 16);
        SolidBrush s = new SolidBrush(Color.Red);//
        Graphics g = Graphics.FromImage(img);//创建画笔的输出模式
        g.DrawString(Vnum, f, s, 0, 7);
        MemoryStream ms = new MemoryStream();
        img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        Response.ClearContent();
        Response.ContentType = "image/Jpeg";
        Response.BinaryWrite(ms.ToArray());
        g.Dispose();
        img.Dispose();
        Response.End();
    }
}
