using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;
using WebsiteBanHang.Controllers;

namespace WebsiteBanHang.Areas.Admin.Controllers
{
    public class ChartController : BaseController
    {
        // GET: Admin/Chart
        public ActionResult Index()
        {

            int data1 = db.Products.Where(p => p.CategoryId == 2).Count();
            int data2 = db.Products.Where(p => p.CategoryId == 7).Count();
            TempData["data1"] = data1;
            TempData["data2"] = data2;
            return View();
        }

        public ActionResult IndexUsers()
        {

            int data1 = db.Users.Count();
            int data2 = db.Members.Count();
            TempData["data1"] = data1;
            TempData["data2"] = data2;
            return View();
        }
    }
}