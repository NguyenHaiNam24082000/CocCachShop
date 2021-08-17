using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Foods
using Foods.Code;

namespace Foods.Controllers
{
    public class ShoppingHistoryController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [Route("api/history/{iduser}/{madh}")]
        public IEnumerable<History> GetHistory(string iduser, string madh)
        {
            IList<History> hisList = new List<History>();
            var query = (from a in db.DonHangs
                         join b in db.ChiTietDonHangs on a.MaDonHang equals b.MaDonHang
                         join c in db.NhaVanChuyens on a.MaNVC equals c.MaNVC
                         join d in db.SanPhams on b.MaSP equals d.MaSP
                         where a.IDUser == iduser && b.MaDonHang == madh
                         select new
                         {
                             TenSP = d.TenSP,
                             SoLuong = b.SoLuong,
                             DonGia = b.DonGia,
                             KhuyenMai = b.KhuyenMai,
                             NgayDat = a.NgayDat,
                             ThoiGianGiaoHang = a.ThoiGianGiaoHang,
                             TenNVC = c.TenNVC,

                         });
            foreach (var item in query)
            {
                hisList.Add(new History()
                {
                    TenSP = item.TenSP,
                    SoLuong = item.SoLuong,
                    DonGia = item.DonGia,
                    KhuyenMai = item.KhuyenMai,
                    NgayDat = item.NgayDat,
                    ThoiGianGiaoHang = item.ThoiGianGiaoHang,
                    TenNVC = item.TenNVC,
                });
            }
            return hisList;
        }
        [Route("api/bill/{iduser}")]
        public IEnumerable<Bill> GetBill(string iduser)
        {
            IList<Bill> hisList = new List<Bill>();
            var query = (from a in db.DonHangs
                         where a.IDUser == iduser
                         select new
                         {

                             MaDonHang = a.MaDonHang,
                             NgayDat = a.NgayDat,
                             ThoiGianGiaoHang = a.ThoiGianGiaoHang,
                             TongTien = a.TongTien,

                         });
            foreach (var item in query)
            {
                hisList.Add(new Bill()
                {
                    MaDonHang = item.MaDonHang,
                    NgayDat = item.NgayDat,
                    ThoiGianGiaoHang = item.ThoiGianGiaoHang,
                    TongTien = item.TongTien,


                });
            }
            return hisList;
        }

    }
}
