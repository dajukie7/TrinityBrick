using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace TrinityBrick.Controllers
{
    public class PortfolioController : Controller
    {
        //
        // GET: /Portfolio/

        public ActionResult Index()
        {
            ViewData["ActiveLink"] = "Portfolio";
            return View();
        }

    }
}
