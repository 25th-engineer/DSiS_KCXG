using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

namespace doughty_cn 
{
	/// <summary>
	/// Global 的摘要说明。
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		private int logincount;

		public Global()
		{   
			InitializeComponent();
		}	
		
		protected void Application_Start(Object sender, EventArgs e)
		{
			logincount=0;
			Application.Add("logincount",logincount);
		}
 
		protected void Session_Start(Object sender, EventArgs e)
		{
			Application.Lock();
            		logincount=((int)Application.Get("logincount"))+1;
			Application.Set("logincount",logincount);
			Application.UnLock();
		}

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
         /*   HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;
            bool isSafe = true;    //是否合法链接 
            string uri = context.Request.Url.AbsolutePath.ToLower();
            if (uri.LastIndexOf(".") > 0 && context.Request.UrlReferrer != null)
            {
                string exp = uri.Substring(uri.LastIndexOf("."));
                //这里是判断文件后缀名是否在排除的文件类型列表之内 
                bool isHas = ClassLibrary.RData.RString.StrIsIncUseSC(exp, config.ImgSafeType.Split('|'));
                if (isHas)
                {
                    string domainOutter = context.Request.UrlReferrer.Authority.ToLower();    //包含域名和端口 
                    ArrayList arry = Common.Cache.GetDomainValid();//取系统定义的合法的域名绑定列表 
                    isSafe = arry.Contains(domainOutter);    //判断当前请求的域名是否在合法列表之内 
                }
            }
            //下面就是不合法的时候的输出了，如果有默认替代图片则输出，如果没有就生成一个，格式为.gif 
            if (!isSafe)
            {
                Bitmap img = null;
                Graphics g = null;
                MemoryStream ms = null;

                try
                {
                    string picPath = ClassLibrary.RPath.GetFullDirectory("images/unlawful.gif");
                    if (File.Exists(picPath))
                    {
                        img = new Bitmap(picPath, false);
                    }
                    else
                    {
                        img = new Bitmap(64, 64);
                        g = Graphics.FromImage(img);
                        g.Clear(Color.White);
                        Font f = new Font("宋体,黑体,Arial", 9, FontStyle.Bold);
                        SolidBrush s = new SolidBrush(Color.Red);
                        g.DrawString(Resources.Message.LawlessLink, f, s, 1, 20);
                        img.Save(picPath, ImageFormat.Gif);
                    }
                    ms = new MemoryStream();
                    img.Save(ms, ImageFormat.Gif);
                    context.Response.Clearcontent();
                    context.Response.contentType = "image/Gif";
                    context.Response.BinaryWrite(ms.ToArray());
                    context.Response.End();
                }
                catch
                { }
                finally
                {
                    if (g != null)
                        g.Dispose();
                    img.Dispose();
                }
            }*/
        }

		protected void Application_EndRequest(Object sender, EventArgs e)
		{

		}

		protected void Application_AuthenticateRequest(Object sender, EventArgs e)
		{

		}

		protected void Application_Error(Object sender, EventArgs e)
		{

		}

		protected void Session_End(Object sender, EventArgs e)
		{
			Application.Lock();
			logincount=((int)Application.Get("logincount"))-1;
			Application.Set("logincount",logincount);
			Application.UnLock();
		}

		protected void Application_End(Object sender, EventArgs e)
		{

		}
			
		#region Web 窗体设计器生成的代码
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.components = new System.ComponentModel.Container();
		}
		#endregion
	}
}

