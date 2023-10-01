using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Proyecto_final_barberia.Models;

namespace Proyecto_final_barberia.Controllers
{
    public class barberoesController : Controller
    {
        private barberiaEntities db = new barberiaEntities();

        // GET: barberoes
        public ActionResult Index()
        {
            return View(db.barbero.ToList());
        }

        // GET: barberoes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            barbero barbero = db.barbero.Find(id);
            if (barbero == null)
            {
                return HttpNotFound();
            }
            return View(barbero);
        }

        // GET: barberoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: barberoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cod_barbero,documento,nombre,direccion,teléfono,activo")] barbero barbero)
        {
            if (ModelState.IsValid)
            {
                db.barbero.Add(barbero);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(barbero);
        }

        // GET: barberoes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            barbero barbero = db.barbero.Find(id);
            if (barbero == null)
            {
                return HttpNotFound();
            }
            return View(barbero);
        }

        // POST: barberoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cod_barbero,documento,nombre,direccion,teléfono,activo")] barbero barbero)
        {
            if (ModelState.IsValid)
            {
                db.Entry(barbero).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(barbero);
        }

        // GET: barberoes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            barbero barbero = db.barbero.Find(id);
            if (barbero == null)
            {
                return HttpNotFound();
            }
            return View(barbero);
        }

        // POST: barberoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            barbero barbero = db.barbero.Find(id);
            db.barbero.Remove(barbero);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
