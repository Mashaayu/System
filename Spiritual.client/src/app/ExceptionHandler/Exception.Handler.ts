import { HttpErrorResponse } from "@angular/common/http";
import { throwError } from "rxjs/internal/observable/throwError";


export function handleError(error: HttpErrorResponse) {
    if (error.status === 0) {
    
      console.error('An error occurred:', error.error);
    } else {
     
      console.error(
        `Backend returned code ${error.status}, body was: `, error.error);
    }
   
    return throwError(() => new Error('Something bad happened; please try again later.'));
  }