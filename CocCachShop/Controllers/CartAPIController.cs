using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;

namespace CocCachShop.Controllers
{
    public class CartAPIController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [HttpGet]
        public List<tDonHang> getDonHang()
        {
            return db.tDonHang.ToList();
        }
        public string id = "";
        [HttpPost]
        public bool postDonHang(string idkhach,int tongtien)
        {
            try
            {
                var idDonHang = db.tDonHang.Max(x => x.MaDonHang.Trim());
                var index = ((int.Parse(idDonHang) + 1) + "").Length;
                id = "";
                for (var i = 0; i < 3 - index; ++i)
                {
                    id += "0";
                }
                id += (int.Parse(idDonHang) + 1) + "";
                tDonHang dh = new tDonHang
                {
                    IDKhach = idkhach,
                    MaDonHang = id,
                    MaVanChuyen = "MVC001    ",
                    MaNV = "NV004",
                    TongTien = tongtien,
                    NgayBan = "2021-05-06",
                };
                db.tDonHang.Add(dh);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [Route("api/Cart")]
        [HttpPost]
        public bool postCart([FromBody] CartModel cart)
        {
            try
            {
               
                tChiTietHDB dp = new tChiTietHDB()
                    {
                        MaSP = cart.MaSP,
                        MaDonHang=cart.MaDonHang,
                        SoLuong= cart.SoLuong,
                        Gia = cart.Gia,
                        TongTien = cart.TongTien,
                    };
                
                db.tChiTietHDB.Add(dp);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }       
        }

    }
}
