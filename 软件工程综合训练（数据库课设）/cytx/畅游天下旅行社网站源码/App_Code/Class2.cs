using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
///Class2 的摘要说明
/// </summary>
public class Class2
{
    private string strValue;
    public string StrValue
    {
        get
        {
            return strValue;
        }
        set
        {
            if (strValue == value)
                return;
            strValue = value;
        }
    } 
}
