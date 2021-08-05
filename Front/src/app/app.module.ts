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


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SidebarComponent,
    FooterComponent,
    LoginComponent,
    SuppliersComponent,
    OrganizationComponent,

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

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
