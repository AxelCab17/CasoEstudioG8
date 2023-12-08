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
            return View();
        }

        public ActionResult ConsultarCasas()
        {

            var data = CasaModelo.ConsultarCasas();
            return View(data);
        }
    }
}