namespace PTW.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            CTDonHang = new HashSet<CTDonHang>();
        }

        [Key]
        public int IDSP { get; set; }

        public int IDDM { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public string HinhAnh { get; set; }

        [Required]
        [StringLength(50)]
        public string Size { get; set; }

        [StringLength(50)]
        public string ChatLieu { get; set; }

        public int GiaGoc { get; set; }

        [StringLength(50)]
        public string MoTa { get; set; }

        public int Sale { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDonHang> CTDonHang { get; set; }

        public virtual DMSP DMSP { get; set; }
    }
}
