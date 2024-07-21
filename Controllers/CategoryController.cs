using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;
using PagedList;
using System.Data.Entity;

namespace WebsiteBanHang.Controllers
{
    public class CategoryController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();
        // GET: Category
        //public ActionResult Index()
        //{
        //    return View();
        //}

        //public ActionResult ProductCategory(int ID)
        //{
        //    var listProduct = objWebsiteBanHangEntities.Products.Where(n => n.CategoryId == ID).ToList();
        //    return View(listProduct);
        //}

        public ActionResult ProductCategory(int? page, int ID)
        {
            int pagesize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listProduct = objWebsiteBanHangEntities.Products.Where(n => n.CategoryId == ID).AsNoTracking().OrderBy(x => x.Name).ToList();
            PagedList<Product> lst = new PagedList<Product>(listProduct, pageNumber, pagesize);
            return View(lst);
        }

        
    }
}