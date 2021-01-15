using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

namespace doughty_cn 
{
	/// <summary>
	/// Global ��ժҪ˵����
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		/// <summary>
		/// ����������������
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
            bool isSafe = true;    //�Ƿ�Ϸ����� 
            string uri = context.Request.Url.AbsolutePath.ToLower();
            if (uri.LastIndexOf(".") > 0 && context.Request.UrlReferrer != null)
            {
                string exp = uri.Substring(uri.LastIndexOf("."));
                //�������ж��ļ���׺���Ƿ����ų����ļ������б�֮�� 
                bool isHas = ClassLibrary.RData.RString.StrIsIncUseSC(exp, config.ImgSafeType.Split('|'));
                if (isHas)
                {
                    string domainOutter = context.Request.UrlReferrer.Authority.ToLower();    //���������Ͷ˿� 
                    ArrayList arry = Common.Cache.GetDomainValid();//ȡϵͳ����ĺϷ����������б� 
                    isSafe = arry.Contains(domainOutter);    //�жϵ�ǰ����������Ƿ��ںϷ��б�֮�� 
                }
            }
            //������ǲ��Ϸ���ʱ�������ˣ������Ĭ�����ͼƬ����������û�о�����һ������ʽΪ.gif 
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
                        Font f = new Font("����,����,Arial", 9, FontStyle.Bold);
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
			
		#region Web ������������ɵĴ���
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    
			this.components = new System.ComponentModel.Container();
		}
		#endregion
	}
}

