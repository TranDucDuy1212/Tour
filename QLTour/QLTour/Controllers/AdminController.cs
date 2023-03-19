using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLTour.Models;
using PagedList;
using System.Web.UI.WebControls;
using System.Collections;

namespace QLTour.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private QLTourEntities db = new QLTourEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Tour(int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var tour = db.Tours.Include(s=>s.LoaiTour).OrderBy(s=>s.ID);
            return View(tour.ToPagedList(pageNum, pageSize));
        }

        public ActionResult TourDetail(int id)
        {
            var tour = db.Tours.Find(id);
            return View(tour);
        }

        public ActionResult EditTour(int id)
        {
            var tour = db.Tours.Find(id);
            ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten", tour.DiemDen);
            ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten", tour.DiemKhoiHanh);
            ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
            ViewBag.NgayKetThuc = tour.NgayKetThuc;
            ViewBag.Hinh = tour.Hinh;
            ViewBag.MoTa = tour.MoTa;
            return View(tour);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditTour([Bind(Include = "ID,Ten,Gia,NgayKhoiHanh,NgayKetThuc, DiemKhoiHanh, DiemDen")] Tour tour, string description, HttpPostedFileBase HinhSP)
        {
            if (ModelState.IsValid)
            {
                if (tour.Ten == null || tour.Ten == "")
                {
                    ViewBag.MsgTen = "Vui lòng nhập tên tour";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (tour.Gia == null)
                {
                    ViewBag.MsgGia = "Vui lòng nhập giá";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (tour.DiemKhoiHanh.Contains(tour.DiemDen))
                {
                    ViewBag.MsgDiemDen = "Vui lòng không chọn điểm đến trùng với điểm khởi hành";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                DateTime time = DateTime.Now;

                if (tour.NgayKhoiHanh == null)
                {
                    ViewBag.MsgNgayKhoiHanh = "Vui lòng chọn ngày khởi hành";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }
                else if (Convert.ToDateTime(tour.NgayKhoiHanh) <= Convert.ToDateTime(time))
                {
                    ViewBag.MsgNgayKhoiHanh = "Vui lòng không chọn ngày khởi hành trùng với ngày hiện tại và quá khứ";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (tour.NgayKetThuc == null)
                {
                    ViewBag.MsgNgayKetThuc = "Vui lòng chọn ngày kết thúc";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }
                else if (tour.NgayKetThuc == tour.NgayKhoiHanh)
                {
                    ViewBag.MsgNgayKetThuc = "Vui lòng không chọn ngày kết thúc trùng với ngày khởi hành";
                    ViewBag.Mota = description;
                    //ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    //ViewBag.NgayKetThuc = tour.NgayKetThuc;
                    ViewBag.Hinh = tour.Hinh;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (HinhSP != null && HinhSP.ContentLength > 0)
                {
                    string filename = Path.GetFileName(HinhSP.FileName);
                    string path = Server.MapPath("~/Images/" + filename);
                    tour.Hinh = @"Images/" + filename;
                    HinhSP.SaveAs(path);
                }

                var loaiTour = db.DiaDiems.FirstOrDefault(s => s.ID.Contains(tour.DiemDen));
                if (loaiTour != null)
                {
                    tour.LoaiTourID = loaiTour.LoaiTourID;
                }

                var ktTour = db.Tours.Find(tour.ID);


                if (ktTour != null)
                {
                    if(HinhSP == null)
                    {
                        tour.Hinh = ktTour.Hinh;
                    }
                    tour.MoTa = description;
                    db.Tours.AddOrUpdate(tour);
                    db.SaveChanges();
                    return RedirectToAction("Tour", "Admin");
                }

            }

            ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
            ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
            return View(tour);
        }
        public ActionResult CreateTour()
        {
            ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
            ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTour([Bind(Include = "Ten,Gia,NgayKhoiHanh,NgayKetThuc, DiemKhoiHanh, DiemDen")] Tour tour, string description, HttpPostedFileBase HinhSP)
        {
            if (ModelState.IsValid)
            {
                if (tour.Ten == null || tour.Ten == "")
                {
                    ViewBag.MsgTen = "Vui lòng nhập tên tour";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (tour.Gia == null)
                {
                    ViewBag.MsgGia = "Vui lòng nhập giá";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (tour.DiemKhoiHanh.Contains(tour.DiemDen))
                {
                    ViewBag.MsgDiemDen = "Vui lòng không chọn điểm đến trùng với điểm khởi hành";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                DateTime time = DateTime.Now;

                if(tour.NgayKhoiHanh ==  null)
                {
                    ViewBag.MsgNgayKhoiHanh = "Vui lòng chọn ngày khởi hành";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }    
                else if (Convert.ToDateTime(tour.NgayKhoiHanh) <= Convert.ToDateTime(time))
                {
                    ViewBag.MsgNgayKhoiHanh = "Vui lòng không chọn ngày khởi hành trùng với ngày hiện tại và quá khứ";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if(tour.NgayKetThuc == null)
                {
                    ViewBag.MsgNgayKetThuc = "Vui lòng chọn ngày kết thúc";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }    
                else if (tour.NgayKetThuc == tour.NgayKhoiHanh)
                {
                    ViewBag.MsgNgayKetThuc = "Vui lòng không chọn ngày kết thúc trùng với ngày khởi hành";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if (HinhSP != null && HinhSP.ContentLength > 0)
                {
                    string filename = Path.GetFileName(HinhSP.FileName);
                    string path = Server.MapPath("~/Images/" + filename);
                    tour.Hinh = @"Images/" + filename;
                    HinhSP.SaveAs(path);
                }
                else
                {
                    ViewBag.MsgHinh = "Vui lòng không để hình trống";
                    ViewBag.Mota = description;
                    ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
                    ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
                    return View(tour);
                }

                if(description != null)
                {
                    tour.MoTa = description;
                }

                var loaiTour = db.DiaDiems.FirstOrDefault(s => s.ID.Contains(tour.DiemDen));

                if (loaiTour != null)
                {
                    tour.LoaiTourID = loaiTour.LoaiTourID;
                    db.Tours.Add(tour);
                    db.SaveChanges();
                    return RedirectToAction("Tour","Admin");
                }    
                
            }
            ViewBag.DiemDen = new SelectList(db.DiaDiems, "ID", "Ten");
            ViewBag.DiemKhoiHanh = new SelectList(db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM")), "ID", "Ten");
            return View(tour);
        }

        public ActionResult DeleteTour(int id)
        {
            Tour tour = db.Tours.Find(id);
            return View(tour);
        }

        [HttpPost, ActionName("DeleteTour")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tour tour = db.Tours.Find(id);
            db.Tours.Remove(tour);
            db.SaveChanges();
            return RedirectToAction("Tour");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult StatisticTour()
        {
            var ve = db.DatTours.GroupBy(s => s.TourID).Select(g=> new {TongVe = g.Sum(gg=>gg.SoLuong), TourID = g.Key}).ToList();
            var tour = db.Tours.ToList();

            foreach(var s in ve)
            {
                foreach(var t in tour)
                {
                    if (s.TourID == t.ID)
                    {
                        t.TongVeBan = s.TongVe;
                        break;
                    }                      
                }    
            }    
            
            return View(tour);
        }

        public ActionResult User()
        {
            var user = db.NguoiDungs.ToList();
            return View(user);
        }
        public ActionResult StatisticUser(int? id)
        {
            var ve = db.DatTours.Where(s=>s.NguoiDungID == id).GroupBy(s => s.TourID).Select(g => new { TongVe = g.Sum(gg => gg.SoLuong), TourID = g.Key }).ToList();
            var user = db.NguoiDungs.Find(id);
            var tour = db.Tours.ToList();

            if(ve.ToList().Count == 0)
            {
                ViewBag.Ten = user.Ten;
                ViewBag.Email = user.Email;
                ViewBag.SDT = user.SDT;
                ViewBag.DiaChi = user.DiaChi;
                ViewBag.ThanhPho = user.ThanhPho.Ten;
                ViewBag.Passport = user.Passport;
                ViewBag.Check = 0;
                ViewBag.Msg = "Khách hàng chưa đặt tour nào";
                return View(tour);
            }
            else
            {
                foreach (var s in ve)
                {
                    foreach (var t in tour)
                    {
                        if (s.TourID == t.ID)
                        {
                            t.TongVeBan = s.TongVe;
                            break;
                        }
                    }
                }
                ViewBag.Ten = user.Ten;
                ViewBag.Email = user.Email;
                ViewBag.SDT = user.SDT;
                ViewBag.DiaChi = user.DiaChi;
                ViewBag.ThanhPho = user.ThanhPho.Ten;
                ViewBag.Passport = user.Passport;
                ViewBag.Check = 1;
                return View(tour);
            }    
        }
    }
}