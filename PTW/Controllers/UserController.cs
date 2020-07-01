using PTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PTW.Models;           
using System.Text;
using System.Data.Entity.Validation;

namespace PTW.Controllers
{
    public class UserController : Controller
    {

        // GET: User
        Model1 db = new Model1();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(UserModel user)
        {
            if (ModelState.IsValid)
            {
                //string tmp = user.email;
                UserManagement userManager = new UserManagement();
                Model1 db = new Model1();
                //insert database 
                if (userManager.CheckEmail(user.email) == false && userManager.CheckUserName(user.username) == false)
                {
                    Account userDB = new Account();
                    userDB.Email = user.email;
                    userDB.Username = user.username;

                    userDB.Password = Mahoa.GetMd5Hash(user.password);

                    // userDB.Password = user.password;
                    userDB.Name = user.name;
                    userDB.Address = user.address;
                    userDB.SDT = user.sdt;
                    userDB.Quyen = "customer";
                    db.Account.Add(userDB);
                    db.SaveChanges();
                    return RedirectToAction("Login", "User");

                }
                else
                {
                    ModelState.AddModelError("RegisterFail", "Đăng ký không thành công !");
                    ViewBag.thongbao = "Tên tài khoản hoặc email đã được sử dụng!";
                    return View();
                }
            }
            return View();
        }
        //public ActionResult Register(UserModel user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        //string tmp = user.email;
        //        UserManagement userManager = new UserManagement();
        //        //insert database 
        //        if (userManager.CheckEmail(user.email) == false && userManager.CheckUserName(user.username) == false)
        //        {
        //            Account userDB = new Account();
        //            userDB.Email = user.email;
        //            userDB.Username = user.username;
        //            //userDB.Password = user.password;
        //            userDB.Password = Mahoa.GetMd5Hash(user.password);

        //            // userDB.Password = user.password;
        //            userDB.Name = user.name;
        //            userDB.Address = user.address;
        //            userDB.SDT = user.sdt;
        //            userDB.Quyen = "customer";
        //            db.Account.Add(userDB);
        //            try
        //            {
        //                db.SaveChanges();
        //            }
        //            catch (DbEntityValidationException e)
        //            {
        //                foreach (var eve in e.EntityValidationErrors)
        //                {
        //                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
        //                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
        //                    foreach (var ve in eve.ValidationErrors)
        //                    {
        //                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
        //                            ve.PropertyName, ve.ErrorMessage);
        //                    }
        //                }
        //                throw;
        //            }

        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "Đăng ký không thành công !");
        //            ViewBag.thongbao = "Tên tài khoản hoặc email đã được sử dụng!";
        //            return View();
        //        }
        //    }
        //    return View();
        //}
        //[ChildActionOnly]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        //[ChildActionOnly]
        public ActionResult Login(LoginModel user)
        {
            if (ModelState.IsValid)
            {
                //string tmp = user.email;
                UserManagement userManager = new UserManagement();
                Model1 db = new Model1();
                //insert database 
                if (userManager.CheckLogin(user.username, Mahoa.GetMd5Hash(user.password)) == true)
                {
                    var name = db.Account.Where(n => n.Username == user.username).Select(n => n.Name).SingleOrDefault();
                    //Lưu thông tin User vào Session
                    //var  user_finded = (from nd in db.Account where nd.Username == user.username select (nd => nd.Name)).ToList();

                    Session["user"] = "Xin chào" + " " + name + "!";
                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không thành công !");
                    ViewBag.thongbao = "Tên tài khoản hoặc password không đúng!";
                    //return RedirectToAction("Index", "Home");
                    return View();
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}