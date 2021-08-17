using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Models
{
    public class KhachHang
    {
        public string IDKhach { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string HoTen { get; set; }
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public string GioiTinh { get; set; }
        public string Email { get; set; }
        public Nullable<int> TongTien { get; set; }
    }
}