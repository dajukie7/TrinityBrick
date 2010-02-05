﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TrinityBrick.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["ActiveLink"] = "Home";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
