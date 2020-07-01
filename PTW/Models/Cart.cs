using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTW.Models
{
    public class Cart
    {
        public string HinhAnh { get; set; }
        public int IDSP { get; set; }
        public string Name { get; set; }
        public int GiaGoc { get; set; }
        public int Size { get; set; }
        public int SoLuong { get; set; }
        public int ThanhTien
        { get { return SoLuong * GiaGoc; } }
    }
}