using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CocCachShop.Models;
using Model;
using CocCachShop.Code;
using System.Web.Security;
using BotDetect.Web.Mvc;

namespace CocCachShop.Controllers
{
    public class UserController : Controller
    {

        QuanLiBanHangEntities db = new QuanLiBanHangEntities();
        // GET: User
        [HttpPost]
        [ValidateAntiForgeryToken]
//        thay thế cách login thông thường với Session truyền thống bằng Custom Membership Provider có sẵn trong.NET.
//- Lợi điểm của phương pháp này là sử dụng được cơ chế bảo mật có sẵn của.NET.
//- Giảm thiểu mã nguồn mỗi khi kiểm tra login
//- Đơn giản để triển khai
//Bao gồm có 3 bước:
//1. Cấu hình trong webconfig.
//2. Tạo lớp CustomMembershipProvider dẫn xuất từ lớp MembershipProvider có sẵn
//3. Thưc hiện validate và set cookie bằng FormAuthentication
//4. Logout cũng bằng FormAuthentication.Logout()
//5. Check đăng nhập hay chưa sử dụng thuộc tính Authorize
        public ActionResult Signin(SigninModel signinModel)
        {
            var result = new tKhachHangModel().Signin(signinModel.UserName, MD5.CreateMD5(signinModel.Password));
            if(result==1 && ModelState.IsValid)
            //if (Membership.ValidateUser(signinModel.UserName,signinModel.Password) && ModelState.IsValid)
            {
                var khachhang = db.tKhachHang.Where(x => x.Username == signinModel.UserName).FirstOrDefault();
                SessionHelper.SetSession(new KhachHangSession() { UserName = signinModel.UserName,Name= khachhang.HoTen,Id=khachhang.IDKhach });
                //FormsAuthentication.SetAuthCookie(signinModel.UserName,false);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không hợp lệ");
            }
            return View(signinModel);
        }

        [HttpGet]
        public ActionResult Signin()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(SignupModel model)
        {
            if(ModelState.IsValid)
            {
                if(CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if(CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    string maKH = db.tKhachHang.Max(i => i.IDKhach);
                    int len = 7;
                    maKH = maKH.Replace("IDK", "");
                    int ma = int.Parse(maKH);
                    int lenMa = (ma + "").Length;
                    string maAuto = ((ma+1) + "");
                    for(int i=0;i<(len-lenMa-3);++i)
                    {
                        maAuto = "0" + maAuto;
                    }
                    maAuto = "IDK" + maAuto;
                    var kh = new tKhachHang
                    {
                        IDKhach = maAuto,
                        Password = MD5.CreateMD5(model.Password),
                        SDT =model.PhoneNumber,
                        HoTen= model.FullName,
                        Username=model.UserName
                    };
                    db.tKhachHang.Add(kh);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }    
            }
            return View();
        }

        private bool CheckUserName(string username)
        {
            return db.tKhachHang.Count(x => x.Username.ToLower() == username.ToLower())>0;
        }
        private bool CheckEmail(string email)
        {
            return db.tKhachHang.Count(x => x.Email == email) > 0;
        }

        public ActionResult Signout()
        {
            SessionHelper.SetSession(null);
            return RedirectToAction("Index","Home");
        }

        public ActionResult GetPassword()
        {
            return View();
        }

        public ActionResult Profile()
        {
            return View();
        }

        public ActionResult Edit()
        {
            return View();
        }    


    }
}