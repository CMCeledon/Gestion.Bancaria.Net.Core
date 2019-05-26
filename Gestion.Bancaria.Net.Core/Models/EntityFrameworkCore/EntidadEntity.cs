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
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gestion.Bancaria.Net.Core.Models.EntityFrameworkCore
{

	public partial class EntidadEntity
	{
		[Key, Column(Order = 0)]
		[ForeignKey("IdEntidad")]
		public long IdEntidad { get; set; }
		public string Nombre { get; set; }
		public string Direccion { get; set; }
		public string Poblacion { get; set; }
		public string Provincia { get; set; }
		public string CodigoPostal { get; set; }
		public string Telefono { get; set; }
		public string Mail { get; set; }
		public string Logo { get; set; }
		public Nullable<System.DateTime> FechaInsercion { get; set; }
		public string IPInsercion { get; set; }
		public Nullable<bool> EstadoActivo { get; set; }
	}
}