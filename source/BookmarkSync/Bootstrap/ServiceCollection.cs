using Microsoft.Extensions.DependencyInjection;

namespace BookmarkSync.App_Start
{
    public static class ServiceCollection
    {
        /// <summary>
        /// Adds services required for BookmarkSync to work properly, including MVC.
        /// </summary>
        /// <param name="services"></param>
        public static void AddBookmarkSync(this IServiceCollection services)
        {
            services.AddMvc();
        }
    }
}
