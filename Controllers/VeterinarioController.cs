using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SisCaVet.Models;

namespace SisCaVet.Controllers
{
    public class VeterinarioController : Controller
    {
        public IActionResult Index()
        { 
            using(var data = new VeterinarioData())
            {
                return View(data.Read());
            }
        }

        public IActionResult Create()
        { 
            using(var data = new VeterinarioData())
            {
                return View();
            }
        }

        [HttpPost]
         public IActionResult Create(Veterinario e)
        {   
            if(!ModelState.IsValid)
            {
                return View(e);
            }
            using(var data = new VeterinarioData())
                data.Create(e);

            return RedirectToAction("Index");                    
        }

        public IActionResult Delete (int id)
        {
            using(var data = new VeterinarioData())
                data.Delete(id);

            return RedirectToAction("Index");  
        }        
        
        [HttpGet]
        public IActionResult Update(int id)
        {
            using(var data = new VeterinarioData())           
            return View(data.Read(id));
        }

        [HttpPost]
        public IActionResult Update(int id, Veterinario e)
        {
            e.Id = id;

            if(!ModelState.IsValid)
            {
                return View(e);
            }

            using(var data = new VeterinarioData())
                data.Update(e);

            return  RedirectToAction("Index");
        }
    }
}
