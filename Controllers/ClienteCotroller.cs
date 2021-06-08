using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SisCaVet.Models;

namespace SisCaVet.Controllers
{
    public class ClienteController : Controller
    {
        public IActionResult Index()
        { 
            using(var data = new ClienteData())
            {
                return View(data.Read());
            }
        }

        public IActionResult Create()
        { 
            using(var data = new ClienteData())
            {
                return View();
            }
        }

        [HttpPost]
         public IActionResult Create(Cliente e)
        {   
            if(!ModelState.IsValid)
            {
                return View(e);
            }
            using(var data = new ClienteData())
                data.Create(e);

            return RedirectToAction("Index");                    
        }

        public IActionResult Delete (int id)
        {
            using(var data = new ClienteData())
                data.Delete(id);

            return RedirectToAction("Index");  
        }        
        
        [HttpGet]
        public IActionResult Update(int id)
        {
            using(var data = new ClienteData())           
            return View(data.Read(id));
        }

        [HttpPost]
        public IActionResult Update(int id, Cliente e)
        {
            e.Id = id;

            if(!ModelState.IsValid)
            {
                return View(e);
            }

            using(var data = new ClienteData())
                data.Update(e);

            return  RedirectToAction("Index");
        }
    }
}
