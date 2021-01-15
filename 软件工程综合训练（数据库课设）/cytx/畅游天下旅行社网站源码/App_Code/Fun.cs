using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Fun 的摘要说明
/// </summary>
public class Fun
{
	public Fun()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 用于剪切字符串
    /// </summary>
    /// <param name="sInString"> 字符串</param>
    /// <param name="iCutLength">留字符串的长度</param>
    /// <returns></returns>
    public static string CutStr(string sInString, int iCutLength)
    {
        if (sInString == null || sInString.Length == 0 || iCutLength <= 0)
            return "";
        int iCount = System.Text.Encoding.GetEncoding("GB2312").GetByteCount(sInString);
        if (iCount > iCutLength)
        {
            int iLength = 0;
            for (int i = 0; i < sInString.Length; i++)
            {
                int iCharLength = System.Text.Encoding.GetEncoding("GB2312").GetByteCount(new char[] { sInString[i] });
                iLength += iCharLength;
                if (iLength == iCutLength)
                {
                    sInString = sInString.Substring(0, i + 1);
                    break;
                }
                else if (iLength > iCutLength)
                {
                    sInString = sInString.Substring(0, i);
                    break;
                }
            }
        }
        return sInString;
    }
}
