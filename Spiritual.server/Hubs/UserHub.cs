using Microsoft.AspNetCore.SignalR;
using NuGet.Common;
using Spiritual.server.Context;
using Spiritual.server.Models.DTOs;
using Spiritual.server.Models.Message;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace Spiritual.server.Hubs
{
    public class UserHub : Hub
    {
        //ivate readonly AppIdentityDbContext context;

        private List<connectionList> UserList { get; set; }

   

        public override async Task OnConnectedAsync()
        {
            var x =  Context.User.Identity.Name;
            await base.OnConnectedAsync();

            var httpcontext = Context.GetHttpContext();
            var hearder =  httpcontext.Request.Headers["Authorization"];
            var c = Context.Items;
        }

        //public void ConfigureIdentity()
        //{
        //    var jwtToken = new JwtSecurityToken();
        //    if (jwtToken != null)
        //    {
        //        int? accountId = int.Parse(jwtToken.Claims.First(x => x.Type == "id").Value);
        //        if (accountId != null)
        //        {
        //            // attach account to context on successful jwt validation
        //            Context.Items["Account"] = await dataContext.Accounts.FindAsync(accountId);
        //            context.User.AddIdentity(new ClaimsIdentity(jwtToken.Claims));
        //        }
        //    }
        //}
        public async Task SendNotification(string notification)
        {
         
           
            await Clients.All.SendAsync("ReceiveNotification",notification);
            //await Clients.Users(Id).SendAsync("fdsf");
        }
        public async Task SendMessage(string Message)
        {
            var x =  Context.User.Identity;
            var y = Clients.User;
            var z = 0;

            await Clients.All.SendAsync("ReceiveMessage", Message);
            //var x = Context.UserIdentifier;
            //var z = 10;
        }

        public async Task SendToUser(string UserId)
        {
            await Clients.User(UserId).SendAsync("Hello Message from");
        }

       public async Task ConfigureConnection(string conID, string UserId)
        {
            connectionList conn = new connectionList() { 
                ConnectionId = conID,
                usrname = UserId,   
            };
        }
    }
}
