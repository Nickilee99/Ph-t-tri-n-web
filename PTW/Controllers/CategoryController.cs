using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PTW.Models;

namespace PTW.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getCategory(int id)
        {
            Model1 db = new Model1();
            List<SanPham> listcat = db.SanPham.Where(p => p.IDDM == id).ToList();
            return View(listcat);
        }
        public ActionResult ProductDetail(int id)
        {
            Model1 db = new Model1();
            SanPham pro = db.SanPham.Where(p => p.IDSP == id).SingleOrDefault();
            return View(pro);
        }
        [ChildActionOnly]
        public ActionResult SaleProduct()
        {
            Model1 db = new Model1();
            List<SanPham> salepro = (from s in db.SanPham where s.Sale ==1 select s).ToList();
            return PartialView(salepro);
        }
    }
}