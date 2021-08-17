using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace CocCachShop.Models
{
    public class SignupModel
    {
        [Key]
        public string Id { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập tài khoản")]
        public string UserName { set; get; }
        [Required(ErrorMessage = "Bạn chưa nhập họ tên")]
        public string FullName { set; get; }
        [Required(ErrorMessage = "Bạn chưa nhập Mật khẩu")]
        //[RegularExpression()]
        public string Password { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập số điện thoại")]
        [RegularExpression("[0-9]{10}",ErrorMessage ="Bạn chưa đúng nhập định dạng số điện thoại")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập email")]
        [EmailAddress(ErrorMessage ="Bạn chưa nhập đúng định dạng email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu")]
        [Compare("Password",ErrorMessage ="Xác nhận mật khẩu không đúng")]
        public string ConfirmPassword { get; set; }
    }
}