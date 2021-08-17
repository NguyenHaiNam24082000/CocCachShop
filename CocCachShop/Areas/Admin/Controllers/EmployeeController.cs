using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;

namespace CocCachShop.Areas.Admin.Controllers
{
    public class EmployeeController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        public IEnumerable<tNhanVien> GetAllProducts()
        {
            IList<tNhanVien> prodsList = new List<tNhanVien>();
            var query = (from prods in db.tNhanVien select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new tNhanVien
                {
                    MaNV = item.MaNV,
                    HoTen = item.HoTen,
                    GioiTinh = item.GioiTinh,
                    SDT = item.SDT,
                    QuyenAdmin = item.QuyenAdmin
                });
            }
            return prodsList;
        }

        // GET api/Products?MaLoai=...
        public IEnumerable<tNhanVien> GetProductsByCatID(string MaNV)
        {

            IList<tNhanVien> prodsList = new List<tNhanVien>();
            var query = (from prods in db.tNhanVien where prods.MaNV == MaNV select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new tNhanVien
                {
                    MaNV = item.MaNV,
                    HoTen = item.HoTen,
                    GioiTinh = item.GioiTinh,
                    SDT = item.SDT,
                    QuyenAdmin = item.QuyenAdmin
                });
            }
            return prodsList;
        }

        // POST api/values
        [HttpPost]
        public bool InsertNew(string id, string hoten, string gioitinh, string sdt, int quyen)
        {
            try
            {
               
                tNhanVien NV = new tNhanVien();
                NV.MaNV = id;
                NV.HoTen = hoten;
                NV.GioiTinh = gioitinh;
                NV.SDT = sdt;
                NV.QuyenAdmin = quyen;
                db.tNhanVien.Add(NV);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        // PUT api/values/5
        [HttpPut]
        public bool Update(string id, string hoten, string gioitinh, string sdt, int quyen)
        {
            try
            {
          
                //Lấy mã khách đã có
                tNhanVien NV = db.tNhanVien.FirstOrDefault(x => x.MaNV == id);
                if (NV == null) return false;
                NV.MaNV = id;
                NV.HoTen = hoten;
                NV.GioiTinh = gioitinh;
                NV.SDT = sdt;
                NV.QuyenAdmin = quyen;
               

                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // DELETE 
        [HttpDelete]
        [Route("api/Employee/delete/{id}")]
        public bool Delete(string id)
        {

            //Lấy mã khách đã có
            tNhanVien SP = db.tNhanVien.FirstOrDefault(x => x.MaNV == id);

            if (SP == null) return false;
            //var p=dbSP.ExecuteCommand($"delete from ChiTietHDB where MaHQ={SP.MaHQ}");

            db.tNhanVien.Remove(SP);
            db.SaveChanges();
            return true;
        }
    }
}
