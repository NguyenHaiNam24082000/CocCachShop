using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CocCachShop.Models;
using PagedList.Mvc;
using PagedList;
using CocCachShop.Code;

namespace CocCachShop.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection f, int? page)
        {
            string query = f["q"].ToString();
            string searchKey = f["q"].ToString();
            ViewBag.keyword = searchKey;
            List<tDanhMucSP> listSP = (from p in db.tDanhMucSP where p.TenSP.Contains(searchKey) select p).ToList();
            int pageNumber = (page ?? 1);
            int pageSize = 20;
            if(listSP.Count==0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm nào, bạn có thể tham khảo thêm: ";
                return View(db.tDanhMucSP.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.ThongBao = $"Có ({listSP.Count}) Kết quả cho từ khoá {query}";
            return View(listSP.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult KetQuaTimKiem(int? page, string searchKey)
        {
            string query = RemoveVietnameseChars.RemoveSign4VietnameseString(searchKey);
            ViewBag.keyword = searchKey;
            List<tDanhMucSP> listSP = (from p in db.tDanhMucSP where p.TenSP.Contains(searchKey) select p).ToList();
            int pageNumber = (page ?? 1);
            int pageSize = 20;
            if (listSP.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm nào, bạn có thể tham khảo thêm: ";
                return View(db.tDanhMucSP.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.ThongBao = $"Có ({listSP.Count}) Kết quả cho từ khoá {query}";
            return View(listSP.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
        }
    }
}