using Microsoft.AspNetCore.Builder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Routing;

namespace BookmarkSync.App_Start
{
    public static class RouteConfig
    {
        public static void RegisterApiRoutes(this IRouteBuilder builder)
        {
            builder.MapRoute("Default API", "api/{controller=Home}/{action=Index}/{id?}");
        }
    }
}
