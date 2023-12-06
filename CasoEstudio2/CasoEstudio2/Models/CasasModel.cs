using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CasoEstudio2.Models
{
    public class CasasModel
    {
        public string rutaServidor = ConfigurationManager.AppSettings["RutaApi"];
    }
}