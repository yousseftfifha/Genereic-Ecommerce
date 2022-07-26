import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './Template/navbar/navbar.component';
import { SidebarComponent } from './Template/sidebar/sidebar.component';
import { FooterComponent } from './Template/footer/footer.component';
import { LoginComponent } from './Entities/Login/login.component';
import {FormsModule} from "@angular/forms";
import { HttpClientModule } from '@angular/common/http';
import { SuppliersComponent } from './Entities/Suppliers/suppliers.component';
import {ToastModule} from "primeng/toast";
import {ToolbarModule} from "primeng/toolbar";
import {FileUploadModule} from "primeng/fileupload";
import {TableModule} from "primeng/table";
import {DialogModule} from "primeng/dialog";
import {InputTextModule} from "primeng/inputtext";
import {DropdownModule} from "primeng/dropdown";
import {RippleModule} from "primeng/ripple";
import {ConfirmDialogModule} from "primeng/confirmdialog";
import {InputTextareaModule} from "primeng/inputtextarea";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {RadioButtonModule} from "primeng/radiobutton";
import {OrganizationChartModule} from "primeng/organizationchart";
import { OrganizationComponent } from './Entities/Organization/organization.component';
import {RouterModule} from "@angular/router";
import {CardModule} from "primeng/card";
import {DataViewModule} from "primeng/dataview";
import {RatingModule} from "primeng/rating";
import {ProductComponent} from "./Entities/Product/product.component";
import {InputNumberModule} from "primeng/inputnumber";
import {DetailComponent} from "./Entities/Detail/detail.component";
import {InformationComponent} from "./Entities/Information/information.component";
import {MouvementComponent} from "./Entities/Mouvement/mouvement.component";
import {CategoryComponent} from "./Entities/Category/category.component";
import { ProductExtraCostComponent } from './Entities/ProductExtraCost/product-extra-cost.component';
import { OrderCustomerComponent } from './Entities/OrderCustomer/order-customer.component';
import { OrderCustomerItemComponent } from './Entities/OrderCustomerItem/order-customer-item.component';
import {TooltipModule} from "primeng/tooltip";
import {ChartModule} from "primeng/chart";
import { OrderSupplierComponent } from './Entities/OrderSupplier/order-supplier.component';
import { OrderSupllierItemComponent } from './Entities/OrderSupllierItem/order-supllier-item.component';
import {SliderModule} from "primeng/slider";
import { DeliveryCustomerComponent } from './Entities/DeliveryCustomer/delivery-customer.component';
import { DeliveryCustomerItemComponent } from './Entities/DeliveryCustomerItem/delivery-customer-item.component';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SidebarComponent,
    FooterComponent,
    LoginComponent,
    SuppliersComponent,
    OrganizationComponent,
    ProductComponent,
    DetailComponent,
    MouvementComponent,
    InformationComponent,
    CategoryComponent,
    ProductExtraCostComponent,
    OrderCustomerComponent,
    OrderCustomerItemComponent,
    OrderSupplierComponent,
    OrderSupllierItemComponent,
    DeliveryCustomerComponent,
    DeliveryCustomerItemComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ToastModule,
    ToolbarModule,
    FileUploadModule,
    TableModule,
    DialogModule,
    InputTextModule,
    DropdownModule,
    RippleModule,
    ConfirmDialogModule,
    InputTextareaModule,
    BrowserAnimationsModule,
    RadioButtonModule,
    OrganizationChartModule,
    RouterModule,
    CardModule,
    DataViewModule,
    RatingModule,
    InputNumberModule,
    TooltipModule,
    ChartModule,
    SliderModule,

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
