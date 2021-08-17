using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CocCachShop.Models;
using PagedList;
using PagedList.Mvc;

namespace CocCachShop.Controllers
{
    //[RouteArea("Home")]
    [HandleError]
    //[Authorize]
    [AllowAnonymous] //Cho phép vào nặc danh không cần phải mất thời gian để truy xuất
    public class HomeController : Controller
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        //[Route("Index")]
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult HeaderPartial()
        {
            List<tLoaiSP> loaiSP = db.tLoaiSP.ToList();
            return PartialView(loaiSP);
        }

        public PartialViewResult FooterPartial()
        {
            return PartialView();
        }

        public ViewResult SanPhamTheoChuDe(int? page,string MaLoai)
        {
            int pageSize = 20;
            int pageNumber = (page ?? 1);
            tLoaiSP loaiSP = db.tLoaiSP.SingleOrDefault(n => n.MaLoai == MaLoai);
            if(loaiSP==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<tDanhMucSP> listDanhMucSP = db.tDanhMucSP.Where(n => n.MaLoai == MaLoai).ToList();
            if(listDanhMucSP.Count==0)
            {
                ViewBag.SanPham = "Không có sản phẩm nào";
            }
            ViewBag.SanPham = "";
            ViewBag.page = pageNumber;
            ViewBag.loaiSP = loaiSP.MaLoai;
            ViewBag.TenLoaiSP = loaiSP.TenLoai.ToUpper();
            return View(listDanhMucSP.ToPagedList(pageNumber,pageSize));
        }

        public ActionResult ChiTietSanPham(string MaSP)
        {
            return View(db.tDanhMucSP.Where(x=>x.MaSP==MaSP).FirstOrDefault());
        }
    }
}