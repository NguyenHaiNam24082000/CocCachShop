using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace CocCachShop.Models
{
    public class SigninModel
    {
        [Required(ErrorMessage ="Bạn chưa nhập tài khoản")]
        public string UserName { set; get; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu")]
        public string Password { get; set; }
    }
}