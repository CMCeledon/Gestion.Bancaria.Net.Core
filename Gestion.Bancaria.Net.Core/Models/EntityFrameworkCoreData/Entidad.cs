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
	using EntidadEntity = EntityFrameworkCore.EntidadEntity;
	public class Entidad
	{
		public Entidad()
		{
		}

		public Entidad(EntidadEntity Entidad)
		{
			this.IdEntidad = Entidad.IdEntidad;
			this.Nombre = Entidad.Nombre;
			this.Direccion = Entidad.Direccion;
			this.Poblacion = Entidad.Poblacion;
			this.Provincia = Entidad.Provincia;
			this.CodigoPostal = Entidad.CodigoPostal;
			this.Telefono = Entidad.Telefono;
			this.Mail = Entidad.Mail;
			this.Logo = Entidad.Logo;
			this.FechaInsercion = Entidad.FechaInsercion.ToString();
			this.IPInsercion = Entidad.IPInsercion;
			this.EstadoActivo = Entidad.EstadoActivo;
			//this.Group = new GroupDto(Entidad.Group);
		}



		public long IdEntidad { get; set; }
		public string Nombre { get; set; }
		public string Direccion { get; set; }
		public string Poblacion { get; set; }
		public string Provincia { get; set; }
		public string CodigoPostal { get; set; }
		public string Telefono { get; set; }
		public string Mail { get; set; }
		public string Logo { get; set; }
		public string FechaInsercion { get; set; }
		public string IPInsercion { get; set; }
		public Nullable<bool> EstadoActivo { get; set; }
	}
}

