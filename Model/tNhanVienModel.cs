using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Framework;

namespace Model
{
    public class tNhanVienModel
    {
        private QuanLiBanHangDBContext context = null;
        public tNhanVienModel()
        {
            context = new QuanLiBanHangDBContext();
        }
        public int Signin(string username, string password)
        {
            //SqlParameter parameterUser = new SqlParameter("@username", username);
            //SqlParameter parameterPass = new SqlParameter("@password", password);
            //var res = context.Database.ExecuteSqlCommand("sp_signin @username,@password", parameterUser, parameterPass);
            tNhanVien nv = context.tNhanVien.Where(x => x.Password == password && x.MaNV.Trim().ToUpper() == username.ToUpper()).FirstOrDefault();
            if (nv == null) return 0;
            else return 1;
        }
    }
}
