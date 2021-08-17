using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;

namespace CocCachShop.Areas.Admin.Controllers
{
    public class BillController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        public IEnumerable<tDonHang> GetAll()
        {
            IList<tDonHang> prodsList = new List<tDonHang>();
            var query = (from prods in db.tDonHang select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new tDonHang
                {
                    MaDonHang = item.MaDonHang,
                    IDKhach = item.IDKhach,
                    MaNV = item.MaNV,
                    MaVanChuyen = item.MaVanChuyen,
                    TongTien = item.TongTien,
                    NgayBan = item.NgayBan,
                });
            }
            return prodsList;
        }

        // GET api/Products?MaLoai=...
        public IEnumerable<tDonHang> GetProductsByCatID(string MaDonHang)
        {

            IList<tDonHang> prodsList = new List<tDonHang>();
            var query = (from prods in db.tDonHang where prods.MaDonHang == MaDonHang select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new tDonHang
                {
                    MaDonHang = item.MaDonHang,
                    IDKhach = item.IDKhach,
                    MaNV=item.MaNV,
                    MaVanChuyen = item.MaVanChuyen,
                    TongTien=item.TongTien,
                    NgayBan = item.NgayBan,
                });
            }
            return prodsList;
        }
    }
}
