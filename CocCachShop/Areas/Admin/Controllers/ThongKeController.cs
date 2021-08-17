using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;


namespace CocCachShop.Areas.Admin.Controllers
{
    public class ThongKeController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [Route("api/getSp")]
        //xong r
        public IEnumerable<tDanhMucSP> GetAllProducts()
        {
            IList<tDanhMucSP> productsList = new List<tDanhMucSP>();
            var query = (from prods in db.tDanhMucSP select prods).ToList();
            foreach (var item in query)
            {

                productsList.Add(new tDanhMucSP
                {
                    MaSP = item.MaSP,
                    TenSP = item.TenSP,

                });
            }
            return productsList;
        }
        [Route("api/getkh")]
        public IEnumerable<tKhachHang> GetAllCustomer()
        {
            IList<tKhachHang> productsList = new List<tKhachHang>();
            var query = (from prods in db.tKhachHang select prods).ToList();
            foreach (var item in query)
            {

                productsList.Add(new tKhachHang
                {
                    IDKhach = item.IDKhach,


                });
            }
            return productsList;
        }
        [Route("api/getnv")]
        public IEnumerable<tNhanVien> GetAllEmployee()
        {
            IList<tNhanVien> productsList = new List<tNhanVien>();
            var query = (from prods in db.tNhanVien select prods).ToList();
            foreach (var item in query)
            {

                productsList.Add(new tNhanVien
                {
                    MaNV = item.MaNV,


                });
            }
            return productsList;
        }
        [Route("api/gettopsp")]
        public IEnumerable<DanhMucSP> GetTopSP()
        {
            IList<DanhMucSP> prodsList = new List<DanhMucSP>();
            var query = (from a in db.tChiTietHDB
                         join b in db.tDonHang on a.MaDonHang equals b.MaDonHang
                         join c in db.tDanhMucSP on a.MaSP equals c.MaSP

                         select new
                         {
                             MaSP = a.MaSP,
                             SoLuong = a.SoLuong,
                             TenSP = c.TenSP,
                             NgayBan = b.NgayBan,
                             Gia = c.Gia,
                             //    LinkAnh=abc.LinkAnh,
                         } into x
                         group x by new { x.MaSP, x.TenSP, x.NgayBan ,x.Gia} into g
                         select new
                         {
                             MaSP = g.Key.MaSP,
                             SoLuong = g.Sum(x => x.SoLuong),
                             TenSP = g.Key.TenSP,
                             NgayBan = g.Key.NgayBan,
                             Gia=g.Key.Gia,
                             //   LinkAnh = g.Key.LinkAnh,
                         }
                         //thế thì chỉ cần tạo 1 model thôi

                ) ;
            foreach (var item in query)
            {
                prodsList.Add(new DanhMucSP()
                {
                    MaSP = item.MaSP,
                    SoLuong = item.SoLuong,
                    TenSP = item.TenSP,
                    NgayBan = item.NgayBan,
                    Gia=item.Gia,
                

                });
            }

            return prodsList;
        }
        [Route("api/gettopnv")]
        public IEnumerable<DanhMucSP> GetTopNV()
        {
            IList<DanhMucSP> prodsList = new List<DanhMucSP>();
            var query = (from a in db.tNhanVien
                         join b in db.tDonHang on a.MaNV equals b.MaNV
                         join c in db.tChiTietHDB on b.MaDonHang equals c.MaDonHang
                         select new
                         {

                             MaNV = b.MaNV,
                             HoTen = a.HoTen,
                             NgayBan=b.NgayBan,
                             SoLuong=c.SoLuong,
                           
                         } into x
                         group x by new { x.MaNV, x.HoTen,x.NgayBan} into g
                         select new
                         {
                             MaNV = g.Key.MaNV,
                             SoLuong = g.Sum(x => x.SoLuong),
                             HoTen = g.Key.HoTen,
                             NgayBan = g.Key.NgayBan,
                            
                         }

                );
            foreach (var item in query)
            {
                prodsList.Add(new DanhMucSP()
                {
                    MaNV = item.MaNV,
                    SoLuong = item.SoLuong,
                    HoTen = item.HoTen,
                    NgayBan = item.NgayBan,
                   

                });
            }

            return prodsList;
        }
        [Route("api/getdt")]
        //xong r
        public IEnumerable<tDonHang> GetDT()
        {
            IList<tDonHang> productsList = new List<tDonHang>();
            var query = (from prods in db.tDonHang select prods).ToList();
            foreach (var item in query)
            {

                productsList.Add(new tDonHang
                {
                    NgayBan = item.NgayBan,
                    TongTien = item.TongTien,

                });
            }
            return productsList;
        }

    }

}
