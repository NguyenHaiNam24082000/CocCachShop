//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CocCachShop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tDanhMucSP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tDanhMucSP()
        {
            this.tChiTietMau = new HashSet<tChiTietMau>();
            this.tDanhGia = new HashSet<tDanhGia>();
        }
    
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public Nullable<int> Gia { get; set; }
        public string MaMau { get; set; }
        public string KhuyenMai { get; set; }
        public Nullable<int> LuotXem { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string MoTa { get; set; }
        public string MaCL { get; set; }
        public string MaHangSX { get; set; }
        public string MaLoai { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tChiTietMau> tChiTietMau { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tDanhGia> tDanhGia { get; set; }
    }
}