using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CocCachShop.Models;

namespace CocCachShop.Controllers
{
    public class ShoppingCartController : Controller
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        // GET: ShoppingCart
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if(cart==null||Session["Cart"]==null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        public ActionResult AddtoCart(string id,int sl)
        {
            var pro = db.tDanhMucSP.SingleOrDefault(s => s.MaSP == id);
            if(pro!=null)
            {
                GetCart().Add(pro,sl);
            }
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult ShowToCart()
        {
            if (Session["Cart"] == null)
                return RedirectToAction("ShowToCart", "ShoppingCart");
            Cart cart = Session["Cart"] as Cart;
            return View(cart);
        }
        public ActionResult UpdateSoLuong(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            string id = form["MaSP"];
            int sl = int.Parse(form["Soluong"]);
            cart.UpdateSoLuong(id, sl);
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult RemoveCart(string id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove(id);
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }

        public PartialViewResult BagCart()
        {
            int total_item = 0;
            return null;
        }
    }
}