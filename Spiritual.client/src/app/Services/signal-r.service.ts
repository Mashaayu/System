import { Injectable } from '@angular/core';
import { HttpTransportType, HubConnection, HubConnectionBuilder, LogLevel } from '@microsoft/signalr'
import { Store } from '@ngrx/store';
import { Observable, retry } from 'rxjs';
import { AppState } from '../States/app.state';
import { getUser } from '../States/User/user.selector';

@Injectable({
  providedIn: 'root'
})
export class SignalRService {

  private hubConnection : HubConnection;
  constructor(private store:Store<{appState:AppState}>) {
    
    this.store.select(getUser).subscribe((data)=>{
      console.log("Toke in SigalR RService",data?.token.charAt(6));
     
      this.hubConnection = new HubConnectionBuilder()
        .withUrl("https://localhost:7194/hub/Userhub",{
          skipNegotiation:true,
          transport:HttpTransportType.WebSockets,

          accessTokenFactory : ()=> data?.token == undefined?"":data.token,
          // headers:{"access_token":data?.token == undefined ? "":data.token}
        })
        .configureLogging(LogLevel.Information)
        .build();
      })

   }

   
   
   StartConnection():Observable<void>{
      return new Observable<void>((observer)=>{
        this.hubConnection.start()
          .then( ()=>{
            console.log("Connection established");
            observer.next();
            observer.complete();
          }).catch(()=>{
            console.log("Connect get an errror");
            observer.error();
          })
      })
   }
  
   StopConnection(){
    console.log("stop Connection");
    
    this.hubConnection.stop();
   }

   SendMessage(message : string){
      this.hubConnection.invoke("SendMessage",message);
   }

   ReceiveMessage() : Observable<string>{
    return new Observable<string>((observer)=>{
      this.hubConnection.on("ReceiveMessage",(msg)=>{
    
          observer.next(msg);
      });
    })
   }
}
