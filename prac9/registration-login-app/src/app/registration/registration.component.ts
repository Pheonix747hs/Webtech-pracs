import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  firstName: string = '';
  lastName: string = '';
  username: string = '';
  password: string = '';

  constructor() { }

  ngOnInit(): void { }

  register() {
    // Implement registration logic (e.g., call a service to send data to backend)
    console.log('Registration details:', this.firstName, this.lastName, this.username, this.password);
    // Clear form fields after successful registration (optional)
    this.firstName = '';
    this.lastName = '';
    this.username = '';
    this.password = '';
  }
}

// Similar structure for login.component.ts with login logic and form handling
