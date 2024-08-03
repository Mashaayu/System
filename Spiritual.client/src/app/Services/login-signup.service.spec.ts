import { TestBed } from '@angular/core/testing';

import { LoginSignupService } from './login-signup.service';
import { LoginComponent } from '../Modules/shared/login/login.component';

describe('LoginSignupService', () => {
  let service: LoginSignupService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports:[LoginComponent],
      providers:[LoginSignupService]
    });
    service = TestBed.inject(LoginSignupService);
  });

  it('Login service should be created', () => {
    expect(service).toBeTruthy();
  });
});
