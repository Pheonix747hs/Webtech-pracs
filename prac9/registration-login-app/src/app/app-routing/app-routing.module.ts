import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from '../app.component';
import { RegistrationComponent } from '../registration/registration.component';
import { LoginComponent } from '../login/login.component';

const routes: Routes = [
  // Default path for the application (can be login or any page)
  { path: '', component: LoginComponent },
  // Path for the registration page
  { path: 'register', component: RegistrationComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], // Configure forRoot for the main application routing
  exports: [RouterModule]
})
export class AppRoutingModule { }
