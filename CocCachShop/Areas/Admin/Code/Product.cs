using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Areas.Admin.Code
{
    public class Product
    {
        public string  MaSP { get; set; }
        public string TenSP { get; set; }
        public int? Gia { get; set; }
        public string KhuyenMai { get; set; }
        public int? SoLuong { get; set; }
        public string MaLoai { get; set; }

    }
}