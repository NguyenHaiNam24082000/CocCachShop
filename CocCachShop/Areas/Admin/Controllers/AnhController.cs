using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CocCachShop.Models;
using CocCachShop.Areas.Admin.Code;

namespace CocCachShop.Areas.Admin.Controllers
{
    public class AnhController : ApiController
    {
        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        [HttpPut]
        public bool EditAnh([FromBody] AnhClass anhClass)
        {
            var anh = db.tAnh.Where(x => x.MaAnh == anhClass.MaAnh && x.MaSP == anhClass.MaSP);
            if (anh == null) return false;
            tAnh tanh = new tAnh
            {
                MaAnh = anhClass.MaAnh,
                MaSP = anhClass.MaSP,
                LinkAnh = anhClass.link,
            };
            db.tAnh.Remove((tAnh)anh);
            db.tAnh.Add(tanh);
            db.SaveChanges();
            return true;
        }
        [HttpPost]
        [Route("api/Anh/post")]
        public bool PostAnh([FromBody] AnhClass anhClass)
        {
            tAnh tanh = new tAnh
            {
                MaAnh = anhClass.MaAnh,
                MaSP = anhClass.MaSP,
                LinkAnh = anhClass.link,
            };
            db.tAnh.Add(tanh);
            db.SaveChanges();
            return true;
        }

        [HttpGet]
        public List<AnhClass> GetAnhClass()
        {
            IList<AnhClass> prodsList = new List<AnhClass>();
            var query = (from prods in db.tAnh select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new AnhClass
                {
                    MaAnh = item.MaAnh,
                    MaSP = item.MaSP,
                    link = item.LinkAnh,

                });
            }
            return (List<AnhClass>)prodsList;
        }

        [HttpGet]
        public List<AnhClass> GetAnhItem(string maSP)
        {
            IList<AnhClass> prodsList = new List<AnhClass>();
            var query = (from prods in db.tAnh where prods.MaSP==maSP select prods).ToList();
            foreach (var item in query)
            {
                prodsList.Add(new AnhClass
                {
                    MaAnh = item.MaAnh,
                    MaSP = item.MaSP,
                    link = item.LinkAnh,

                });
            }
            return (List<AnhClass>)prodsList;
        }
    }
}
