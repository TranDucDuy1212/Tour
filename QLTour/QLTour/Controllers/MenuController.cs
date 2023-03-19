using QLTour.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLTour.Controllers
{
    public class MenuController : Controller
    {
        private QLTourEntities db = new QLTourEntities(); 
        // GET: Menu
        public ActionResult Index()
        {
            var asia = db.DiaDiems.Where(s => s.LoaiTourID.Contains("ASIA"));
            Hashtable lsAsia = new Hashtable();
            foreach (var item in asia)
            {
                lsAsia.Add(item.ID, item.Ten);
            }

            var eu = db.DiaDiems.Where(s => s.LoaiTourID.Contains("EU"));
            Hashtable lsEu = new Hashtable();
            foreach (var item in eu)
            {
                lsEu.Add(item.ID, item.Ten);
            }

            var ame = db.DiaDiems.Where(s => s.LoaiTourID.Contains("AME"));
            Hashtable lsAme = new Hashtable();
            foreach (var item in ame)
            {
                lsAme.Add(item.ID, item.Ten);
            }
            var diaDiem = db.DiaDiems.Where(s => s.LoaiTourID.Contains("VNM"));
            Hashtable ls = new Hashtable();
            foreach (var item in diaDiem)
            {
                ls.Add(item.ID, item.Ten);
            }

            ViewBag.DiaDiem = ls;
            ViewBag.ChauA = lsAsia;
            ViewBag.ChauAu = lsEu;
            ViewBag.ChauMy = lsAme;
            return PartialView("Index");
        }
    }
}