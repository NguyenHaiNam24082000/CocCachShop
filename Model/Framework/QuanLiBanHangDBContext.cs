using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Model.Framework
{
    public partial class QuanLiBanHangDBContext : DbContext
    {
        public QuanLiBanHangDBContext()
            : base("name=QuanLiBanHangDBContext")
        {
        }

        public virtual DbSet<tKhachHang> tKhachHang { get; set; }
        public virtual DbSet<tNhanVien> tNhanVien { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tKhachHang>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<tNhanVien>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<tNhanVien>()
                .Property(e => e.SDT)
                .IsFixedLength();
        }
    }
}
