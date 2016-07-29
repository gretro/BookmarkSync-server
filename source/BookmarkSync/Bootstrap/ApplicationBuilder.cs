using Microsoft.AspNetCore.Builder;

namespace BookmarkSync.App_Start
{
    public static class ApplicationBuilder
    {
        public static void UseBookmarkSync(this IApplicationBuilder app)
        {
            app.UseMvc(mvcOptions =>
            {
                mvcOptions.RegisterApiRoutes();
            });
        }
    }
}
