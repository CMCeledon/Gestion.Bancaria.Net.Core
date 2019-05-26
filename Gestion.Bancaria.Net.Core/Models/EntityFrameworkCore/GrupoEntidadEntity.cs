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
	using System;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	public partial class GrupoEntidadEntity
	{
		[Key, Column(Order = 0)]
		[ForeignKey("IdGrupoEntidad")]
		public long IdGrupoEntidad { get; set; }
		public long IdGrupo { get; set; }
		public long IdEntidad { get; set; }
		public Nullable<System.DateTime> FechaInsercion { get; set; }

	}
}
