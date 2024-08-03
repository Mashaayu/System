import { User } from "../../Model/User.Model";

export interface UserState  {
    User : User | null,
    Error : string;
 
}

export const initalState : UserState  = {
    User : null,
    Error: '',
    
}