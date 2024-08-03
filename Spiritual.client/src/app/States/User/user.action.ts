import { createAction, props } from "@ngrx/store";
import { User } from "../../Model/User.Model";

const LOGIN_USER = '[Login Page] Login User';
const LIGIN_USER_SUCESS = '[Login Page] Login User Sucess';
const LOGIN_USER_FAIL = '[Login Page] Login User Fail';
const CLEAR_USER_STATE  = '[Login Page] Clear User State'

export const LoginUserAction = createAction(LOGIN_USER,props<{userName:string}>());

export const LoginUserSuccess = createAction(LIGIN_USER_SUCESS,props<{User : User}>());

export const LoginUserFail = createAction(LOGIN_USER_FAIL,props<{error : string}>());

export const ClearUserState = createAction(CLEAR_USER_STATE)