using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using QLTour.Models;

namespace QLTour.Controllers
{
    public class HomeController : Controller
    {
        QLTourEntities db = new QLTourEntities();

        public ActionResult Index(string id = null, string startDate = null)
        {
            if (startDate != null)
            {
                DateTime time = Convert.ToDateTime(startDate);
                if (id == null)
                {
                    var tour = db.Tours.Where(s => s.NgayKhoiHanh >= time).OrderByDescending(s=>s.ID).ToList();
                    if (tour.ToList().Count() == 0)
                    {
                        ViewBag.Msg = "Không có tour";
                    }
                    
                    return View(tour);
                }
                else
                {
                    if (id.Contains("NN") == false)
                    {
                        var tour = db.Tours.Where(s => s.DiemDen.Contains(id)).Where(s => s.NgayKhoiHanh >= time).OrderByDescending(s => s.ID);
                        if (tour.ToList().Count() == 0)
                        {
                            ViewBag.Msg = "Không có tour";
                        }
                        return View(tour);
                    }
                    else
                    {
                        var tour = db.Tours.Where(s => s.DiemDen.Contains("VNM") == false).Where(s => s.NgayKhoiHanh >= time).OrderByDescending(s => s.ID);
                        if (tour.ToList().Count() == 0)
                        {
                            ViewBag.Msg = "Không có tour";
                        }
                        return View(tour);
                    }
                }
            }
            else
            {
                DateTime time = DateTime.Now;
                if (id == null)
                {
                    var tour = db.Tours.Where(s => s.NgayKhoiHanh > time).OrderByDescending(s => s.ID).ToList();
                    if (tour.ToList().Count() == 0)
                    {
                        ViewBag.Msg = "Không có tour";
                    }

                    return View(tour);
                }
                else
                {
                    if (id.Contains("NN") == false)
                    {
                        var tour = db.Tours.Where(s => s.DiemDen.Contains(id)).Where(s => s.NgayKhoiHanh > time).OrderByDescending(s => s.ID);
                        if (tour.ToList().Count() == 0)
                        {
                            ViewBag.Msg = "Không có tour";
                        }
                        return View(tour);
                    }
                    else
                    {
                        var tour = db.Tours.Where(s => s.DiemDen.Contains("VNM") == false).Where(s => s.NgayKhoiHanh > time).OrderByDescending(s => s.ID);
                        if (tour.ToList().Count() == 0)
                        {
                            ViewBag.Msg = "Không có tour";
                        }
                        return View(tour);
                    }
                }
            }
        }
        public ActionResult Details(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tour tour = db.Tours.Find(id);
            if (tour == null)
            {
                return HttpNotFound();
            }
            return View(tour);
        }  

        public ActionResult BookingHistory()
        {
            string email = User.Identity.GetUserName();
            var user = db.NguoiDungs.FirstOrDefault(s => s.Email.Contains(email));
            var ve = db.DatTours.Where(s => s.NguoiDungID == user.ID).ToList();

            if(ve.Count == 0)
            {
                ViewBag.Msg = "Khách hàng chưa đặt tour nào";
                return View();
            }
            else 
            {
                return View(ve);
            }

        }
        public ActionResult InformationUser()
        {
            string email = User.Identity.GetUserName();
            var user = db.NguoiDungs.FirstOrDefault(s => s.Email.Contains(email));

            return View(user);
        }

        public ActionResult EditProfile()
        {
            string email = User.Identity.GetUserName();
            var user = db.NguoiDungs.FirstOrDefault(s => s.Email.Contains(email));
            ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProfile([Bind(Include = "Ten,SDT,DiaChi,Email,ThanhPhoID,Passport")] NguoiDung user)
        {
            if (ModelState.IsValid)
            {
                string email = User.Identity.GetUserName();
                var ktEmail = db.NguoiDungs.FirstOrDefault(s => s.Email.Contains(email));

                if (user.Ten == null || user.Ten == "")
                {
                    ViewBag.MsgTen = "Vui lòng nhập tên";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }

                if (user.SDT == null || user.SDT == "")
                {
                    ViewBag.MsgSDT = "Vui lòng nhập số điện thoại";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }
                else if (user.SDT.Length < 10 || user.SDT.Length > 12)
                {
                    ViewBag.MsgSDT = "Định dạng số điện thoại không đúng";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }

                if (user.Passport == null || user.Passport == "")
                {
                    ViewBag.MsgPassport = "Vui lòng nhập Passport";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }
                else if (user.Passport.Length != 8)
                {
                    ViewBag.MsgPassport = "Passport có 8 ký tự";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }

                if (user.DiaChi == null || user.DiaChi == "")
                {
                    ViewBag.MsgDiaChi = "Vui lòng nhập địa chỉ";
                    ViewBag.Email = email;
                    ViewBag.Ten = user.Ten;
                    ViewBag.SDT = user.SDT;
                    ViewBag.DiaChi = user.DiaChi;
                    ViewBag.Passport = user.Passport;
                    ViewBag.ThanhPhoID = new SelectList(db.ThanhPhoes, "ID", "Ten", user.ThanhPhoID);
                    return View("EditProfile");
                }

                if (ktEmail.Email == null)
                {
                    user.Email = email;
                    db.NguoiDungs.Add(user);
                    db.SaveChanges();
                }
                else
                {
                    ktEmail.Email = email;
                    ktEmail.Ten = user.Ten;
                    ktEmail.SDT = user.SDT;
                    ktEmail.DiaChi = user.DiaChi;
                    ktEmail.Passport = user.Passport;
                    ktEmail.ThanhPhoID = user.ThanhPhoID;
                    db.Entry(ktEmail).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("InformationUser");
                }

                return View("EditProfile");
            }

            return View(user);
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
    }
}