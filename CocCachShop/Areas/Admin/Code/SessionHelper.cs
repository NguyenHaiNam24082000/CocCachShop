using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Areas.Admin.Code
{
    public class SessionHelper
    {
        public static void SetSession(AdminSession session)
        {
            HttpContext.Current.Session["SigninSession"] = session;
        }
        public static AdminSession GetSession()
        {
            var session = HttpContext.Current.Session["SigninSession"];
            if(session==null)
            {
                return null;
            }
            else
            {
                return session as AdminSession;
            }
        }
    }
}