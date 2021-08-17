using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CocCachShop.Models;
using System.Web.Security;

namespace CocCachShop.Areas.Admin.Controllers
{
    //[RouteArea("Admin")]
    public class UserController : Controller
    {
        // GET: Admin/User
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
        public ActionResult SignIn(SigninModel signinModel)
        {
            //var result = new tKhachHangModel().Signin(signinModel.UserName, MD5.CreateMD5(signinModel.Password));
            //if(result==1 && ModelState.IsValid)
            if (Membership.Providers["AdminMembershipProvider"].ValidateUser(signinModel.UserName, signinModel.Password) && ModelState.IsValid)
            {
                //SessionHelper.SetSession(new KhachHangSession() { UserName = signinModel.UserName });
                FormsAuthentication.SetAuthCookie(signinModel.UserName, false);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không hợp lệ");
            }
            return View(signinModel);
        }

        [HttpGet]
        //[Route("SignIn")]
        public ActionResult SignIn()
        {
            return View();
        }

        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("SignIn", "User");
        }
    }
}