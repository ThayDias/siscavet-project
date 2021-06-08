using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SisCaVet.Models;

namespace SisCaVet.Controllers
{
    public class ProcedimentoController : Controller
    {
        public IActionResult Index()
        { 
            using(var data = new ProcedimentoData())
            {
                return View(data.Read());
            }
        }

        public IActionResult Create()
        { 
            using(var data = new ProcedimentoData())
            {
                return View();
            }
        }

        [HttpPost]
         public IActionResult Create(Procedimento e)
        {   
            if(!ModelState.IsValid)
            {
                return View(e);
            }
            using(var data = new ProcedimentoData())
                data.Create(e);

            return RedirectToAction("Index");                    
        }

        public IActionResult Delete (int id)
        {
            using(var data = new ProcedimentoData())
                data.Delete(id);

            return RedirectToAction("Index");  
        }        
        
        [HttpGet]
        public IActionResult Update(int id)
        {
            using(var data = new ProcedimentoData())           
            return View(data.Read(id));
        }

        [HttpPost]
        public IActionResult Update(int id, Procedimento e)
        {
            e.Id = id;

            if(!ModelState.IsValid)
            {
                return View(e);
            }

            using(var data = new ProcedimentoData())
                data.Update(e);

            return  RedirectToAction("Index");
        }
    }
}
