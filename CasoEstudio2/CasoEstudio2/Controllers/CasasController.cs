using CasoEstudio2.Entities;
using CasoEstudio2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CasoEstudio2.Controllers
{
    public class CasasController : Controller
    {

        CasasModel CasaModelo = new CasasModel();
        public ActionResult AlquilerCasas()
        {
            var data = CasaModelo.ObtenerCasasDisponibles();
            return View(data);
        }

        public ActionResult ConsultarCasas()
        {

            var data = CasaModelo.ConsultarCasas();
            return View(data);
        }

        //[HttpGet]
        //public ActionResult ActualizarAlquiler(long q)
        //{
        //    var datos = CasaModelo.ConsultarCasas(q);
        //    ViewBag.Direcciones = modelUsuario.ConsultarProvincias();
        //    return View(datos);
        //}

        [HttpPost]
        public ActionResult ActualizarAlquiler(CasasEntidad entidad)
        {

            string respuesta = CasaModelo.ActualizarAlquiler(entidad);

            if (respuesta == "OK")
            {
                return RedirectToAction("ConsultarCasas", "Casas");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido actualizar su información";
                return RedirectToAction("ConsultarCasas", "Casas");
            }
        }
    }
}