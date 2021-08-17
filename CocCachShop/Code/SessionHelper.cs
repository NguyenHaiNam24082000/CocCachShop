using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Code
{
    public class SessionHelper
    {
        public static void SetSession(KhachHangSession session)
        {
            HttpContext.Current.Session["SigninSession"] = session;
        }
        public static KhachHangSession GetSession()
        {
            var session = HttpContext.Current.Session["SigninSession"];
            if(session==null)
            {
                return null;
            }
            else
            {
                return session as KhachHangSession;
            }
        }
    }
}