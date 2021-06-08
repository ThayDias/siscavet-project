using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Controllers{
    
    public class HomeController : Controller
    {        
       [HttpGet] // padrão, não é necessario colocar ATRIBUTO
        public ActionResult Index()
         {
            // retorna view(Html)
            return View(); 

        }
    }
}