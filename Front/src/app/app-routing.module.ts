import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {AppComponent} from "./app.component";
import {FrontComponent} from "./front/front.component";

const routes: Routes = [
  {path: "Home",component:AppComponent},
  {path: "Index",component:FrontComponent},

  {path: "",redirectTo: "Home",pathMatch: "full"}


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
