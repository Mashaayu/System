namespace Spiritual.server.Models
{ 
    public class MessageService 
    {
        private readonly IServiceCollection services;

        public MessageService(IServiceCollection services)
        {
            this.services = services;
        }

        public async Task ConfigureSignalR()
        {
            services.AddAuthentication().AddJwtBearer(
                opts =>
                {
                    opts.Authority = "";
                });
        }
    }
}
