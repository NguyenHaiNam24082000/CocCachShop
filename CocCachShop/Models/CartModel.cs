using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Models
{
    public class CartModel
    {
        public string IdKhach { get; set; }
        public string MaDonHang { get; set; }
        public string MaSP { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<int> Gia { get; set; }
        public Nullable<int> TongTien { get; set; }
    }
}