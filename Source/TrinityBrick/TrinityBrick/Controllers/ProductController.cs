using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using TrinityBrick.Models;
using TrinityBrick.ViewModels;

namespace TrinityBrick.Controllers
{
    public class ProductController : Controller
    {
        private ProductService productService;
        //
        // GET: /Product/

        public ProductController()
        {
            productService = new ProductService();
        }

        public ActionResult Index()
        {
            return Brick();
        }

        public ActionResult Brick()
        {
            ProductViewModel productViewModel = productService.DefaultBrickData();
            return View("Product",productViewModel);
        }

        public JsonResult Update(int id)
        {
            var product = productService.FindBrick(id);
            return Json(product);
        }
    }

    public class ProductService : Service
    {
        public ProductViewModel DefaultBrickData()
        {
            ProductViewModel productViewModel = new ProductViewModel();
            productViewModel.Products = new List<ProductEntity>();

            for (int i = 1; i < 8; i++)
            {
                var product = new ProductEntity();
                product.Id = i;
                if(i%2 == 0)
                {
                    product.Name = "Antique Stratford";
                    product.Description = "Antique Stratford Description";
                    product.SampleImagePath = "brickSample.png";
                    product.Images = new List<string>
                                         {"AntiqueStratford_1.jpg", "AntiqueStratford_2.jpg", "AntiqueStratford_3.jpg"};
                }
                else
                {
                    product.Name = "Cambridge";
                    product.Description = "Cambridge Description";
                    product.SampleImagePath = "brickSample.png";
                    product.Images = new List<string> { "Cambridge_1.jpg", "Cambridge_2.jpg", "Cambridge_3.jpg" };
                }

                productViewModel.Products.Add(product);
                
            }

            return productViewModel;
        }

        public ProductEntity FindBrick(int id)
        {
            return id%2 == 0
                       ? new ProductEntity
                             {
                                 Id = id,
                                 Description = "description",
                                 Name = "Antique Stratford",
                                 Images =
                                     new List<string>
                                         {"AntiqueStratford_1.jpg", "AntiqueStratford_2.jpg", "AntiqueStratford_3.jpg"}
                             }
                       : new ProductEntity
                             {
                                 Id = id,
                                 Description = "description",
                                 Name = "Cambridge",
                                 Images = new List<string> {"Cambridge_1.jpg", "Cambridge_2.jpg", "Cambridge_3.jpg"}
                             };
        }
    }

    public class Service
    {
    }
}
