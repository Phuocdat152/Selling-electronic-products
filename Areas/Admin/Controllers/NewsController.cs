using Microsoft.Ajax.Utilities;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;

namespace WebsiteBanHang.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        // GET: Admin/News
        public ActionResult Index(string currentFilter, string SearchString, int? page, int? Id)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var danhsachnews = new List<News>();


            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                danhsachnews = db.News.Where(n => n.Title.Contains(SearchString)).ToList();
            }
            else
            {
                danhsachnews = db.News.ToList();
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            danhsachnews = danhsachnews.OrderByDescending(n => n.ID).ToList();
            return View(danhsachnews.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(News model)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            var check = db.News.FirstOrDefault(s => s.Title == model.Title);

            if (check == null)
            {
                HttpPostedFileBase Avatar = Request.Files[0];
                if (Avatar != null && Avatar.ContentLength > 0)
                {
                    model.Avatar = Avatar.FileName;
                    Avatar.SaveAs(Server.MapPath("/Content/images/items/" + Avatar.FileName));
                }

                db.News.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "tựa đề đã tồn tại");
                return View();
            }


        }

        public ActionResult Edit(int ID)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            News news = db.News.Find(ID);
            return View(news);
        }
        [HttpPost]
        public ActionResult Edit(News model)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var updateModel = db.News.Find(model.ID);

            updateModel.Title = model.Title;
            updateModel.Avatar = model.Avatar;
            updateModel.Description = model.Description;
            updateModel.Author = model.Author;
            updateModel.CreatedDate = model.CreatedDate;
            HttpPostedFileBase Avatar = Request.Files[0];
            if (Avatar != null && Avatar.ContentLength > 0)
            {
                updateModel.Avatar = Avatar.FileName;
                Avatar.SaveAs(Server.MapPath("/Content/images/items/" + Avatar.FileName));
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int ID)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var updateModel = db.News.Find(ID);
            db.News.Remove(updateModel);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public int getNews()
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            return db.News.Count();

        }

        public ActionResult Detail(int ID)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            var objNews = db.News.Where(n => n.ID == ID).FirstOrDefault();
            return View(objNews);
        }

    }
}