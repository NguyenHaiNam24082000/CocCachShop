using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Areas.Admin.Code;
using CocCachShop.Models;

namespace CocCachShop.Areas.Admin.Controllers
{
    public class SanPhamController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        
        public List<Product> getListProduct()
        {
            List<Product> sp = new List<Product>();
            var item = (from p in db.tDanhMucSP select p).ToList();
            foreach (var i in item)
            {
                Product d = new Product
                {
                    MaSP = i.MaSP,
                    TenSP = i.TenSP,
                    Gia = i.Gia,
                    KhuyenMai = i.KhuyenMai,
                    MaLoai = i.MaLoai,
                    SoLuong = i.SoLuong,
                };

                sp.Add(d);
            }
            return sp;
        }

        [HttpDelete]
        [Route("api/products/delete/{MaSP}")]
        public bool deleteProduct(string MaSP)
        {
            try
            {
                var tanh = db.tAnh.Where(x => x.MaSP.Trim() == MaSP.Trim()).ToList();
                if(tanh.Count>0)
                {
                    db.tAnh.RemoveRange(tanh);
                }    
                tDanhMucSP danhMucSP = db.tDanhMucSP.Where(x => x.MaSP.Trim() == MaSP.Trim()).FirstOrDefault();
                db.tDanhMucSP.Remove(danhMucSP);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpPut]
        [Route("api/products/put/item")]
        public bool editProduct([FromBody] Product product)
        {
            try
            {
                tDanhMucSP danhMucSP = db.tDanhMucSP.Where(x => x.MaSP.Trim() == product.MaSP.Trim()).FirstOrDefault();
                db.tDanhMucSP.Remove(danhMucSP);
                tDanhMucSP dp = new tDanhMucSP()
                {
                    MaSP = product.MaSP,
                    TenSP = product.TenSP,
                    Gia = product.Gia,
                    KhuyenMai = product.KhuyenMai,
                    LuotXem = 0,
                    MaCL = "CL01",
                    MaHangSX = null,
                    MaLoai = product.MaLoai,
                    MaMau = null,
                    MoTa = null,
                    SoLuong = product.SoLuong,
                };
                db.tDanhMucSP.Add(dp);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpPost]
        [Route("api/products/post/item")]
        public bool postProduct([FromBody] Product product)
        {
            try
            {
                tDanhMucSP dp = new tDanhMucSP()
                {
                    MaSP = product.MaSP,
                    TenSP = product.TenSP,
                    Gia = product.Gia,
                    KhuyenMai = product.KhuyenMai,
                    LuotXem = 0,
                    MaCL = "CL01",
                    MaHangSX = null,
                    MaLoai = product.MaLoai,
                    MaMau = null,
                    MoTa = null,
                    SoLuong = product.SoLuong,
                };
                db.tDanhMucSP.Add(dp);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("api/LoaiSP")]
        public List<tLoaiSP> GetLoaiSP()
        {
            return db.tLoaiSP.ToList();
        }

        [HttpGet]
        public Product getProduct(string masp)
        {
            var i = (from p in db.tDanhMucSP where p.MaSP.Trim()==masp.Trim() select p).FirstOrDefault();
            if (i != null)
            {
                Product sp = new Product
                {
                    MaSP = i.MaSP,
                    TenSP = i.TenSP,
                    Gia = i.Gia,
                    KhuyenMai = i.KhuyenMai,
                    MaLoai = i.MaLoai,
                    SoLuong = i.SoLuong,
                };
                return sp;
            }
            else return null;
        }

    }
}
