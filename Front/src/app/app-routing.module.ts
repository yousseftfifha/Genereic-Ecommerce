import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from "./Entities/Login/login.component";
import {SuppliersComponent} from "./Entities/Suppliers/suppliers.component";
import {OrganizationComponent} from "./Entities/Organization/organization.component";
import {ProductComponent} from "./Entities/Product/product.component";
import {CategoryComponent} from "./Entities/Category/category.component";
import {OrderCustomerComponent} from "./Entities/OrderCustomer/order-customer.component";
import {OrderSupllierItem} from "./Entities/OrderSupllierItem/order-supllier-item";
import {OrderSupplierComponent} from "./Entities/OrderSupplier/order-supplier.component";
import {DeliveryCustomerComponent} from "./Entities/DeliveryCustomer/delivery-customer.component";

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'product', component: ProductComponent },
  { path: 'supplier', component: SuppliersComponent },
  { path: 'category', component: CategoryComponent },
  { path: 'order', component: OrderCustomerComponent },
  { path: 'ordersupplier', component: OrderSupplierComponent },
  { path: 'deliverycustomer', component: DeliveryCustomerComponent },
  { path: 'home', component: OrganizationComponent },
  { path: 'home', redirectTo: '', pathMatch: 'full' },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
