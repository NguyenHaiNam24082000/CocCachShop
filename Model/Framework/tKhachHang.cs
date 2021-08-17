namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tKhachHang")]
    public partial class tKhachHang
    {
        [Key]
        [StringLength(10)]
        public string IDKhach { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(50)]
        public string HoTen { get; set; }

        [StringLength(50)]
        public string SDT { get; set; }

        [StringLength(300)]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string GioiTinh { get; set; }
    }
}
