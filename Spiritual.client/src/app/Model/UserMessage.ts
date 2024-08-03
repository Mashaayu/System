export interface UserMessage {
        sentFrom : string,
        sentTo : string,
        senderName : string,

        messages : [
            {
                message:string,
                time : string
            }
        ]
}

export interface UserMessagePost {
    sentFrom : string,
    sentTo : string,
    senderName : string,

    messages : 
        {
            message:string,
            time : string
        }
    
}