using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CocCachShop.Models
{
    public class CartItem
    {
        public tDanhMucSP ShoppingProduct { get; set; }
        public int SoLuong { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();
        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }
        public void Add(tDanhMucSP pro,int sl=1)
        {
            var item = items.FirstOrDefault(s => s.ShoppingProduct.MaSP == pro.MaSP);
            if(item==null)
            {
                items.Add(new CartItem
                {
                    ShoppingProduct = pro,
                    SoLuong=sl
                });
               
            }
            else
            {
                item.SoLuong += sl;
            }
        }
        public void UpdateSoLuong(string id, int sl)
        {
            var item = items.Find(s => s.ShoppingProduct.MaSP == id);
            if(item!=null)
            {
                item.SoLuong = sl;
            }
        }
        public int TotalMoney()
        {
            var total=items.Sum(s => s.SoLuong * s.ShoppingProduct.Gia);
            if (items.FirstOrDefault() != null)
            {
                if (items.FirstOrDefault().ShoppingProduct.KhuyenMai != null)
                {
                    total = items.Sum(s => s.SoLuong * s.ShoppingProduct.Gia * (100 - int.Parse(s.ShoppingProduct.KhuyenMai)) / 100);
                }
            }
            return (int)total;
        }
        public void Remove(string id)
        {
            items.RemoveAll(s => s.ShoppingProduct.MaSP == id);
        }
    }
}