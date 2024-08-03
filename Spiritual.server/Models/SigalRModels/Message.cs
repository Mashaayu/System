using Spiritual.Server.Identity;

namespace Spiritual.server.Models.Message
{
    public class Message:BaseEntity
    {
       public string SenderUserName { get; set; }
       public string SenderId { get; set; }
       public AppUser Sender { get; set; }

        public string ReceiverUserName { get; set; }
        public string ReceiverId { get; set; }
        public AppUser Receiver { get; set; }
        public string TextContect { get; set; }
        public DateTime Time {  get; set; } = DateTime.UtcNow;

        public bool? senderDeleted { get; set; }
        public bool? receiverDeleted { get; set; }

        public bool? isAdmin { get; set; }

        public bool? SenderDeleted { get; set; }
        public bool? ReceiverDeleted { get; set; }

    }
}
