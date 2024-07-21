using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;

namespace WebsiteBanHang.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        // GET: Admin/Users
        [HasCredentialAtrribute(RoleCode = "view-add-edit-delete")]
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var danhsachusers = new List<User>();

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
                danhsachusers = db.Users.Where(n => n.FirstName.Contains(SearchString)).ToList();
            }
            else
            {
                danhsachusers = db.Users.ToList();
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            danhsachusers = danhsachusers.OrderByDescending(n => n.ID).ToList();
            return View(danhsachusers.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(User model)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            var check = db.Users.FirstOrDefault(s => s.Email == model.Email);
            if (check == null)
            {
                model.Password = GetMD5(model.Password);
                db.Users.Add(model);
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
            User user = db.Users.Find(ID);
            return View(user);
        }
        [HttpPost]
        public ActionResult Edit(User model)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var updateModel = db.Users.Find(model.ID);

            updateModel.FirstName = model.FirstName;
            updateModel.LastName = model.LastName;
            updateModel.Email = model.Email;
            updateModel.Password = GetMD5(model.Password);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int ID)
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();

            var updateModel = db.Users.Find(ID);
            db.Users.Remove(updateModel);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        public int getUsers()
        {
            WebsiteBanHangEntities db = new WebsiteBanHangEntities();
            return db.Users.Count();

        }
    }
}