import { Action, createReducer, on } from "@ngrx/store";
import { UserState, initalState } from "./user.state";
import { ClearUserState, LoginUserAction, LoginUserFail, LoginUserSuccess } from "./user.action";


export function UserReducer(state:UserState,action :Action<string>){
    return _UserReducer(state,action);
}


const _UserReducer = createReducer(initalState,
    on(LoginUserAction,(state)=>{
        return {
            ...state,
           
        }
    }),
    on(LoginUserSuccess,(state,action)=>{
            
        return {
            ...state,
            User : action.User,
            Error : ''
        }
    }),
    on(LoginUserFail,(state,action)=>
        {
            return {
                ...state,
                Error : action.error
            }
        }
    ),
    on(ClearUserState,(state)=>{
        console.log("User State has been  cleared");
        
        return {
            ...state,
            User : null,
            Error : ''
        }
    })

);