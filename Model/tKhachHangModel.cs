using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Framework;
using System.Data.SqlClient;

namespace Model
{
    public class tKhachHangModel
    {
        private QuanLiBanHangDBContext context = null;
        public tKhachHangModel()
        {
            context = new QuanLiBanHangDBContext();
        }
        public int Signin(string username,string password)
        {
            //SqlParameter parameterUser = new SqlParameter("@username", username);
            //SqlParameter parameterPass = new SqlParameter("@password", password);
            //var res = context.Database.ExecuteSqlCommand("sp_signin @username,@password", parameterUser, parameterPass);
            tKhachHang tKhachHang = context.tKhachHang.Where(x =>x.Password == password && x.Username.ToUpper() == username.ToUpper()).FirstOrDefault();
            if (tKhachHang == null) return 0;
            else return 1;
        }

    }
}
