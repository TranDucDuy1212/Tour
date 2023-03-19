//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLTour.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tour
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tour()
        {
            this.BinhLuans = new HashSet<BinhLuan>();
            this.BinhLuans1 = new HashSet<BinhLuan>();
            this.DatTours = new HashSet<DatTour>();
            this.DatTours1 = new HashSet<DatTour>();
        }
    
        public int ID { get; set; }
        public string Ten { get; set; }
        public Nullable<decimal> Gia { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string MoTa { get; set; }
        public string Hinh { get; set; }
        public Nullable<System.DateTime> NgayKhoiHanh { get; set; }
        public Nullable<System.DateTime> NgayKetThuc { get; set; }
        public string DiemKhoiHanh { get; set; }
        public string DiemDen { get; set; }
        public string LoaiTourID { get; set; }
        public Nullable<int> TongVeBan { get; set; }
        public int ThoiGian
        {
            get
            {
                DateTime ngaymuon = Convert.ToDateTime(NgayKhoiHanh);
                DateTime ngaytra = Convert.ToDateTime(NgayKetThuc);
                TimeSpan Time = ngaytra - ngaymuon;
                int TongSoNgay = Time.Days;
                return TongSoNgay;
            }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatTour> DatTours { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatTour> DatTours1 { get; set; }
        public virtual DiaDiem DiaDiem { get; set; }
        public virtual DiaDiem DiaDiem1 { get; set; }
        public virtual DiaDiem DiaDiem2 { get; set; }
        public virtual DiaDiem DiaDiem3 { get; set; }
        public virtual LoaiTour LoaiTour { get; set; }
        public virtual LoaiTour LoaiTour1 { get; set; }
    }
}
