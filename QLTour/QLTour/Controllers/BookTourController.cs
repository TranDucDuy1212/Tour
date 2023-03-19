using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using QLTour.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLTour.Controllers
{
    [Authorize(Roles = "")]
    public class BookTourController : Controller
    {
        private QLTourEntities db = new QLTourEntities();
        // GET: BookTour
        public ActionResult Index(int id, int SoVe = 1)
        {
            ViewBag.ID = id;
            var tour = db.Tours.FirstOrDefault(s => s.ID == id);

            ViewBag.SoVe = SoVe;
            ViewBag.Gia = tour.Gia;
            ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
            ViewBag.TourID = tour.ID;
            ViewBag.Ten = tour.Ten;
            ViewBag.DiemDen = tour.DiaDiem1.Ten;
            ViewBag.Button = 0;
            ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "TenChuTaiKhoan, SoTaiKhoan, NganHangID")] TaiKhoan taiKhoan, int SoVe, int TourID)
        {
            var tour = db.Tours.FirstOrDefault(s => s.ID == TourID);

            if (ModelState.IsValid)
            {
                var ktTaiKhoan = db.TaiKhoans.FirstOrDefault(s => s.SoTaiKhoan.Contains(taiKhoan.SoTaiKhoan));

                if (ktTaiKhoan == null)
                {
                    ViewBag.MsgSTK = "Số tài khoản không tồn tại";
                    ViewBag.SoVe = SoVe;
                    ViewBag.Gia = tour.Gia;
                    ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    ViewBag.TourID = tour.ID;
                    ViewBag.Ten = tour.Ten;
                    ViewBag.DiemDen = tour.DiaDiem1.Ten;
                    ViewBag.Button = 0;
                    ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten", taiKhoan.NganHangID);
                    return View();
                }
                else
                {
                    if(ktTaiKhoan.TenChuTaiKhoan.Contains(taiKhoan.TenChuTaiKhoan) != true)
                    {
                        ViewBag.MsgTenChuTK = "Tên bạn nhập không trùng với tên chủ tài khoản";
                        ViewBag.SoVe = SoVe;
                        ViewBag.Gia = tour.Gia;
                        ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                        ViewBag.TourID = tour.ID;
                        ViewBag.Ten = tour.Ten;
                        ViewBag.DiemDen = tour.DiaDiem1.Ten;
                        ViewBag.Button = 0;
                        ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten", taiKhoan.NganHangID);
                        return View();
                    }

                    string email = User.Identity.GetUserName();
                    var user = db.NguoiDungs.FirstOrDefault(s => s.Email.Contains(email));

                    if(user != null)
                    {
                        DateTime ngayDat = DateTime.Now;
                        DatTour datTour = new DatTour();
                        datTour.NgayDat = ngayDat;
                        datTour.NguoiDungID = user.ID;
                        datTour.SoLuong = SoVe;
                        datTour.TourID = TourID;
                        db.DatTours.Add(datTour);

                        decimal? tongtien = tour.Gia * SoVe;

                        GiaoDich giaoDich = new GiaoDich();
                        giaoDich.Tien = tongtien;
                        giaoDich.NgayGiaoDich = ngayDat;
                        giaoDich.SoDuBanDau = ktTaiKhoan.Tien;
                        giaoDich.SoDuSauGiaoDich = (ktTaiKhoan.Tien - tongtien);
                        db.GiaoDiches.Add(giaoDich);

                        ktTaiKhoan.Tien = (ktTaiKhoan.Tien - tongtien);
                        db.TaiKhoans.AddOrUpdate(ktTaiKhoan);

                        db.SaveChanges();
                        ViewBag.Msg = "Thanh toán thành công";
                        ViewBag.Button = 1;
                        ViewBag.Check = 1;
                        ViewBag.SoVe = SoVe;
                        ViewBag.Gia = tour.Gia;
                        ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                        ViewBag.TourID = tour.ID;
                        ViewBag.Ten = tour.Ten;
                        ViewBag.DiemDen = tour.DiaDiem1.Ten;
                        ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten", taiKhoan.NganHangID);
                        return View("Index");
                    }

                    ViewBag.Msg = "Thanh toán thất bại";
                    ViewBag.Check = 0;
                    ViewBag.SoVe = SoVe;
                    ViewBag.Gia = tour.Gia;
                    ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
                    ViewBag.TourID = tour.ID;
                    ViewBag.Ten = tour.Ten;
                    ViewBag.DiemDen = tour.DiaDiem1.Ten;
                    ViewBag.Button = 0;
                    ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten", taiKhoan.NganHangID);
                    return View("Index");
                }
            }

            ViewBag.Msg = "Thanh toán thất bại";
            ViewBag.Check = 0;
            ViewBag.SoVe = SoVe;
            ViewBag.Gia = tour.Gia;
            ViewBag.NgayKhoiHanh = tour.NgayKhoiHanh;
            ViewBag.TourID = tour.ID;
            ViewBag.Ten = tour.Ten;
            ViewBag.DiemDen = tour.DiaDiem1.Ten;
            ViewBag.Button = 0;
            ViewBag.NganHang = new SelectList(db.NganHangs, "ID", "Ten", taiKhoan.NganHangID);
            return View("Index");
        }

    }
}