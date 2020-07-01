using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PTW.Models;
using System.Web.Script.Serialization;

namespace PTW.Controllers
{
    public class CartController : Controller
    {
        Model1 db = new Model1();
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var giohang = Session[CartSession];
            var listgh = new List<Cart>();

            if (giohang != null)
            {
                listgh = (List<Cart>)giohang;
            }

            return View(listgh);
        }
        public ActionResult AddtoCart(int id)
        {

            if (Session[CartSession] == null)
            {
                Session[CartSession] = new List<Cart>();

            }
            List<Cart> listgh = Session[CartSession] as List<Cart>;
            if (listgh.Exists(m => m.IDSP == id)) // co sp nay trong gio hang
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                Cart card = listgh.FirstOrDefault(m => m.IDSP == id);
                card.SoLuong++;
            }
            else
            {
                SanPham pro = db.SanPham.Find(id);  // tim sp theo sanPhamID
                Cart newItem = new Cart()
                {
                    IDSP = id,
                    Name = pro.Name,
                    SoLuong = 1,
                    HinhAnh = pro.HinhAnh,
                    GiaGoc = pro.GiaGoc

                };  // Tạo ra 1 CartItem mới

                listgh.Add(newItem);  // Thêm CartItem vào giỏ 
            }

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return RedirectToAction("Index", "Cart", new { IDSP = id });
        }
        public ActionResult Deleted(int id)
        {
            List<Cart> giohang = Session[CartSession] as List<Cart>;
            Cart itemXoa = giohang.FirstOrDefault(m => m.IDSP == id);
            if (itemXoa != null)
                giohang.Remove(itemXoa);
            {
            }
            return RedirectToAction("Index", "Cart");

        }
        public ActionResult Updated(int id, int Soluongmoi)
        {
            // tìm carditem muon sua
            List<Cart> gioHang = Session["CartSession"] as List<Cart>;
            Cart itemSua = gioHang.FirstOrDefault(m => m.IDSP == id);
            if (itemSua != null)
            {
                itemSua.SoLuong = Soluongmoi;
            }
            return RedirectToAction("Index");

        }
        public JsonResult UpdateAll (string  cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<Cart>>(cartModel);
            var sessionCart = (List<Cart>)Session[CartSession];

            foreach(var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.IDSP == item.IDSP);
                if (jsonItem != null)
                {
                     
                    item.SoLuong = jsonItem.SoLuong;
                }    
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status=true
                 
            });
                
        }
        public ActionResult CheckOut()
        {
            var cart = Session[CartSession];
            var listCart = new List<Cart>();
            if (cart != null)
            {
                listCart = (List<Cart>)cart;
            }
            return View(listCart);
        }
        public ActionResult ProcessOrder(FormCollection frc)
        {
            List<Cart> listcart = (List<Cart>)Session[CartSession];
            DonHang donhang = new DonHang()
            {
                
                TenKhachHang = frc["cusName"],
                DiaChiKhachHang = frc["cusAddress"],
                NgayLapDon = DateTime.Now,
                TinhTrangDH = 1,
               
                

            };
            db.DonHang.Add(donhang);
            db.SaveChanges();

            foreach (Cart cart in listcart)
            {
                CTDonHang donhandetail = new CTDonHang()
                {
                    IDDH = donhang.IDDH,
                    IDSP = cart.IDSP,
                    Soluong = cart.SoLuong,
                    GiaBan = cart.GiaGoc,
                    TenSanPham = cart.Name,
                    TongTien = cart.ThanhTien.ToString(),
                    
                };
                db.CTDonHang.Add(donhandetail);
                db.SaveChanges();
            }
            int IDHD = donhang.IDDH;
            Session.Remove(CartSession);
            return RedirectToAction("OrderSuccess", "Cart", new { id = IDHD });
        }
        public ActionResult OrderSuccess (int id)
        {
            DonHang dh = db.DonHang.Where(m => m.IDDH == id).SingleOrDefault();
            return View(dh);
        }
    }
   
}