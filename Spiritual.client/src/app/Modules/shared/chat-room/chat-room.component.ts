import { Component, Input, OnInit, Output } from '@angular/core';
import { Observable, Subject, Subscription, fromEvent } from 'rxjs';
import { UserMessage } from '../../../Model/UserMessage';
import { Store } from '@ngrx/store';
import { AppState } from '../../../States/app.state';
import { DevoteePostModel } from '../../../Model/Devotee.Model';
import { GetDevoteeList } from '../../../States/Admin/admin.selector';
import { SignalRService } from '../../../Services/signal-r.service';
import { User } from '../../../Model/User.Model';
import { GetDevoteesAction } from '../../../States/Admin/admin.actions';

@Component({
  selector: 'app-chat-room',
  templateUrl: './chat-room.component.html',
  styleUrl: './chat-room.component.css'
})
export class ChatRoomComponent implements OnInit {


  @Output() close$: Subject<void> = new Subject<void>();
  @Input() ReceivedMSg: string;
  @Input() isAdmin: boolean;
  @Input() UserId: string;

  UserList: DevoteePostModel[];
  resizeObservable$: Observable<Event>;
  resizeSubscription$: Subscription;
  activeUSer: DevoteePostModel | User;
  msgBox = true;
  notification = false;
  showChats = true;
  chats = true;
  chatRoom = false;

  activeChats: Array<UserMessage> = new Array<UserMessage>();


  constructor(private store: Store<{ appstate: AppState }>, private signalRservice: SignalRService) { }

  ngOnInit(): void {
    this.resizeObservable$ = fromEvent(window, 'resize');
    this.resizeSubscription$ = this.resizeObservable$.subscribe(e => {

      if (window.innerWidth >= 600) {
        this.msgBox = true;
        this.showChats = true;
      } else {
        this.msgBox = true;
        this.showChats = false;
      }

    });

    this.store.dispatch(GetDevoteesAction());
    this.store.select(GetDevoteeList).subscribe((data) => {
      data.forEach(devotee => {
        if (devotee.devoteeLoginId != this.UserId) {
          this.UserList.push(devotee)
        };
      });

      console.log("user list is :'");
      
    });

    this.signalRservice.StartConnection().subscribe(() => {
     this.receiveMessage();
    });

  }

  CloseChats() {
    this.close$.next();
  }
  OpenChatRoomandChat(id: string) {

    let chatbtn = document.getElementById('allchat');
    let chatRoombtn = document.getElementById('chatroom');
    let notifybtn = document.getElementById('notify');

    if (id == 'chatroom') {

      this.chatRoom = true;
      this.chats = false;
      this.notification = false;
      chatbtn?.classList.remove('open');
      chatRoombtn?.classList.add('open');
      notifybtn?.classList.remove('open');

    } else if (id == 'allchat') {

      this.chatRoom = false;
      this.chats = true;
      this.notification = false;
      chatbtn?.classList.add('open');
      chatRoombtn?.classList.remove('open');
      notifybtn?.classList.remove('open');

    } else {

      this.chatRoom = false;
      this.chats = false;
      this.notification = true;
      chatbtn?.classList.remove('open');
      chatRoombtn?.classList.remove('open');
      notifybtn?.classList.add('open');

    }

  }

  OnSelectuser(UserId: string) {

    let user = this.UserList.find((user) => {
      return user.devoteeLoginId == UserId
    });

    if (user != null) {
      this.activeUSer = user;
    }
  }

  OpenUserChat() {
    this.msgBox = false;
    this.showChats = true;
  }

  SendMessage(message: string) {
    this.signalRservice.SendMessage(message);
  }

  receiveMessage() {

      
      let box = document.getElementById("display-notifications");
      this.signalRservice.ReceiveMessage().subscribe((data) => {
        let p = document.createElement('p');
        p.innerHTML = `${data}`;
        p.className = 'alert alert-primary';
        box?.append(p);

      });
    
    if (this.chats == true) {
      let box = document.getElementById("display-msg");
      this.signalRservice.ReceiveMessage().subscribe((data) => {
        let p = document.createElement('p');
        p.innerHTML = `${data}`
        box?.append(p);

      });
    }
  }




}
