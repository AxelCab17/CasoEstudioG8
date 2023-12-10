using APICasoEstudio2.Models;
using APICasoEstudio2.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Net.Http;

namespace APICasoEstudio2.Controllers
{
    public class CasoEstudio2Controller : ApiController
    {
        [HttpGet]
        [Route("ConsultarCasas")]
        public List<ObtenerInfoCasas_Result> ConsultarCasas()
        {
            using (var contexto = new CasoEstudioKNEntities())
            {
                return contexto.ObtenerInfoCasas().ToList();
            }
        }

        [HttpGet]
        [Route("ObtenerCasasDisponibles")]
        public List<ObtenerCasasDisponibles_Result> ObtenerCasasDisponibles()
        {
            using (var contexto = new CasoEstudioKNEntities())
            {
                return contexto.ObtenerCasasDisponibles().ToList();
            }
        }

        [HttpGet]
        [Route("ConsultarCasa")]
        public ObtenerInfoCasa_Result ConsultarCasa(long q)
        {
            using (var context = new CasoEstudioKNEntities())
            { 
                return context.ObtenerInfoCasa(q).FirstOrDefault();
            }
        }

        [HttpPut]
        [Route("ActualizarAlquiler")]
        public string ActualizarAlquiler(CasasEntidad entidad)
        {
            //DateTime dateTime = new DateTime();
            //entidad.FechaAlquiler = dateTime;
            try
            {
                using (var context = new CasoEstudioKNEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;
                    context.ActualizarAlquiler(entidad.IdCasa, entidad.DescripcionCasa, entidad.PrecioCasa, entidad.UsuarioAlquiler, entidad.FechaAlquiler);
                    return "OK";
                }
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
}