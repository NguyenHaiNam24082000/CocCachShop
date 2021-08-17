using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;
namespace CocCachShop.Areas.Admin.Controllers
{
    public class CustomerController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [Route("api/getallkh")]
        public IEnumerable<tKhachHang> GetAllProducts()
        {
            IList<tKhachHang> prodsList = new List<tKhachHang>();
            var query = (from prods in db.tKhachHang select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new tKhachHang
                {
                    IDKhach = item.IDKhach,
                    Username = item.Username,
                    Password = item.Password,
                    HoTen = item.HoTen,
                    GioiTinh = item.GioiTinh,
                    SDT = item.SDT,
                    Email = item.Email,
                    DiaChi = item.DiaChi,
                });
            }
            return prodsList;
        }
        [HttpPut]
        [Route("api/putkh")]
        public bool Update(string id, string username, string password, string hoten, string sdt, string adrr, string gioitinh, string email)
        {
            try
            {

                //Lấy mã khách đã có
                tKhachHang kh = db.tKhachHang.FirstOrDefault(x => x.IDKhach == id);
                if (kh == null) return false;
                kh.IDKhach = id;
                kh.Username = username;
                kh.Password = password;
                kh.HoTen = hoten;
                kh.SDT = sdt;
                kh.DiaChi = adrr;
                kh.GioiTinh = gioitinh;
                kh.Email = email;


                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [Route("api/gettn")]
        public IEnumerable<KhachHang> GetTopTN()
        {
            IList<KhachHang> prodsList = new List<KhachHang>();
            var query = (from a in db.tKhachHang
                         join b in db.tDonHang on a.IDKhach equals b.IDKhach
                         select new
                         {

                             IDKhach = b.IDKhach,
                             HoTen = a.HoTen,
                             SDT = a.SDT,
                             DiaChi = a.DiaChi,
                             Email = a.Email,
                             TongTien = b.TongTien,
                         }
                        
                         );
            foreach (var item in query)
            {
                prodsList.Add(new KhachHang()
                {
                    IDKhach = item.IDKhach,
                    HoTen = item.HoTen,
                    SDT = item.SDT,
                    DiaChi = item.DiaChi,
                    Email = item.Email,
                    TongTien = item.TongTien,

                });
            }

            return prodsList;
        }
    }
}
