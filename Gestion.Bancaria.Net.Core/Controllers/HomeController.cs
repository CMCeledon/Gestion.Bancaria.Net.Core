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

using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Gestion.Bancaria.Net.Core.Models;
using NLog.Web;

namespace Gestion.Bancaria.Net.Core.Controllers
{
	public class HomeController : Controller
	{
		private NLog.ILogger logger = NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();

		public IActionResult Index()
		{

			var IP = Request.HttpContext.Connection.RemoteIpAddress.ToString();
			logger.Trace("___Visitante: IP-" + IP + ".");
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
