﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace APICasoEstudio2.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class CasoEstudioKNEntities : DbContext
    {
        public CasoEstudioKNEntities()
            : base("name=CasoEstudioKNEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CasasSistema> CasasSistema { get; set; }
    
        public virtual ObjectResult<ObtenerCasasDisponibles_Result> ObtenerCasasDisponibles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ObtenerCasasDisponibles_Result>("ObtenerCasasDisponibles");
        }
    
        public virtual ObjectResult<ObtenerInfoCasas_Result> ObtenerInfoCasas()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ObtenerInfoCasas_Result>("ObtenerInfoCasas");
        }
    }
}