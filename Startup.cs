using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace SisCaVet
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            
            services.AddAuthentication();
            
            services.AddMvc();
        }
      
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            
            app.UseMvc(options => 
            {
                options.MapRoute("default","{controller=Home}/{action=Index}/{id?}");
            });  

            app.UseStaticFiles();
        }


    }
}
