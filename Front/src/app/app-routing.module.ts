import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from "./Entities/Login/login.component";
import {SuppliersListComponent} from "./Entities/Suppliers/suppliers-list/suppliers-list.component";

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'supplier', component: SuppliersListComponent },
  { path: 'home', redirectTo: '', pathMatch: 'full' },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
