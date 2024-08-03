import { TestBed } from '@angular/core/testing';

import { DonationApiService } from './donation-api.service';
import { LoginComponent } from '../Modules/shared/login/login.component';

describe('DonationApiService', () => {
  let service: DonationApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports:[LoginComponent],
      providers:[DonationApiService]
    });
    service = TestBed.inject(DonationApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
