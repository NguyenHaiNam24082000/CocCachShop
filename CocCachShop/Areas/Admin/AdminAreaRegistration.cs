using System.Web.Mvc;

namespace CocCachShop.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.Routes.MapMvcAttributeRoutes();
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new {action = "Index",controller="Home", id = UrlParameter.Optional },
                namespaces: new[] { "CocCachShop.Areas.Admin.Controllers" }
            );
        }
    }
}