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
using System.Collections.Generic;
using System.Linq;
using NLog.Web;
using Newtonsoft.Json;
using Gestion.Bancaria.Net.Core.Models.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Gestion.Bancaria.Net.Core.Models.EntityFrameworkCoreData;

namespace Gestion.Bancaria.Net.Core.Controllers.EntidadController
{
	[Route("api/[controller]")]
	[ApiController]
	//[EnableCors("HealthPolicy")]
	public class EntidadController : ControllerBase
	{
		#region Variables Configuración
		private NLog.ILogger logger = NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();

		#endregion
		private readonly EntitiesGestionBancaria ctxModel;

		public EntidadController(EntitiesGestionBancaria context)
		{
			ctxModel = context;
		}

		[HttpGet]
		public IActionResult Get(int? id)
		{
			IQueryable<EntidadEntity> Consulta = this.ctxModel.Entidad;

			if (id.HasValue)
			{
				Consulta = Consulta.Where(b => b.IdEntidad == id.Value);
			}

			return this.Ok(Consulta.Select(b => new Entidad(b)));
		}
	
		[HttpPost]
		public IActionResult Create([FromBody] EntidadEntity EntidadParam)
		{
			string json = "";
			var IP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

			if (EntidadParam.IPInsercion == null)
			{
				EntidadParam.IPInsercion = IP;
			}

			json = JsonConvert.SerializeObject(EntidadParam);

			logger.Debug("***JSON Inicio***");
			logger.Debug(json);
			logger.Debug("***JSON Inicio***");

			List<ResultDataAppService> Result = new List<ResultDataAppService>();
			bool ResultBool = false;
			string MensajeString = "Error";
			try
			{
				ctxModel.Entidad.Add(EntidadParam);
				ctxModel.SaveChanges();
				ResultBool = true;
				MensajeString = "Entidad Creada.";
			}
			catch (Exception ErroresControlados)
			{
				MensajeString = ErroresControlados.GetBaseException().Message;
				logger.Error(MensajeString);
				ResultBool = false;
			}
			Result.Add(new ResultDataAppService() { Boolean = ResultBool, String = MensajeString });
			json = JsonConvert.SerializeObject(Result);
			logger.Debug("***JSON FIN***");
			logger.Debug(json);
			logger.Debug("***JSON FIN***");
			return this.Ok(Result);
		}


	}


}
