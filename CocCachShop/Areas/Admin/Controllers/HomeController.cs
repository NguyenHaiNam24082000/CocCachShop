using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CocCachShop.Areas.Admin.Controllers
{
    [RouteArea("Admin")]
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Admin/Home
        [Route("Index")]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Products()
        {
           
            return View();
        }

        public ActionResult EditProducts()
        {
            return View();
        }

        public ActionResult Employee()
        {
            return View();
        }

        public ActionResult Customer()
        {
            return View();
        }

        public ActionResult Bill()
        {
            return View();
        }
    }
}