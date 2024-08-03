import { ComponentFixture, ComponentFixtureAutoDetect, TestBed } from '@angular/core/testing';

import { LoginComponent } from './login.component';
import { HttpClientModule, provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { ApiService } from '../../../Services/api.service';
import { LoginSignupService } from '../../../Services/login-signup.service';
import { ReactiveFormsModule } from '@angular/forms';

describe('LoginComponent', () => {
  let component: LoginComponent;
  let fixture: ComponentFixture<LoginComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [LoginComponent],
      providers: [
      ApiService,LoginSignupService ,{provide: ComponentFixtureAutoDetect, useValue: true}
      ],
       imports:[HttpClientModule,ReactiveFormsModule]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LoginComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('username required error',()=>{
    
    let userNameinput : HTMLInputElement = fixture.nativeElement.querySelector('#username')

    let userNameError:HTMLDivElement = fixture.nativeElement.querySelector('#usernameErr')

    userNameinput.value = "";
    userNameinput.dispatchEvent(new Event('input'));

    expect(userNameError.innerHTML).toContain('Username is required');


  })


 


});

