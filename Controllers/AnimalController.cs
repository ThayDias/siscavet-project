using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SisCaVet.Models;

namespace SisCaVet.Controllers
{
    public class AnimalController : Controller
    {
        public IActionResult Index()
        { 
            using(var data = new AnimalData())
            {
                return View(data.Read());
            }
        }

        public IActionResult Create()
        { 
            using(var data = new AnimalData())
            {
                return View();
            }
        }

        [HttpPost]
         public IActionResult Create(Animal e)
        {   
            if(!ModelState.IsValid)
            {
                return View(e);
            }
            using(var data = new AnimalData())
                data.Create(e);

            return RedirectToAction("Index");                    
        }

        public IActionResult Delete (int id)
        {
            using(var data = new AnimalData())
                data.Delete(id);

            return RedirectToAction("Index");  
        }        
        
        [HttpGet]
        public IActionResult Update(int id)
        {
            using(var data = new AnimalData())           
            return View(data.Read(id));
        }

        [HttpPost]
        public IActionResult Update(int id, Animal e)
        {
            e.Id = id;

            if(!ModelState.IsValid)
            {
                return View(e);
            }

            using(var data = new AnimalData())
                data.Update(e);

            return  RedirectToAction("Index");
        }
    }
}
