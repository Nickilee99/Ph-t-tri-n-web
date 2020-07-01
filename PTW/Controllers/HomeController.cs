using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PTW.Models;

namespace PTW.Controllers
{
    public class HomeController : Controller
    {
        private const string CartSession = "CartSession";
        Model1 db = new Model1();
        public ActionResult Index()
        {
            List<SanPham> listpro = db.SanPham.Take(8).ToList<SanPham>();
            return View(listpro);
        }
        [ChildActionOnly]
        public ActionResult LoadCategory()
        {
            List<DMSP> listcat = db.DMSP.ToList<DMSP>();
            return PartialView(listcat);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var giohang = Session[CartSession];
            var listgh = new List<Cart>();

            if (giohang != null)
            {
                listgh = (List<Cart>)giohang;
            }
            return PartialView(listgh);
        }
    }
}