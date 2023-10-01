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
    public class deudoresController : Controller
    {
        private barberiaEntities db = new barberiaEntities();

        // GET: deudores
        public ActionResult Index()
        {
            return View(db.deudores.ToList());
        }

        // GET: deudores/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            deudores deudores = db.deudores.Find(id);
            if (deudores == null)
            {
                return HttpNotFound();
            }
            return View(deudores);
        }

        // GET: deudores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: deudores/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cod_deudor,nombre,direccion,telefono_fijo,celular,documento,cantidad_que_debe,activo")] deudores deudores)
        {
            if (ModelState.IsValid)
            {
                db.deudores.Add(deudores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(deudores);
        }

        // GET: deudores/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            deudores deudores = db.deudores.Find(id);
            if (deudores == null)
            {
                return HttpNotFound();
            }
            return View(deudores);
        }

        // POST: deudores/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cod_deudor,nombre,direccion,telefono_fijo,celular,documento,cantidad_que_debe,activo")] deudores deudores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deudores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(deudores);
        }

        // GET: deudores/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            deudores deudores = db.deudores.Find(id);
            if (deudores == null)
            {
                return HttpNotFound();
            }
            return View(deudores);
        }

        // POST: deudores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            deudores deudores = db.deudores.Find(id);
            db.deudores.Remove(deudores);
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
