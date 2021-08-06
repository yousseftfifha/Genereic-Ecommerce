import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from "./Entities/Login/login.component";
import {SuppliersComponent} from "./Entities/Suppliers/suppliers.component";
import {OrganizationComponent} from "./Entities/Organization/organization.component";
import {ProductComponent} from "./Entities/Product/product.component";

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'product', component: ProductComponent },
  { path: 'supplier', component: SuppliersComponent },
  { path: 'home', component: OrganizationComponent },
  { path: 'home', redirectTo: '', pathMatch: 'full' },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
