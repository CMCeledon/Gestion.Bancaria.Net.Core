//------------------------------------------------------------------------------
// <autor-generated>
// Desarrollador Senior de Software - http://www.cmceledon.com
// Bogotá, Cundinamarca
// carlos@cmceledon.com
// 3004559711
// Prueba técnica de desarrollo para: 
// NECOMPLUS
// http://necomplus.com/
// Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
// Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </autor-generated>
//------------------------------------------------------------------------------

namespace Gestion.Bancaria.Net.Core.Models.EntityFrameworkCore
{
	using Microsoft.EntityFrameworkCore;
	public class EntitiesGestionBancaria : DbContext
	{
		public EntitiesGestionBancaria(DbContextOptions<EntitiesGestionBancaria> options) : base(options)
		{
		}
		public virtual DbSet<EntidadEntity> Entidad { get; set; }
		public virtual DbSet<GrupoEntity> Grupo { get; set; }
		public virtual DbSet<GrupoEntidadEntity> GrupoEntidad { get; set; }
		public virtual DbSet<EntidadesAsociadasEntity> EntidadesAsociadas { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);
			modelBuilder.Entity<EntidadEntity>()
			.Property(b => b.FechaInsercion)
			.HasDefaultValueSql("GETDATE()");

			base.OnModelCreating(modelBuilder);
			modelBuilder.Entity<GrupoEntidadEntity>()
			.Property(b => b.FechaInsercion)
			.HasDefaultValueSql("GETDATE()");
		}
	}
	public class ResultDataAppService
	{
		public bool Boolean { get; set; }
		public string String { get; set; }
	}
}
