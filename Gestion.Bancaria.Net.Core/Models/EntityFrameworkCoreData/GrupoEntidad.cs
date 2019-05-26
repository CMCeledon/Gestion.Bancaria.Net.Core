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

namespace Gestion.Bancaria.Net.Core.Models.EntityFrameworkCoreData
{
	using GrupoEntidadEntity = EntityFrameworkCore.GrupoEntidadEntity;
	public partial class GrupoEntidad
	{
		public GrupoEntidad(GrupoEntidadEntity GrupoEntidad)
		{
			this.IdGrupoEntidad = GrupoEntidad.IdGrupoEntidad;
			this.IdEntidad = GrupoEntidad.IdEntidad;
			this.IdGrupo = GrupoEntidad.IdGrupo;
			this.FechaInsercion = GrupoEntidad.FechaInsercion.ToString();
		}
		public long IdGrupoEntidad { get; set; }
		public long IdGrupo { get; set; }
		public long IdEntidad { get; set; }
		public string FechaInsercion { get; set; }
	}
}
