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
    using System;
    using System.Collections.Generic;
	using EntidadesAsociadasEntity = EntityFrameworkCore.EntidadesAsociadasEntity;
	public partial class EntidadesAsociadas
	{

		public EntidadesAsociadas()
		{
		}

		public EntidadesAsociadas(EntidadesAsociadasEntity EntidadAsociada)
		{
			this.IdGrupoEntidad = EntidadAsociada.IdGrupoEntidad;
			this.IdGrupo = EntidadAsociada.IdGrupo;
			this.IdEntidad = EntidadAsociada.IdEntidad;
			this.NombreGrupo = EntidadAsociada.NombreGrupo;
			this.NombreEntidad = EntidadAsociada.NombreEntidad;
			this.FechaInsercion = EntidadAsociada.FechaInsercion.ToString();
		}
		public long IdGrupoEntidad { get; set; }
		public long IdGrupo { get; set; }
		public long IdEntidad { get; set; }
		public string NombreGrupo { get; set; }
		public string NombreEntidad { get; set; }
		public string FechaInsercion { get; set; }

	}
}
