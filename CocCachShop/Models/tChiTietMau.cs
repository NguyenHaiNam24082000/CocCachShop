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
    
    public partial class tChiTietMau
    {
        public string MaMau { get; set; }
        public string MaSP { get; set; }
    
        public virtual tDanhMucSP tDanhMucSP { get; set; }
        public virtual tMauSac tMauSac { get; set; }
    }
}
