using CasoEstudio2.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;

namespace CasoEstudio2.Models
{
    public class CasasModel
    {
        public string rutaServidor = ConfigurationManager.AppSettings["RutaApi"];

        public List<CasasEntidad> ConsultarCasas()
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "ConsultarCasas";
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<CasasEntidad>>().Result;
            }
        }
    }
}